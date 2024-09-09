<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="E_book.ViewBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .row{
        width:90%;
        text-align:center;
        margin:auto;
        
    }
    
    .BookName{
        font-size:15px;
        font-weight:600;
        line-height:15px;
        text-transform:uppercase;
        font-family:sans-serif;
    }
    .BookAuthor{
        font-size:13px;
        line-height:17px;
        font-family:sans-serif;
    }
    .BookPrice{
        font-size:14px;
        line-height:17px;
        font-weight:600;
        font-family:sans-serif;
    }
    .BookOGPrice{
        font-size:13px;
        line-height:17px;
        font-weight:400;
        font-family:sans-serif;
        text-decoration:line-through;
        color:dimgrey;
    }
    .BookPriceDiscount{
        font-size:13px;
        font-weight:400;
        font-family:sans-serif;
        color:deeppink;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <br />
    <b><asp:Label ID="lblSuccess" runat="server" CssClass="text-success"></asp:Label></b>
    <br />
    <h3>Choose Your Novel</h3>
    <hr />
    <div class="row">
    <asp:Repeater ID="rptrViewBooks" runat="server">
        <ItemTemplate>
    <div class="p-4 col-md-3">
        <a href="ViewBookData.aspx?BID=<%# Eval("BID") %>" style="text-decoration:none">
        <div class="thumbnail" style="width:280px; height:410px;">
            <img class="bookImg" src="Book_Cover/Image/<%# Eval("BID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" alt="<%# Eval("ImageName") %>"/>
            <div class="caption">
                <div class="BookName"><%# Eval("BName")%> </div>
                <div class="BookAuthor"><%# Eval("AName")%> </div>
                <div class="BookPrice">
                    <span class="BookOGPrice"><%# Eval("BPrice")%> ₹</span><br /><%# Eval("BSellingPrice") %> ₹<br />
                    <span class="BookPriceDiscount">(<%# Eval("DisCount") %> ₹ off)</span>
                </div>
            </div>
        </div>
       
    </div>
    </a>
  </ItemTemplate>
 </asp:Repeater>
</div>

</asp:Content>
