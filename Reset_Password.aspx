<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Reset_Password.aspx.cs" Inherits="E_book.Reset_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .reset_pass {
        text-align: center;
        padding: 100px;
        height:94vh;
    }
    .card-body {
        padding: 20px;
        border-radius: 8px;
        background-color: #fff; /* White background for better visibility */
        box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Box shadow for depth effect */
        width: 100%;
        max-width: 400px; /* Maximum width for readability */
        margin: 0 auto; /* Center align the card horizontally */
    }
    .txtfield, .txtfield1 {
        border-radius: 6px;
        border: 2px double grey;
        height: 38px;
        width: calc(100% - 20px); /* Full width minus padding */
        max-width: 270px; /* Maximum width for input fields */
        text-align: center;
        margin-bottom: 10px; /* Spacing between inputs */
        box-sizing: border-box; /* Include padding and border in width */
    }
    h4 {
        color: #0D6EFD;
    }
    .btnreset {
        width: 100%;
        max-width: 270px; /* Maximum width for button */
        padding: 10px;
        border-radius: 6px;
        background-color: #0D6EFD;
        color: #fff;
        border: none;
        cursor: pointer;
        font-size: 16px;
    }

    @media (max-width: 600px) {
        .reset_pass {
            padding: 10px;
        }
        .card-body {
            padding: 10px;
        }
        .txtfield, .txtfield1 {
            width: calc(100% - 16px);
            max-width: 100%;
            font-size: 14px;
        }
        .btnreset {
            font-size: 14px;
            padding: 8px;
        }
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="reset_pass">
    <div class="card">
        <div class="card-body">
            <h4>Reset Password</h4>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label><br />

            <asp:TextBox ID="txtNewPass" runat="server" Placeholder="Enter Your Password" CssClass="form-control" TextMode="Password"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewPass" runat="server" ErrorMessage="Enter Your New Password" ControlToValidate="txtNewPass" ForeColor="Red"></asp:RequiredFieldValidator>

            <asp:TextBox ID="txtConfirmPass" runat="server" Placeholder="Enter Your Confirm Password" CssClass="form-control" TextMode="Password"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPass" runat="server" ErrorMessage="Confirm Your New Password" ForeColor="Red" ControlToValidate="txtConfirmPass"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidatorPass" runat="server" ErrorMessage="Confirm Password Is Not A Match" ForeColor="Red" ControlToValidate="txtConfirmPass" ControlToCompare="txtNewPass"></asp:CompareValidator>

            <asp:Button ID="btnResetPass"  runat="server" Text="Save" class="btn btn-primary mb-1" OnClick="btnreset_Click"/>
            
        </div>
    </div>
</div>
</asp:Content>
