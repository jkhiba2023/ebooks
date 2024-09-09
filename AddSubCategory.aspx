<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMP.Master" AutoEventWireup="true" CodeBehind="AddSubCategory.aspx.cs" Inherits="E_book.AddSubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <br />
        <br />
        <br />
<div class="container">
    <div class="form-horizontal">
        <h2>Add Sub Category</h2>
        <hr />
        <div class="form-group">
            <asp:Label ID="Label2" CssClass="col-md-2 control-label" runat="server" Text="Main CategoryID"></asp:Label>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlMainCatID" CssClass="form-control" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainCatID" runat="server" ErrorMessage="Please Enter Main CategoryID" ForeColor="Red" ControlToValidate="ddlMainCatID"></asp:RequiredFieldValidator><br />
        </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Sub Category"></asp:Label>
            <div class="col-md-3">
                <asp:TextBox ID="txtSubCategory" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCategory" runat="server" ErrorMessage="Please Enter Sub Category" ForeColor="Red" ControlToValidate="txtSubCategory"></asp:RequiredFieldValidator>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-md-2"></div>
            <div class="col-md-6">
                    <asp:Button ID="btnAddSubCategory" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="btnAddSubCategory_Click"/>
                </div>
            
        </div>

    </div>
        <h1>Sub-Categories</h1>
<hr />
<div class="panel panel-default">

    <div class="panel-heading">All Sub Categories</div>
    <asp:Repeater ID="rptrSubCategories" runat="server">
        <HeaderTemplate>
        <table class="table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Sub-Categories</th>
                    <th>Categories</th>
                    <th>Edit</th>
                </tr>
            </thead>

            <tbody>

        </HeaderTemplate>

        <ItemTemplate>
            
            <tr>
                <td><%# Eval("SubCatID") %></td>
                <td><%# Eval("SubCatName") %></td>
                <td><%# Eval("CatName")%></td>
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
