<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Program>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Meals
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<p style="float:right;"><%: Html.ActionLink("Retour au suivi", "Edit", new { id = Model.ProgramId })%></p>

<h2>Récapitulatif de votre programme</h2>

    <% foreach (IGrouping<int, WeightForIt.Models.Meal> item in ViewData["meals"] as IQueryable<IGrouping<int, WeightForIt.Models.Meal>>)
       { %>
        <div class="basket-suivi">
        <div id="listBasket" class="basket">
            <div class="basket_list">
                <div class="head">
                    <span class="name">Jour <%: item.Key %></span>
                </div>
                <% var calories = 0;
                    var proteins = 0;
                    var lipids = 0;
                    var glucides = 0; 
                %>
                <ul>
                <% foreach (var meal in item) { %>
                    
                    <li data-id="<%: meal.MenuId %>">
                        <span class="name"><%: meal.Menu.label %></span>
                    </li> 
                    <%  
                        calories += meal.Menu.calories;
                        proteins += meal.Menu.proteins;
                        lipids += meal.Menu.lipids;
                        glucides += meal.Menu.glucides;
                    %>
                <% } %>
                </ul>
            </div>
        </div>
        <div class="basket">
            <div class="basket_list">
                <div class="head">
                    <span class="name">Total</span>
                </div>
                <ul id="total">
                    <li>Calories : <span class="total_calories"><%: calories %></span></li>
                    <li>Protéines : <span class="total_proteins"><%: proteins %></span></li>
                    <li>Glucides : <span class="total_glucides"><%: glucides %></span></li>
                    <li>Lipides : <span class="total_lipids"><%: lipids %></span></li>  
                </ul>
            </div>
        </div>
        </div>
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
<%: Styles.Render("~/Content/program") %>
</asp:Content>
