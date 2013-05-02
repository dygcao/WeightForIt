<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Menu>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   Programme : Détails Menu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <%: Styles.Render("~/Content/bootstrap") %>
     <%: Styles.Render("~/Content/dragmenucss") %>
  <h2>Details Menu : <%: Model.label %> </h2>
      <div id="retourMenu" style="padding-top:20px;">
          
             <input type="button" id="Retour" class="btn btn-primary btn-large" value="Retour"/>
            
        </div>

       <div class="container">

    <section id="product">

        <ul class='clear'>

        <% var c = ViewData["Consumption"] as List<WeightForIt.Models.Consumption>; %>
        <% foreach(var con in c){ %>
                      <li data-id="<%: con.Food.FoodId %>"><h5><%: con.Food.RefValue %></h5>
                         <p> Unité : <%: con.Food.unit %>  </p>
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

          <div class="basket2" style="padding-top:20px">
        <div class="basket_list">
            <div class="head">
                <span class="name">Total</span>
            </div>
           <ul>
                <li>
                      <span class="name">Calories</span>
                     <span id="tCalories" class="name2"><%: Model.calories %></span>
                    
                </li>
                   <li>
                      <span class="name">Proteins</span>
                        <span id="tProteins" class="name2"><%: Model.proteins %></span>
                      
                </li>
                   <li>
                      <span class="name">Glucides</span>
                        <span id="tGlucides" class="name2"><%: Model.glucides %></span>
                 
                </li>
                   <li>
                      <span class="name">Lipids</span>
                        <span id="tLipids" class="name2"><%: Model.lipids %></span>
                 
                </li>

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

        $("#Retour").click(function () {

            window.history.go(-1);
       
        });


        </script>
</asp:Content>
