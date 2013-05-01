<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Menu>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
     <%: Styles.Render("~/Content/dragmenucss") %>
  <h2>Details Menu : <%: Model.label %> </h2>
      <div id="retourMenu" style="padding-top:20px;">
          
             <input type="button" id="Button1" class="btn btn-primary btn-large" value="Menu"/>
            
        </div>

       <div class="container">

    <section id="product">

        <ul class='clear'>

        <% var c = ViewData["Consumption"] as List<WeightForIt.Models.Consumption>; %>
        <% foreach(var con in c){ %>
                      <li data-id="<%: con.Food.FoodId %>"><h3><%: con.Food.RefValue %></h3>
                      <p> Calories : <%: con.Food.calories %> </p>
                           <p> Calories : <%: con.Food.calories %> </p>
                           <p> Proteins : <%: con.Food.proteins %> </p>
                           <p> Glucides : <%: con.Food.glucides %> </p> 
                           <p> Lipids : <%: con.Food.lipids %> </p>
                      </li>
        <% } %>

        </ul>
    </section>
      
    <aside id="sidebar">
    <div class="basket">
        <div class="basket_list">
            <div class="head">
                <span class="name">Nom du Produit</span>
                <span class="count">Quantité</span>
            </div>
            <ul>

                    <% foreach(var con in c){ %>
                      <li data-id="<%: con.Food.FoodId %>">
                      <span class="name"><%: con.Food.RefValue %></span>
                      <input class="count"  value="<%: con.quantity %>" readonly="readonly">
                     </li>
                     <% } %>


            </ul>
        </div>
    </div>
      
           
</aside>

           </div>


   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">



      <%: Scripts.Render("~/bundles/jqueryval") %>
   
    <script>

        $("#retourMenu").click(function () {


            window.location.href = "/Front/Menu"
        });


        </script>
</asp:Content>
