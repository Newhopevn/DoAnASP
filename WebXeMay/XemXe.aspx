<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="XemXe.aspx.cs" Inherits="WebXeMay.XemXe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-inline">
        chọn danh mục:<asp:DropDownList ID="DRloai" runat="server" DataSourceID="dsDongxe" DataTextField="TenDongXe" DataValueField="MaDongXe" AutoPostBack="True">
        </asp:DropDownList>
    </div>


    <div class="row mt-3">
        <asp:Repeater ID="rqtXe" runat="server" DataSourceID="dsXe">
            <ItemTemplate>
                <div class=" col-md-3 mt-2 text-center">
                    <a href="#">
                        <img src="Hinh/<%# Eval("AnhBia") %>"style="max-width: 100%;height: 175px;object-fit:cover;width:100%"/>
                    </a>
                    <br />
                    <%# Eval("TenXe") %><br/>
                    Giá bán: <span class="price"><%# Eval("Dongia","{0:#,##0} VNĐ") %></span><br/>
                    <asp:Button ID="btnAddToCard" runat="server" Text="Add To Card" class="btn btn-success"/>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    


    <asp:SqlDataSource ID="dsDongxe" runat="server" ConnectionString="<%$ ConnectionStrings:QLXeConnectionString %>" SelectCommand="SELECT * FROM [DongXe]">
</asp:SqlDataSource>
    <asp:SqlDataSource ID="dsXe" runat="server" ConnectionString="<%$ ConnectionStrings:QLXeConnectionString %>" SelectCommand="SELECT * FROM [Xe] WHERE ([MaDongXe] = @MaDongXe)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DRloai" Name="MaDongXe" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
