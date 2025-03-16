<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QTTour.aspx.cs" Inherits="WebDuLich.QTTour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    
    <h2>Trang quản trị tour</h2>
    <hr />
    <div class="row" style="margin-bottom:10px">
         <div class="col-md-6">
             <div class="form-inline">
                Tên tour <asp:TextBox ID="txtTenTour" runat="server" CssClass="form-control" Width="200px"></asp:TextBox>
                 <asp:Button ID="btTraCuu" runat="server" Text="Tra cứu" CssClass="btn btn-primary" />
             </div>
         </div>
         <div class="col-md-6 text-right">
              <a href="ThemTour.aspx" class="btn btn-success">Thêm tour mới</a>
         </div>
    </div>

    <asp:GridView ID="gvTour" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" DataSourceID="odsTour" 
        CssClass="table table-bordered" DataKeyNames="MaTour">
        <Columns>
            <asp:BoundField DataField="TenTour" HeaderText="TenTour" SortExpression="TenTour" ReadOnly="true" />     
            <asp:ImageField DataImageUrlField="Hinh" DataImageUrlFormatString="~/hinh_tour/{0}" ControlStyle-Width="150px" HeaderText="Hình ảnh"  ReadOnly="true">
<ControlStyle Width="150px"></ControlStyle>
            </asp:ImageField>
            <asp:BoundField DataField="Dongia" HeaderText="Dongia" DataFormatString="{0: #,##0} đồng" SortExpression="Dongia" />
            <asp:BoundField DataField="SoNgay" HeaderText="SoNgay" SortExpression="SoNgay" />      
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button" />

        </Columns>
    </asp:GridView>
  
    <asp:ObjectDataSource ID="odsTour" runat="server"
        DataObjectTypeName="WebDuLich.Models.Tour" 
        DeleteMethod="Delete" 
        SelectMethod="getTheoTen" 
        TypeName="WebDuLich.Models.TourDAO" 
        UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtTenTour" Name="tentour" PropertyName="Text" Type="String"  />
        </SelectParameters>
    </asp:ObjectDataSource>
   
</asp:Content>
