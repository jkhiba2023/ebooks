<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ContactUs_Main.aspx.cs" Inherits="E_book.ContactUs_Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .contactUs{
        text-align:center;
        height:385px;
    }
    .heading h3{
        font-weight: 700;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        color: #000;
        font-size: 24px;
    }
    p strong{
        font-weight: var(--text-font-bold-weight);
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<br />
<br />
<br />
<br />
<br />
<br />
    <div class="contactUs">
       <div>         
            <h3 class="heading h3"> We Are Happy To Help</h3>
                    <p>
                        Send us a message and we will get back to you within 24 hours. Alternatively you can email us at <a href="mailto:support@ebookwala.co.in" target="_blank" title="mailto:support@ebookwala.co.in">support@ebookwala.co.in</a> 
                    </p>
                    <p>
                        Call Us (10 AM to 6 PM | Mon to Sat): <a href="tel:9876543210" target="_blank" title="Call Us">098-765-43210</a>
                    </p>
                    <p>
                        <strong><i class="fa-brands fa-square-whatsapp"></i></strong>
                        <a href="https://api.whatsapp.com/send?phone=919876543210&text=Hello" target="_blank" title="Whatsapp support">Click here</a>
                    </p>
                </div>
    <br />
    <br />
    <br />
    <br />
    <div>
        <p>
        <strong>Ebook Walla</strong>
        <br />
        <br />
        <br />
        The Brand Name "Ebook Walla" is register trademark owned by Ebook Walla , With it's Register Office Location <br /> Noor Shah Commercial Building,
        At Kasimira , Mira Road , Dist. Thane 401107.
        </p>
    </div>

        </div>
    <br />
    <br />
    <br />

</asp:Content>
