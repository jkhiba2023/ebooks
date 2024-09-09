<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="E_book.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .signin{
            text-decoration:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Section: Design Block -->
<section>
  <!-- Jumbotron -->
       <div class="px-4 py-5 px-md-6 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
 <div class="container">
  <div class="row gx-lg-5 align-items-center">
    <div class="col-lg-6 mb-5 mb-lg-0">
      <h1 class="my-5 display-3 fw-bold ls-tight">
        Welcome To <br />
        <span class="text-primary"><i class="fa-solid fa-book"> Book Walla</i></span>
      </h1>
      <p style="color: hsl(217, 10%, 50.8%)">
       <q>Education Is One Thing That No One Can Take Away From You.</q>
      </p>
    </div>
  <div class="col-lg-6 mb-5 mb-lg-0">
<div class="card">
  <div class="card-body py-5 px-md-5">
    <table>
      <!-- 2 column grid layout with text inputs for the first and last names -->
      <div class="row">
          <p><b>Already Have Account?</b> <a href="Signin.aspx" class="signin">Sign In</a></p>
          <asp:Label ID="lblMsg" runat="server"></asp:Label>
        <div class="col-md-6 mb-4">
          <div data-mdb-input-init class="form-outline">
            <asp:TextBox ID="txtUname" runat="server" placeholder="Create Username" class="form-control"></asp:TextBox>

          </div>
        </div>

          <div class="col-xs-11 mb-4">
          <div data-mdb-input-init class="form-outline">
              <asp:TextBox ID="txtName" runat="server" placeholder="Enter Your Full Name" class="form-control"></asp:TextBox>

          </div>
          </div>

          <div class="col-xs-11 mb-4">
          <div data-mdb-input-init class="form-outline">
              <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Your Mail ID" class="form-control" TextMode="Email"></asp:TextBox>

          </div>
          </div>
          
        <div class="col-md-6 mb-4">
          <div data-mdb-input-init class="form-outline">
            <asp:TextBox ID="txtPass" runat="server" placeholder="Create Your Password" class="form-control" TextMode="Password"></asp:TextBox>

          </div>
        </div>
       
          <div class="col-md-6 mb-4">
          <div data-mdb-input-init class="form-outline">
              <asp:TextBox ID="txtCPass" runat="server" placeholder="Re-Enter Confirm Pass" class="form-control" TextMode="Password"></asp:TextBox>

           </div>
          </div>
     
      <!-- Submit button -->
        &nbsp;
        <asp:Button ID="btnSignUp" runat="server" Text="Signup" class="btn btn-primary btn-block mb-4" OnClick="btnSignUp_Click"/>
        
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-primary btn-block mb-4" OnClick="btnCancel_Click"/>

        <h6>By clicking Submit, you agree to our <a href="#" style="text-decoration:none;">Terms</a>, <a href="#" style="text-decoration:none;">Privacy Policy</a> and <a href="#" style="text-decoration:none;">Cookies Policy</a> .</h6>
          </div>    
          </table>
          </div>
      </div>
      </div>
     </div>
  </div>
  </div>
  <!--- Sign Up End --->
  <!-- Jumbotron -->
</section>
<!-- Section: Design Block -->
</asp:Content>
