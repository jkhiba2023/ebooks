<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewBookData.aspx.cs" Inherits="E_book.ViewBookData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

<div class="ddtl">
    <div style="padding-top:50px">
        <div class="col-md-5">
            <asp:Repeater ID="rptrImage" runat="server">
                <ItemTemplate>
            <div style="max-width:480px" class="thumbnail">
                <img style="width:480px;height:480px" class="bookImg" src="Book_Cover/Image/<%# Eval("BID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>"/>
            </div>
                    </ItemTemplate>
                </asp:Repeater>
        </div>


        <div class="col-md-7">
            <asp:Repeater ID="rptrBookDetails" runat="server">
                <ItemTemplate>
            <div class="divDet1">
                <h1 class="proNameView"><%# Eval("BName") %></h1>
                <span class="proOGPriceView">₹ <%# Eval("BPrice") %></span><br />
                <span class="proPriceDiscount">₹ <%# string.Format("{0}",Convert.ToInt64(Eval("BPrice"))-Convert.ToInt64(Eval("BSellingPrice"))) %></span>
                <p class="proPriceView">₹ <%# Eval("BSellingPrice") %></p>
            </div>
            <div class="divDet1">
                <asp:Button ID="btnAddtoCart" runat="server" CssClass="CartButton" Text="ADD TO CART" OnClick="btnAddtoCart_Click"/>
            </div>
            <div>
                <h5 class="h5size">Description</h5>
                <p><%# Eval("BDescription") %></p>

                <h5 class="h5size">Product Details</h5>
                    <p><%# Eval("BBookDetails") %></p>     
            </div>
            <div class="h5size">
                <p><%# ((int)Eval("FreeDelivery")==1)? "Free Delivery": "" %></p>
                <p><%# ((int)Eval("7DayReturn")==1)? "7 Days Return": "" %></p>
                <p><%# ((int)Eval("COD")==1)? "Cash on Delivery": "" %></p>
            </div>
        </div>
        </ItemTemplate>
        </asp:Repeater>
    </div> 
</div>
</asp:Content>
