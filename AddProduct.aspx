<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMP.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="E_book.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Books</h2>
            <hr />

            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Book Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtBookName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Price"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>


            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Selling Price"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtsellPrice" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>


            <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Author Name"></asp:Label>
                <div class="col-md-3">
                     <asp:DropDownList ID="ddlAuthorName" OnSelectedIndexChanged="ddlAuthorName_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            
            <div class="form-group">
                    <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Edition Number"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlEdition" OnSelectedIndexChanged="ddlEdition_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                    <asp:Label ID="Label10" runat="server" CssClass="col-md-2 control-label" Text="Category"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label11" runat="server" CssClass="col-md-2 control-label" Text="Sub Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlSubCategory" CssClass="form-control" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                </div>
            </div>
            
            <div class="form-group">
                    <asp:Label ID="Label6" runat="server" CssClass="col-md-2 control-label" Text="Language"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlLanguage" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label12" runat="server" CssClass="col-md-2 control-label" Text="Quantity"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtQuantity" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
           </div>


            <div class="form-group">
                <asp:Label ID="Label7" runat="server" CssClass="col-md-2 control-label" Text="Description"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label8" runat="server" CssClass="col-md-2 control-label" Text="Book Details"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtBookDetails" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                    <asp:Label ID="Label9" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                    <div class="col-md-3">
                        <asp:FileUpload ID="img01" CssClass="form-control" runat="server" />
                    </div>
            </div>
            
            <div class="form-group">
                <asp:Label ID="Label14" runat="server" CssClass="col-md-2 control-label" Text="Free Delivery"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBox ID="chFD" runat="server" />
                </div>
            </div>


            <div class="form-group">
                <asp:Label ID="Label15" runat="server" CssClass="col-md-2 control-label" Text="7 Days Return"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBox ID="ch7Return" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label16" runat="server" CssClass="col-md-2 control-label" Text="COD"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBox ID="chCOD" runat="server" />
                </div>
            </div>

            <div>
                <div class="col-md-2"></div>
                <div class="col-md-6">
                     <asp:Button ID="btnAdd" CssClass="btn btn-primary" runat="server" Text="Add Book" OnClick="btnAdd_Click" />
                </div>
            </div>

        </div>
    </div>
    <br />
    <br />
    <br />
</asp:Content>
