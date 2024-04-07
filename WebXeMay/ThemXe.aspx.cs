using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebXeMay
{
    public partial class ThemXe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            // lấy giá trị chuỗi kết nối trong wed.config
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["QLXeConnectionString"].ConnectionString;
            // tạo đối tượng Connection
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();
            // tao cau sql de them ban tin
            string sql = "insert into Xe(TenXe, Dongia, AnhBia,Ngaycapnhat,Soluotxem,MaDongXe,MaNSX)" +
                " values (@tenxe, @dongia, @anhbia,@ngaydang,@soluotxem,@madongxe,@mansx)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            // truyen gia tri cho cac tham so trong cau lenh sql
            cmd.Parameters.AddWithValue("@tenxe", txtTenxe.Text);
            cmd.Parameters.AddWithValue("@dongia", txtGia.Text);
            if (Fhinh.HasFile)
            {
                // xu ly upload hinh
                string duong_dan = Server.MapPath("~/Hinh/") + Fhinh.FileName;
                Fhinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@anhbia", Fhinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@anhbia", "no_image.png");
            }
            cmd.Parameters.AddWithValue("@ngaydang", txtNgayCapNhat.Text);
            cmd.Parameters.AddWithValue("@madongxe", dddongxe.SelectedValue);
            cmd.Parameters.AddWithValue("@mansx", ddnhasx.SelectedValue);
            cmd.Parameters.AddWithValue("@soluotxem", 0);

            //thuc hien cau lenh truy van den CSDL
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("XemXe.aspx");
            else
                lbThongbao.Text = "Thao tác thêm tin thất bại";

        }
    }
}