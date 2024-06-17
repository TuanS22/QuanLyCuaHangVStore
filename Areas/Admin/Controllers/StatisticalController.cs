using Microsoft.AspNetCore.Mvc;
using TTTN_ViettelStore.Models;
using TTTN_ViettelStore.Areas.Admin.Attributes;

namespace VStore.Areas.Admin.Controllers
{
	[Area("Admin")]
    [CheckLogin]
	public class StatisticalController : Controller
	{
		public MyDbContext db = new MyDbContext();
		public IActionResult Index()
		{
			return View();
		}

        public IActionResult Statistical()
        {
            return Json(true);
        }

        // THỐNG KÊ DOANH THU & LỢI NHUẬN
        [HttpGet]
        public IActionResult GetStatisticalPrice(string fromDate, string toDate)
        {
            var query = from order in db.Orders
                        join orderDetail in db.OrderDetail on order.Id equals orderDetail.OrderId
                        join product in db.Products on orderDetail.ProductId equals product.Id
                        select new
                        {
                            CreateTime = order.CreateTime,
                            Quantity = orderDetail.Quantity,
                            Price = orderDetail.Price,
                            OriginalPrice = product.OriginalPrice,
                        };

            if (!string.IsNullOrEmpty(fromDate))
            {
                DateTime startDate = DateTime.ParseExact(fromDate, "dd/MM", null);
                query = query.Where(item => item.CreateTime >= startDate);
            }

            if (!string.IsNullOrEmpty(toDate))
            {
                DateTime endDate = DateTime.ParseExact(toDate, "dd/MM", null);
                query = query.Where(item => item.CreateTime < endDate);
            }

            var result = query.GroupBy(item => item.CreateTime).Select(item => new
            {
                Date = item.Key.ToString("dd/MM"),
                Giagoc = item.Sum(a => a.Quantity * a.OriginalPrice),
                Giaban = item.Sum(a => a.Quantity * a.Price)
            }).Select(item => new
            {
                date = item.Date,
                doanhThu = item.Giaban,
                loiNhuan = item.Giaban - item.Giagoc
            }).ToList();
            return Json(new { Data = result });
        }

        // THỐNG KÊ SẢN PHẨM NÀO ĐÃ BÁN 
        [HttpGet]
        public IActionResult GetStatisticalProduct(string fromDate, string toDate)
        {
            var query = from order in db.Orders
                        join orderDetail in db.OrderDetail on order.Id equals orderDetail.OrderId
                        join product in db.Products on orderDetail.ProductId equals product.Id
                        select new
                        {
                            Name = product.Name,
                            Price = orderDetail.Price,
                            Quantity = orderDetail.Quantity,
                            CreateTime = order.CreateTime,
                        };

            if (!String.IsNullOrEmpty(fromDate))
            {
                DateTime startDate = DateTime.ParseExact(fromDate, "dd/MM", null);
                query = query.Where(item => item.CreateTime >= startDate);
            }

            if (!String.IsNullOrEmpty(toDate))
            {
                DateTime endDate = DateTime.ParseExact(toDate, "dd/MM", null);
                query = query.Where(item => item.CreateTime < endDate);
            }

            var groupedByDateAndName = query.GroupBy(item => new { item.CreateTime.Date, item.Name })
                                            .Select(group => new
                                            {
                                                Date = group.Key.Date.ToString("dd/MM"),
                                                Name = group.Key.Name,
                                                Quantity = group.Sum(item => item.Quantity),
                                                TotalPrice = group.Sum(item => item.Quantity * item.Price)
                                            }).ToList();

            // Kiểm tra và đảm bảo dữ liệu tồn tại trước khi nhóm lần hai
            if (!groupedByDateAndName.Any())
            {
                return Json(new { Data = new List<object>() });
            }

            var result = groupedByDateAndName.GroupBy(item => item.Name)
                                             .Select(group => new
                                             {
                                                 tensp = group.Key,
                                                 dates = group.Select(g => g.Date).ToList(),
                                                 Soluong = group.Sum(g => g.Quantity),
                                                 Tongtien = group.Sum(g => g.TotalPrice)
                                             }).ToList();

            return Json(new { Data = result });
        }
        
        // THỐNG KÊ TÀI KHOẢN USER ĐÃ MUA BAO NHIÊU
        [HttpGet]
        public IActionResult GetStatisticalUser(string fromDate, string toDate)
        {
            var query = from orderDetail in db.OrderDetail
                        join order in db.Orders on orderDetail.OrderId equals order.Id
                        join product in db.Products on orderDetail.ProductId equals product.Id
                        join user in db.Users on order.CustomerId equals user.Id
                        select new
                        {
                            Name = user.Name,
                            Email = user.Email,
                            Address = user.Address,
                            Quantity = orderDetail.Quantity,
                            Price = orderDetail.Price,
                            NameProduct = product.Name,
                            CreateTime = order.CreateTime,
                        };

            if (!String.IsNullOrEmpty(fromDate))
            {
                DateTime startDate = DateTime.ParseExact(fromDate, "dd/MM", null);
                query = query.Where(item => item.CreateTime >= startDate);
            }

            if (!String.IsNullOrEmpty(toDate))
            {
                DateTime endDate = DateTime.ParseExact(toDate, "dd/MM", null);
                query = query.Where(item => item.CreateTime < endDate);
            }

            var groupedByDateAndName = query.GroupBy(item => new { item.CreateTime.Date, item.Name, item.Email, item.Address, item.NameProduct })
                                            .Select(group => new
                                            {
                                                Date = group.Key.Date.ToString("dd/MM"),
                                                Name = group.Key.Name,
                                                Email = group.Key.Email,
                                                Address = group.Key.Address,
                                                NameProduct = group.Key.NameProduct,
                                                Quantity = group.Sum(item => item.Quantity),
                                                TotalPrice = group.Sum(item => item.Quantity * item.Price)
                                            }).ToList();

            // Kiểm tra và đảm bảo dữ liệu tồn tại trước khi nhóm lần hai
            if (!groupedByDateAndName.Any())
            {
                return Json(new { Data = new List<object>() });
            }

            var result = groupedByDateAndName.GroupBy(item => item.Name)
                                             .Select(group => new
                                             {
                                                 tenkh = group.Key,
                                                 email = group.Select(g => g.Email).FirstOrDefault(),
                                                 diachi = group.Select(g => g.Address).FirstOrDefault(),
                                                 dates = group.Select(g => g.Date).Distinct().ToList(),
                                                 Soluong = group.Sum(g => g.Quantity),
                                                 tensp = group.Select(g => g.NameProduct).ToList(),
                                                 Tongtien = group.Sum(g => g.TotalPrice)
                                             }).ToList();

            return Json(new { Data = result });
        }
    }
}
