<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="E_book.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card-body{
    text-align:center;
    margin:auto;
    color:black;
    width:500px;
    height:380px;
}
        .card{
            margin:auto;
            width:560px;
        }
           h2{
    color:#0D6EFD;
    
}
           td{
    color:white;
}
      .textbox{
          color:lavender;
          border-radius:6px;
          border-style:double;
          width:250px;
          text-align:center;
           }

      .button-container {
          text-align: center; /* Center align the buttons */
          margin-bottom: 10px; /* Add space between the buttons and the next element */
        }

.sobutton {
        margin-left: 10px; /* Add space between Sign In and Sign Up buttons */
        border-radius: 6px;
        border-style: none;
        background-color: #0D6EFD;
        color:white;
}

.button{
        border-radius: 6px;
        border-style: none;
        background-color: #0D6EFD;
        color:white;
}

.forgot-password {
    text-align: center; /* Center align the forgot password link */
    margin-top: 10px; /* Add space above the forgot password link */
}

      .blink {
      animation: blinker 1.5s linear infinite;
                
            }
        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height:600px; padding:100px; background-color:#F0F0F0;" >
        <marquee class="blink"><h2 style="color:#97C0DD;"><i>Welcome To </i><i class="fa-solid fa-book"> Book Walla !!!</i></h2></marquee>
        <div class="card">
                <div class="card-body">            
                    <table class="sign" style="border-radius:8px;">
                        <h2>Sign In</h2>
                        <hr />
                        <asp:RequiredFieldValidator ID="RFTxtUserName" runat="server" ErrorMessage="Enter Your Username" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                        <div class="form-outline mb-4">
                            <asp:TextBox ID="txtUsername" data-mdb-input-init class="form-control" CssClass="textbox" runat="server"   ForeColor="Black" placeholder="Enter Username"></asp:TextBox>
                            
                         </div>                        
                        
                        <asp:RequiredFieldValidator ID="txtPassword" runat="server" ErrorMessage="Please Enter Your Password" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                        <div  class="form-outline mb-4">
                        <asp:TextBox ID="txtPass" data-mdb-input-init class="form-control" CssClass="textbox" runat="server" TextMode="Password"  ForeColor="Black" placeholder="Enter Password"></asp:TextBox>
                            
                        </div>
                        
                        <span>
                            <div class="form-outline mb-4">
                                <asp:CheckBox ID="chckbox" runat="server" />
                                <asp:Label ID="Label1" runat="server" Text="Remember Me"></asp:Label>
                            </div>
                        
                            <div class="form-group">
                                <div class="col-md-2"></div>
                                <div class="col-md-6"></div>
                                <asp:Button ID="btnsignin" runat="server" Text="Sign In" OnClick="btnsignin_Click1" CssClass="button" />
                                <asp:Button ID="btnsignup" runat="server" Text="Sign Up" OnClick="btnsignout_Click" CssClass="sobutton" />
                            </div>


                            <div class="form-group">
                                <div class="col-md-2"></div>
                                <div class="col-md-6"></div>
                                    <asp:Label ID="lblError" runat="server" ></asp:Label>
                           </div>


                            <div class="forgot-password">

                                <asp:HyperLink ID="linkforgot" NavigateUrl="ForgotPassword.aspx" runat="server">Forgot Password?</asp:HyperLink>
                                
                            </div>
                            </span>
                        
                    </table>

 
              </div>
        </div>
    </div>
</asp:Content>
