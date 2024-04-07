<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ThemXe.aspx.cs" Inherits="WebXeMay.ThemXe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="margin-left: 40px"> Thêm Mới Sản Phẩm</h2>
    <hr />
     <div class="row mt-3 mb-2">
        <div class="col-md-2">Tên xe</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtTenxe" runat="server" TextMode="MultiLine" CssClass="form-control"  ></asp:TextBox>
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Dòng xe</div>
        <div class="col-md-10">
            <asp:DropDownList ID="dddongxe" runat="server" DataSourceID="dsDong" DataTextField="TenDongXe" DataValueField="MaDongXe"></asp:DropDownList>
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Nhà sản xuất</div>
        <div class="col-md-10">
            <asp:DropDownList ID="ddnhasx" runat="server" DataSourceID="dsNSX" DataTextField="TenNSX" DataValueField="MaNSX"></asp:DropDownList>
        </div>
    </div>
     <div class="row mt-3 mb-2">
        <div class="col-md-2">Giá</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtGia" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>
    </div> <div class="row mt-3 mb-2">
        <div class="col-md-2">Ngày Cập Nhật</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtNgayCapNhat" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row mt-3 mb-2">
        <div class="col-md-2">Hình</div>
        <div class="col-md-10">
            <asp:FileUpload ID="Fhinh" runat="server" />
        </div>
    </div>
 
   <div class="text-center">
   <asp:Button ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />
       </div>
<asp:Label ID="lbThongbao" runat="server"></asp:Label>

   <asp:SqlDataSource ID="dsDong" runat="server" ConnectionString="<%$ ConnectionStrings:QLXeConnectionString %>" SelectCommand="SELECT * FROM [DongXe]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsNSX" runat="server" ConnectionString="<%$ ConnectionStrings:QLXeConnectionString %>" SelectCommand="SELECT * FROM [NhaSanXuat]"></asp:SqlDataSource>
</asp:Content>
