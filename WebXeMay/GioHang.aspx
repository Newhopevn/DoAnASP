<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="WebXeMay.GioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Giỏ hàng</h1>
    <asp:GridView ID="gvGioHang" runat="server" OnRowDeleting="gvGioHang_RowDeleting" OnRowUpdating="gvGioHang_RowUpdating"
        CssClass="table table-bordered" AutoGenerateColumns="False"
        DataKeyNames="masp" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:ImageField ItemStyle-HorizontalAlign="Center" DataImageUrlField="hinh"
                DataImageUrlFormatString="Hinh/{0}"
                HeaderText="Ảnh sản phẩm" ControlStyle-Width="150px">
<ControlStyle Width="150px"></ControlStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:ImageField>
            <asp:BoundField HeaderText="Tên sản phẩm" DataField="tensp" />
            <asp:BoundField HeaderText="Đơn giá" DataField="DonGia"
                DataFormatString="{0:#,##0}đ" />
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <asp:TextBox ID="txtSoLuong" TextMode="Number" runat="server"
                        CssClass="form-control text-center" Width="100px" Text='<%# Eval("soluong")%>'>
                    </asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Thành tiền" DataField="Thanhtien"
                DataFormatString="{0:#,##0}đ" />
           
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton  ID="btDelete"  runat="server" CommandName="Delete" CssClass="btn btn-danger"
                > Delete</asp:LinkButton>
                    <asp:LinkButton ID="btUpdate" runat="server" CommandName="Update"  CssClass="btn btn-secondary"
                        >Update </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <EmptyDataTemplate>
            <div class="alert alert-info">
                Chưa có sản phẩm trong giỏ
            </div>
        </EmptyDataTemplate>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <div class="row">
        <div class="col-md-6">
            <a href="ThuCung.aspx" class="btn btn-info">Tiếp tục mua hàng</a>
        </div>
        <div class="col-md-6 text-right">
            <asp:Label ID="lbTongTien" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row" style="padding-bottom: 10px">
        <div class="col-md-12 text-right">

            <asp:Button ID="btDatHang" runat="server" Text="Đặt hàng" CssClass="btn btn-success" />

        </div>
    </div>
</asp:Content>
