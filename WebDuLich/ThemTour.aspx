<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemTour.aspx.cs" Inherits="WebDuLich.ThemTour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <div class="container">
        <h2 class="bg-primary text-white text-center p-2">THÊM MỚI TOUR</h2>
        <hr />

        <div class="form-group">
            <label for="ddlDiaDiem">Địa điểm</label>
            <asp:DropDownList ID="ddlDiaDiem" runat="server" CssClass="form-control" DataKeyNames="MaTour"
                DataSourceID="odsDiaDiem" DataTextField="TenDiaDiem" DataValueField="MDD"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="txtTenTour">Tên tour</label>
            <asp:TextBox ID="txtTenTour" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtChuongTrinh">Chương trình</label>
            <asp:TextBox ID="txtChuongTrinh" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
        </div>

        <div class="form-group row">
            <div class="col-md-6">
                <label for="txtSoNgay">Số ngày</label>
                <asp:TextBox ID="txtSoNgay" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="txtDonGia">Đơn giá</label>
                <asp:TextBox ID="txtDonGia" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label for="fuHinhDaiDien">Hình đại diện</label>
            <asp:FileUpload ID="fuHinhDaiDien" runat="server" CssClass="form-control" />
        </div>

        <asp:Button ID="btnThem" runat="server" CssClass="btn btn-primary" Text="Thêm" OnClick="btnThem_Click" />
    </div>

    <asp:ObjectDataSource ID="odsDiaDiem" runat="server"
        DataObjectTypeName="WebDuLich.Models.Tour" 
        InsertMethod="Insert"
        SelectMethod="getAll"  TypeName="WebDuLich.Models.DiaDiemDAO" ></asp:ObjectDataSource>

</asp:Content>

