<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemTour.aspx.cs" Inherits="WebDuLich.XemTour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>Trang xem tour</h2>
    <hr />

    <div class="form-inline text-center">
        Chọn địa điểm
        <asp:DropDownList ID="ddlDiaDiem" runat="server" CssClass="form-control" Width="200px"
            DataSourceID="odsDiaDiem" DataTextField="TenDiaDiem" DataValueField="MDD" AutoPostBack="True"></asp:DropDownList>
    </div>

    <div class="row" style="margin-top: 10px">
        <asp:Repeater ID="rptTour" runat="server" DataSourceID="odsTour">
            <ItemTemplate>
                <div class="col-md-4 text-center">
                    <img src='<%# Eval("hinh","/hinh_tour/{0}") %>' style="width: 300px" />  <br />
                    <%# Eval("tentour") %>    <br />
                    Giá:
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Dongia","{0: #,##0} vnđ") %>' ForeColor="#cc3300"></asp:Label>    <br />
                    Số ngày
                    <asp:Label ID="lbSoNgay" runat="server" Text='<%# Eval("songay") %>'></asp:Label>
                    Số đêm
                    <asp:Label ID="Label2" runat="server" Text='<%# int.Parse(Eval("songay").ToString()) -1  %>'
                        ForeColor="#cc3300" Font-Bold="true"></asp:Label>
                    <br />
                    <a href="DatTour.aspx?MaTour=<%# Eval("MaTour") %>" class="btn btn-success">Đặt tour </a>
                    <a href="XemChiTiet.aspx?MaTour=<%# Eval("MaTour") %>" class="btn btn-primary">Xem chi tiết </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:ObjectDataSource ID="odsDiaDiem" runat="server" SelectMethod="getAll" TypeName="WebDuLich.Models.DiaDiemDAO"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsTour" runat="server" SelectMethod="getByDiaDiem" TypeName="WebDuLich.Models.TourDAO">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlDiaDiem" Name="mdd" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>


</asp:Content>
