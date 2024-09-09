<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMP.Master" AutoEventWireup="true" CodeBehind="AddEdition.aspx.cs" Inherits="E_book.AddEdition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<br />
<br />
<div class="container">
    <div class="form-horizontal">
        <h2>Add Books Edition</h2>
        <hr />
        <div class="form-group">
            <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Edition"></asp:Label>
            <div class="col-md-3">
                <asp:TextBox ID="txtEdition" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEdition" runat="server" ErrorMessage="Please Enter Edition" ForeColor="Red" ControlToValidate="txtEdition"></asp:RequiredFieldValidator>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-md-2"></div>
            <div class="col-md-6">
                    <asp:Button ID="btnAddEdition" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="btnAddEdition_Click"/>
                </div>
            
        </div>

    </div>
    <h1>Edition</h1>
<hr />
<div class="panel panel-default">

    <div class="panel-heading">All Author</div>
    <asp:Repeater ID="rptrEdition" runat="server">
        <HeaderTemplate>
        <table class="table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Edition</th>
                    <th>Edit</th>
                </tr>
            </thead>

            <tbody>

        </HeaderTemplate>

        <ItemTemplate>
            
            <tr>
                <td><%# Eval("EdID") %></td>
                <td><%# Eval("Edition") %></td>
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
