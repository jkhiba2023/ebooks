<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AboutUs_Main.aspx.cs" Inherits="E_book.AboutUs_Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .AboutUs{
            text-align:center;
        }
        .photos{
            height:175px;
        }
        .fa-book{
            color:#0D6EFD;
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
    <div class="AboutUs">
        <div>
            <h2>OUR JOURNEY IN SMARTREAD <i class="fa-solid fa-book"></i></h2>
            <h3>Founders With A Smart Tech Learning</h3>
            <p>Live as if you were to die tomorrow. Learn as if you were to live forever.</p>
            <p><strong>Register Name/ Legal Name: Ebook Walla Private Limited</strong></p>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div>
            <img class="photos" src="Book_Cover/bappu.jpg" alt="Mahatma Gandhi"/>
            <p>“Be the change that you wish to see in the world.”</p><br />
            <img class="photos" src="Book_Cover/Dr._Bhimrao_Ambedkar.jpg" alt="Baba Sahab"/>
            <p>“I like the religion that teaches liberty, equality, and fraternity.”</p><br />
            <img class="photos" src="Book_Cover/A._P._J._Abdul_Kalam.jpg" alt="APJ Kalam"/>
            <p>“Success is not the key to happiness. Happiness is the key to success. If you love what you are doing,<br /> you will be successful.”</p><br />
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="bot">
            <strong style="font-size:large">"Make Your Knowledge As Sword And Cut The Head Of Lie"</strong>
            <br />
            <br />
            <br />
            <br />
            <br />
            <p><strong>
                Thank You For Visiting Ebook Walla !!!!!
               </strong></p>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
