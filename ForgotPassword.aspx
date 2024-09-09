<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="E_book.Forgot_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #f0f0f0; /* Set a background color for the body */
    }
    .body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 94vh; /* Full viewport height */
        width:320px;
        margin:auto;
    }
    .forgot_pass {
        text-align: center;
        padding: 20px;
        background-color: #fff; /* White background for the form */
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Box shadow for a slight depth effect */
        width: 100%;
        max-width: 400px; /* Maximum width for better readability on larger screens */
    }
    .txmail {
        border-radius: 6px;
        height: 38px;
        width: calc(100% - 20px); /* Make input box full width minus padding */
        max-width: 270px;
        text-align: center;
        margin: 8px auto; /* Center horizontally with margin */
        box-sizing: border-box;
        border: 1px solid #ccc; /* Add a border for better visibility */
        padding: 8px;
        font-size: 14px; /* Adjust font size for better readability */
    }
    h2 {
        color: #0D6EFD;
    }
    .btnsent {
        display: block;
        width: 100%;
        max-width: 270px;
        margin: 0 auto;
        padding: 10px;
        border-radius: 6px;
        background-color: #0D6EFD;
        color: #fff;
        border: none;
        cursor: pointer;
        font-size: 16px;
    }

    @media (max-width: 600px) {
        .forgot_pass {
            padding: 10px;
        }
        .txmail {
            width: calc(100% - 16px);
            max-width: 100%;
            font-size: 12px;
        }
        .btnsent {
            font-size: 14px;
            padding: 8px;
        }
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
    <div class="forgot_pass">
        <h2>Recover Password</h2>
        <hr />
        <h4 style="color:#0D6EFD;">Enter Mail ID</h4>
        <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label><br />
        <asp:TextBox ID="txtEmailID" runat="server" CssClass="txmail" placeholder="Enter Your Register Email ID" BorderStyle="Double"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Enter Your Register Email" ForeColor="Red" ControlToValidate="txtEmailID"></asp:RequiredFieldValidator>
        
        <asp:Button ID="btnResetPass" runat="server" CssClass="btnsent" Text="Send" OnClick="btnsent_Click" />
    </div>
</div>
</asp:Content>
