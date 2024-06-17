using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using TTTN_ViettelStore.Models;
using VStore.Models;
using VStore.Service;

namespace TTTN_ViettelStore.Controllers
{
    public class CartController : Controller
    {
        public MyDbContext db = new MyDbContext();

        private readonly IVnPayService _vnPayservice;
        public CartController(IVnPayService vnPayservice)
        {
            _vnPayservice = vnPayservice;
        }

        // hiển thị danh sách các sản phẩm trong giỏ hàng
        public IActionResult Index()
        {
            List<Item> list_cart = new List<Item>();
            string json_cart = HttpContext.Session.GetString("cart");

            if(!String.IsNullOrEmpty(json_cart))
            {
                // convert chuỗi json
                list_cart = JsonConvert.DeserializeObject<List<Item>>(json_cart);
            }   
            
            return View(list_cart);
        }

        // thêm sản phẩm vào giỏ hàng
        public IActionResult Buy(int id)
        {
            // gọi hàm CartAdd (trong class Cart) để thêm sản phẩm
            Cart.CartAdd(HttpContext.Session, id);
            // di chuyển đến action Index
            return RedirectToAction("Index");
        }

        // update số lượng sản phẩm
        public IActionResult Update()
        {
            List<Item> shopping_cart = new List<Item>();
            string json_cart = HttpContext.Session.GetString("cart");
            if (!String.IsNullOrEmpty(json_cart))
            {
                // convert chuỗi json
                shopping_cart = JsonConvert.DeserializeObject<List<Item>>(json_cart);
            }
            // duyệt các phần tử
            foreach (var cart_item in shopping_cart)
            {
                // lấy số lượng sản phẩm tử thẻ input
                int new_quantity = Convert.ToInt32(Request.Form["product_" + cart_item.ProductRecord.Id]);
                // gọi hàm cập nhật lại số lượng sản phẩm
                Cart.CartUpdate(HttpContext.Session, cart_item.ProductRecord.Id, new_quantity);
            }
            // di chuyển đến action Index
            return RedirectToAction("Index");
        }

        // Xóa từng sản phẩm
        public IActionResult Remove(int id)
        {
            Cart.CartRemove(HttpContext.Session, id);
            // di chuyển đến action Index
            return RedirectToAction("Index");
        }

        // Xóa toàn bộ sản phẩm
        public IActionResult Destroy()
        {
            Cart.CartDestroy(HttpContext.Session);
            // di chuyển action đến Index
            return Redirect("/Cart/Index?notify=destroy-success");
        }

        // thanh toán đơn hàng thông qua hàm checkout
        public IActionResult CheckOut()
        {
            // nếu user chưa login thì di chuyển đến login 
            if(String.IsNullOrEmpty(HttpContext.Session.GetString("user_id")))
            {
                return Redirect("/Account/Login");
            }    
            else
            {
                // lấy id của user
                int user_id = Convert.ToInt32(HttpContext.Session.GetString("user_id"));
                double totalAmount = Cart.CalculateTotalAmount(HttpContext.Session); // lấy giá trị tổng tiền từ Cart
                Cart.CartCheckOut(HttpContext.Session, user_id, totalAmount); // lưu vào database
            }
            // di chuyển đến action Index
            return Redirect("/Cart/Index?notify=checkout-success");
        }

        // thanh toán bằng VnPay
        public IActionResult CheckOutVnPay(ItemUsers model, string payment = "COD")
        {
            // nếu user chưa login thì di chuyển đến login 
            if (String.IsNullOrEmpty(HttpContext.Session.GetString("user_id")))
            {
                return Redirect("/Account/Login");
            }
            else
            {
                // lấy id của user
                int user_id = Convert.ToInt32(HttpContext.Session.GetString("user_id"));
                double totalAmount = Cart.CalculateTotalAmount(HttpContext.Session); // Tính tổng số tiền từ Cart

                if (payment == "VnPay")
                {
                    var vnPayModel = new VnPaymentRequestModel
                    {
                        Amount = totalAmount,
                        CreatedDate = DateTime.Now,
                        Description = $"{model.Name} {model.Email}",
                        FullName = model.Name,
                        OrderId = new Random().Next(1000, 100000)
                    };

                    string paymentUrl = _vnPayservice.CreatePaymentUrl(HttpContext, vnPayModel);
                    HttpContext.Session.SetString("PendingOrderTotalAmount", totalAmount.ToString());
                    HttpContext.Session.SetInt32("PendingCustomerId", user_id);
                    return Redirect(paymentUrl);
                }
                else
                {
                    int orderId = Cart.CartCheckOut(HttpContext.Session, user_id, totalAmount); // Lưu order vào database
                    return RedirectToAction("Index", "Cart");
                }
            }
        }

        public IActionResult PaymentCallBack()
        {
            // quay lại VnPayService hàm PaymentExecute để lấy thông tin về PaymentCallBack hiển thị
            var response = _vnPayservice.PaymentExecute(Request.Query);

            if (response == null || response.VnPayResponseCode != "00")
            {
                //TempData["Message"] = $"Lỗi thanh toán VnPay: {response?.VnPayResponseCode}";
                TempData["Message"] = "Giao dịch không thành công do: Khách hàng hủy giao dịch";
                TempData["MessageTime"] = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                return RedirectToAction("PaymentFail");
            }
            else
            {
                double totalAmount = Convert.ToDouble(HttpContext.Session.GetString("PendingOrderTotalAmount"));
                int user_id = HttpContext.Session.GetInt32("PendingCustomerId").Value;
                int orderId = Cart.CartCheckOut(HttpContext.Session, user_id, totalAmount); // Lưu đơn hàng chỉ khi thanh toán thành công

                ViewBag.Message = "Thanh toán VnPay thành công";
                ViewBag.TransactionId = response.TransactionId;
                ViewBag.OrderId = response.OrderId;
                ViewBag.Amount = response.Amount;
                ViewBag.BankCode = response.BankCode;
                ViewBag.CreatedTime = response.CreatedTime;

                return View("PaymentSuccess");
            }
        }

        public IActionResult PaymentFail()
        {
            return View();
        }

        public IActionResult PaymentSuccess()
        {
            return View();
        }
    }
}
