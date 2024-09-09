<%@ Page Title="" Language="C#" MasterPageFile="~/Userss.Master" AutoEventWireup="true" CodeBehind="UsersHM.aspx.cs" Inherits="E_book.UsersHM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style>
 .user-container{
   height:550px;
   }
   .center{
    text-align:center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
        
    <asp:Label ID="lblsuccess" runat="server" CssClass="text-success"></asp:Label>
    <br />
    <br />
        <!--Image Slider-->
    <div class="container">
    
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="Book_Cover/motivational1.jpg" alt="You Deserve This ..." style="width:100%; height:490px;">
          <div class="carousel-caption">
              <h3>Motivational Book</h3>
              <p>20% Off On MRP</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Buy Now</a></p>
          </div>
      </div>

      <div class="item">
        <img src="Book_Cover/story.jpg" alt="You Deserve This ...2" style="width:100%; height:490px;">
          <div class="carousel-caption">
            <p>Story Book</p>
               <p>20% Off On MRP</p>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">Buy Now</a></p>
          </div>
      </div>
    
      <div class="item">
        <img src="Book_Cover/NCRT.png" alt="The Things We Should Have to know" style="width:100%; height:490px;">
          <div class="carousel-caption">
            <p>Study Matterial</p>
            <p>20% Off On MRP</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Buy Now</a></p>
        </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
    <!--Image Slider End-->
    <hr />
    <div class="container center">
        <div class="row">
            <div class="col-lg-4">
                <img class="img-circle" src="Book_Cover/motivational1.jpg" alt="motivational" width="140" height="140" />
                <h2>Motivational Books</h2>
                <p>
                    <ul>
                        <li>Big Panda and Tiny Dragon by James Norbury</li>
                        <li>The Boy, The Mole, The Fox, and The Horse by Charlie Mackesy</li>
                        <li>Atlas of the Heart by Brené Brown</li>
                        <li>Atomic Habits by James Clear</li>
                    </ul>
                    
                </p>
                <p><a class="btn btn-default" href="#" role="button">View More &raquo;</a></p>
            </div>

            <div class="col-lg-4">
                <img class="img-circle" src="Book_Cover/story.jpg" alt="story" width="140" height="140" />
                <h2>Story Books</h2>
                <p>
                    <ul>
                        <li>Harry Potter Series by J.K. Rowling</li>
                        <li>The Lord of the Rings by J.R.R. Tolkien</li>
                        <li>The Alchemist by Paulo Coelho</li>
                        <li>The Da Vinci Code by Dan Brown</li>
                    </ul>
                </p>
                <p><a class="btn btn-default" href="#" role="button">View More &raquo;</a></p>
            </div>

            <div class="col-lg-4">
                <img class="img-circle" src="Book_Cover/NCRT.png" alt="NCRT" width="140" height="140" />
                <h2>Study Matterials</h2>
                <p>
                    <ul>
                        <li>UPSC Preparation Books from NCERT History Books</li>
                        <li>NCERT Books about Indian Society for UPSC exam</li>
                        <li>NCERT Indian Art and Culture books for UPSC</li>
                        <li>UPSC Preparation Books from NCERT Geography Books for IAS</li>
                    </ul>
                </p>
                <p><a class="btn btn-default" href="#" role="button">View More &raquo;</a></p>
           </div>
        </div>
    </div>
    <div class="container">
        <p class="pull-right"><a href="">Back to top</a></p>
    </div>
</asp:Content>
