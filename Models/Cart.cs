﻿using Microsoft.AspNetCore.Http;
//muon su dung thu vien jSon thi phai them dong duoi
using Newtonsoft.Json;

namespace TTTN_ViettelStore.Models
{
    public class Cart
    {
        protected static readonly MyDbContext db = new MyDbContext();
        //------        
        public static T GetObjectFromJson<T>(ISession session, string key)
        {
            var value = session.GetString(key);
            return value == null ? default(T) : JsonConvert.DeserializeObject<T>(value);
        }
        //------
        //lay gio hang dang ton tai
        public static List<Item> GetCart(ISession session)
        {
            //JsonConvert.DeserializeObject<T>("cart")
            List<Item> cart = Cart.GetObjectFromJson<List<Item>>(session, "cart");
            return cart;
        }
        //add item to cart
        public static void CartAdd(ISession session, int id)
        {
            //neu gio hang chua ton tai
            if (Cart.GetObjectFromJson<List<Item>>(session, "cart") == null)
            {
                List<Item> cart = new List<Item>();
                //lay mot ban ghi trong table Products
                ItemProducts item = db.Products.Where(tbl => tbl.Id == id).FirstOrDefault();
                //them ban ghi vua lay vao gio hang bang cach goi ham CartAdd, soluong = 1
                //cart <=> List<Item>
                cart.Add(new Item { ProductRecord = item, Quantity = 1 });
                //sau khi them san pham vao gio hang, convert gio hang ra thanh chuoi json de gan vao bien session
                session.SetString("cart", JsonConvert.SerializeObject(cart));
            }
            //neu gio hang da ton tai
            else
            {
                List<Item> cart = Cart.GetObjectFromJson<List<Item>>(session, "cart");

                int index = Cart.isExist(session, id);
                if (index != -1)
                {
                    cart[index].Quantity++;
                }
                else
                {
                    ItemProducts item = db.Products.Where(tbl => tbl.Id == id).FirstOrDefault();
                    cart.Add(new Item { ProductRecord = item, Quantity = 1 });
                }
                session.SetString("cart", JsonConvert.SerializeObject(cart));
            }
        }
        //remove item in cart
        public static void CartRemove(ISession session, int id)
        {
            //convert chuoi json thanh List<Item>
            List<Item> cart = Cart.GetObjectFromJson<List<Item>>(session, "cart");
            //lay vi tri cua phan tu muon xoa bang cach goi ham isExists -> tra ve vi tri cua phan tu muon xoa
            int index = isExist(session, id);
            //goi ham xoa phan tu trong gio hang
            cart.RemoveAt(index);
            session.SetString("cart", JsonConvert.SerializeObject(cart));
        }
        //remove all item in cart
        public static void CartDestroy(ISession session)
        {
            //xoa toan bo gio hang <=> khoi tao lai gio hang
            List<Item> cart = new List<Item>();
            session.SetString("cart", JsonConvert.SerializeObject(cart));
        }
        public static void CartUpdate(ISession session, int id, int quantity)
        {
            //convert chuoi json thanh List<Item>
            List<Item> cart = Cart.GetObjectFromJson<List<Item>>(session, "cart");
            //---
            //duyet tung phan tu cua gio hang, sau do update lai so luong tuong ung voi id, quantity truyen vao
            for (int i = 0; i < cart.Count; i++)
            {
                if (cart[i].ProductRecord.Id == id)
                {
                    cart[i].Quantity = quantity;
                }
            }
            //---
            session.SetString("cart", JsonConvert.SerializeObject(cart));
        }
        private static int isExist(ISession session, int id)
        {
            //convert chuoi json thanh List<Item>
            List<Item> cart = Cart.GetObjectFromJson<List<Item>>(session, "cart");
            //duyet tung phan tu cua session array, neu phan tu nao co id trung voi id truyen vao thi se tra ve chi so cua phan tu do (chi so chay tu 0 den n)
            for (int i = 0; i < cart.Count; i++)
            {
                if (cart[i].ProductRecord.Id == id)
                {
                    return i;
                }
            }
            return -1;
        }
        public static double CartTotal(ISession session)
        {
            List<Item> items_cart = Cart.GetCart(session);
            if (items_cart != null)
            {
                double total = 0;
                foreach (var item in items_cart)
                {
                    double itemTotal = item.Quantity * (item.ProductRecord.Price - (item.ProductRecord.Price * item.ProductRecord.Discount) / 100);
                    total += Math.Round(itemTotal, 2);
                }
                return total;
            }
            else
                return 0;
        }

        // tính tổng tiền đơn hàng
        public static double CalculateTotalAmount(ISession session)
        {
            List<Item> _cart = Cart.GetCart(session);
            double totalAmount = _cart.Sum(tbl => (tbl.ProductRecord.Price - (tbl.ProductRecord.Price * tbl.ProductRecord.Discount) / 100) * tbl.Quantity);
            return totalAmount;
        }

        // check và lưu đơn hàng
        public static int CartCheckOut(ISession session, int customer_id, double totalAmount)
        {
            //khởi tạo đối tượng thao tác csdl
            MyDbContext db = new MyDbContext();
            List<Item> _cart = Cart.GetCart(session);

            //insert du lieu vao table Orders
            ItemOrders _RecordOrder = new ItemOrders();
            _RecordOrder.CustomerId = customer_id;
            _RecordOrder.CreateTime = DateTime.Now;
            _RecordOrder.Price = totalAmount;

            // lưu vào Order
            db.Orders.Add(_RecordOrder);
            db.SaveChanges();
            //lay id vua insert
            int order_id = _RecordOrder.Id;

            //duyet cac san pham trong session, moi phan tu se add thanh 1 ban ghi trong OrdersDetail
            foreach (var item in _cart)
            {
                ItemOrderDetail _RecordOrdersDetail = new ItemOrderDetail();
                _RecordOrdersDetail.OrderId = order_id;
                _RecordOrdersDetail.ProductId = item.ProductRecord.Id;
                _RecordOrdersDetail.Price = item.ProductRecord.Price - (item.ProductRecord.Price * item.ProductRecord.Discount) / 100;
                _RecordOrdersDetail.Quantity = item.Quantity;
                
                // lưu vào OrderDetail
                db.OrderDetail.Add(_RecordOrdersDetail);
                db.SaveChanges();
            }
            //xoa tat cac cac phan tu trong gio hang
            Cart.CartDestroy(session);
            return order_id;
        }
        //lấy số sản phẩm trong giỏ hàng
        public static int CartQuantity(ISession session)
        {
            List<Item> items_cart = Cart.GetCart(session);
            if (items_cart != null)
            {
                return items_cart.Count;
            }
            else
                return 0;
        }
    }
}
