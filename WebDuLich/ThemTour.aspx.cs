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

        protected void btXuLy_Click(object sender, EventArgs e)
        {
            try
            {
                int mdd = int.Parse(ddlDiadiem.SelectedValue);
                string tentour = txtTen.Text;
                string chuongtrinh = txtChuongTrinh.Text;
                int dongia = int.Parse(txtDongia.Text);
                int songay = int.Parse(txtSoNgay.Text);

                //xu ly upload file anh
                string hinh = FHinh.FileName;
                string path = Server.MapPath("~/hinh_tour") + "/" + FHinh.FileName;
                FHinh.SaveAs(path);

                //tao doi tuong can them 
                Tour tour = new Tour { TenTour = tentour, ChuongTrinh = chuongtrinh, Dongia = dongia, SoNgay = songay, MDD = mdd, Hinh = hinh };
                //goi phuong thuc tu lop DAO de them vao CSDL
                tourDAO.Insert(tour);

                lbThongBao.Text = "Thao tác thêm tour thành công";

            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Thao tác thêm tour thất bại";

            }

        }
    }
}