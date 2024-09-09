<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMP.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="E_book.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <br />
        <br />
        <br />
<div class="container">
    <div class="form-horizontal">
        <h2>Add Category</h2>
        <hr />
        <div class="form-group">
            <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Category"></asp:Label>
            <div class="col-md-3">
                <asp:TextBox ID="txtCategory" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server" ErrorMessage="Please Enter Category" ForeColor="Red" ControlToValidate="txtCategory"></asp:RequiredFieldValidator>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-md-2"></div>
            <div class="col-md-6">
                    <asp:Button ID="btnAddCategory" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="btnAddCategory_Click"/>
                </div>
            
        </div>

    </div>

    <h1>Categories</h1>
<hr />
<div class="panel panel-default">

    <div class="panel-heading">All Categories</div>
    <asp:Repeater ID="rptrCategories" runat="server">
        <HeaderTemplate>
        <table class="table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Categories</th>
                    <th>Edit</th>
                </tr>
            </thead>

            <tbody>

        </HeaderTemplate>

        <ItemTemplate>
            
            <tr>
                <td><%# Eval("CatID") %></td>
                <td><%# Eval("CatName") %></td>
                <td>Edit</td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                </tbody>

            </table>
        </FooterTemplate>

    </asp:Repeater>
    
        
        
       

</div>

</div>
</asp:Content>
