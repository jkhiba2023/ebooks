<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMP.Master" AutoEventWireup="true" CodeBehind="AddLanguage.aspx.cs" Inherits="E_book.AddLanguage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
        <div class="container">
     <div class="form-horizontal">
         <h2>Add Language</h2>
         <hr />

         
         <div class="form-group">
             <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Language"></asp:Label>
             <div class="col-md-3">
                 <asp:TextBox ID="txtLanguage" CssClass="form-control" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtLanguage" runat="server" ErrorMessage="Please Enter Langauge" ForeColor="Red" ControlToValidate="txtLanguage"></asp:RequiredFieldValidator>
             </div>
         </div>


         <div class="form-group">
             <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Author Name"></asp:Label>
             <div class="col-md-3">
                  <asp:DropDownList ID="ddlAuthorName" CssClass="form-control" runat="server"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorAuthorName" runat="server" ErrorMessage="Please choose the Author" ForeColor="Red" ControlToValidate="ddlAuthorName"></asp:RequiredFieldValidator>
             </div>
         </div>


         <div class="form-group">
                 <asp:Label ID="Label10" runat="server" CssClass="col-md-2 control-label" Text="Category"></asp:Label>
                 <div class="col-md-3">
                     <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server"  OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"  AutoPostBack="true"></asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server" ErrorMessage="Please choose the Category" ForeColor="Red" ControlToValidate="ddlCategory"></asp:RequiredFieldValidator>
                 </div>
         </div>

         <div class="form-group">
             <asp:Label ID="Label11" runat="server" CssClass="col-md-2 control-label" Text="Sub Category"></asp:Label>
             <div class="col-md-3">
                 <asp:DropDownList ID="ddlSubCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCategory" runat="server" ErrorMessage="Please choose the SubCategory" ForeColor="Red" ControlToValidate="ddlSubCategory"></asp:RequiredFieldValidator>
             </div>
         </div>

         <div class="form-group">
            <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Edition"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlEdition" CssClass="form-control" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEdition" runat="server" ErrorMessage="Please choose the Author" ForeColor="Red" ControlToValidate="ddlEdition"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div>
             <div class="col-md-2"></div>
             <div class="col-md-6">
                  <asp:Button ID="btnAddLanguage" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="btnAddLanguage_Click" />
             </div>
         </div>

     </div>
                    <h1>Language</h1>
<hr />
<div class="panel panel-default">

    <div class="panel-heading">All Languages</div>
    <asp:Repeater ID="rptrLanguages" runat="server">
        <HeaderTemplate>
        <table class="table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Language</th>
                    <th>AuthorName</th>
                    <th>Category</th>
                    <th>SubCategory</th>
                    <th>Edition</th>
                    <th>Edit</th>
                </tr>
            </thead>

            <tbody>

        </HeaderTemplate>

        <ItemTemplate>
            
            <tr>
                <td><%# Eval("LanguageID") %></td>
                <td><%# Eval("LanguageName")%></td>
                <td><%# Eval("AuthorName")%></td>
                <td><%# Eval("CatName")%></td>
                <td><%# Eval("SubCatName")%></td>
                <td><%# Eval("Edition")%></td>
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
<br />
<br />
<br />
<br />
</asp:Content>
