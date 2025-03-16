using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebDuLich.Models;


namespace WebDuLich
{
    public partial class ThemTour : System.Web.UI.Page
    {
        TourDAO tourDAO = new TourDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try { 
            string diaDiem = ddlDiaDiem.SelectedValue;
            string tenTour = txtTenTour.Text;
            string chuongTrinh = txtChuongTrinh.Text;
            int soNgay = int.Parse(txtSoNgay.Text);
            int donGia = int.Parse(txtDonGia.Text);
            string hinhAnh = fuHinhDaiDien.HasFile ? fuHinhDaiDien.FileName : "Chưa chọn file";

            Tour tour = new Tour
            {
                
                TenTour = tenTour,
                ChuongTrinh = chuongTrinh,
                SoNgay = soNgay,
                Dongia = donGia,
                Hinh = hinhAnh
            };

            int result = tourDAO.Insert(tour);
            if (result > 0)
            {
                Response.Write("<script>alert('Thêm tour thành công!'); window.location='DanhSachTour.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Thêm tour thất bại!');</script>");
            }
        }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Lỗi: " + ex.Message + "');</script>");
            }
}
    }
}