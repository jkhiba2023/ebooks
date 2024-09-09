<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMP.Master" AutoEventWireup="true" CodeBehind="AddAuthor.aspx.cs" Inherits="E_book.AddAuthor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Authors</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Authors Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtAuthor" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAuthorName" runat="server" ErrorMessage="Please Enter Author Name" ForeColor="Red" ControlToValidate="txtAuthor"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                        <asp:Button ID="btnAddAuthor" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="btnAddAuthor_Click"/>
                    </div>
                
            </div>

        </div>
        <h1>Author</h1>
        <hr />
        <div class="panel panel-default">

            <div class="panel-heading">All Author</div>
            <asp:Repeater ID="rptrAuthor" runat="server">
                <HeaderTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Author</th>
                            <th>Edit</th>
                        </tr>
                    </thead>

                    <tbody>

                </HeaderTemplate>

                <ItemTemplate>
                    
                    <tr>
                        <td><%# Eval("AuthID") %></td>
                        <td><%# Eval("AuthorName") %></td>
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
