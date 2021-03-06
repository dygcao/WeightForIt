﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Program>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Suivi du programme - <%: Model.label %></h2>
<br />
<p style="float:left;">
    <%: Html.ActionLink("Créer un menu", "Create", "Menu")%>
    <%: Html.ActionLink("Suivi de poids", "Weight", new { id=Model.ProgramId }) %>
    <%: Html.ActionLink("Récapitulatif des jours caloriques des jours précédent", "Meals", new { id = Model.ProgramId })%>
</p>
<p style="float:right;">
    <button id="saveProgram">Sauvegarder</button>
    <button id="buttonObjective">Mon objectif calorique</button>
</p>
<div id="formObjective" style="display:none;">
    <h4 style="background:grey;color:white;text-align:center;">Objectif calorique ( ex: 2500 )</h4>
    <input class="fieldObjective" type="text" /><br /><button class="addObjective">Ajouter mon objectif calorique</button>
</div>   
     <br /><br/>
<div class="clear"></div>
<div id="builderProgram" data-program="<%: Model.ProgramId %>">
    <% var objective = ViewData["objective"] as WeightForIt.Models.Objective; %>
    <h4 style="font-style:italic">Votre objectif calorique : <% if(objective != null){ %> <%: objective.calories %> calories <% }else{%> Aucun <%} %></h4><br />
    <section id="menu">
        <h3>MES MENUS - <i>Glisser les menus que vous avez consommé dans la liste à droite.</i></h3><br />
        <ul class="clear">
            <% var menus = ViewData["menus"] as List<WeightForIt.Models.Menu>; %>
            <% foreach(var menu in menus){ %>
                    <li data-id="<%: menu.MenuId %>">
                        <a href="/Front/Menu/Program/<%: Model.ProgramId  %>/<%: menu.MenuId  %>">
                            <h3><%: menu.label %></h3>
                            <p>Calories : <span class="<%:menu.MenuId %>_calories"><%: menu.calories %></span></p>
                            <p>Protéines : <span class="<%:menu.MenuId %>_proteins"><%: menu.proteins %></span></p>
                            <p>Glucides : <span class="<%:menu.MenuId %>_glucides"><%: menu.glucides %></span></p>
                            <p>Lipides : <span class="<%:menu.MenuId %>_lipids"><%: menu.lipids %></span></p>
                        </a>
                    </li>   
            <% } %>
        </ul>
    </section>
    <aside id="sidebar">
        <div id="listBasket" class="basket">
            <h3>Jour <%: ViewData["day"] %> - J'ai mangé quoi ?</h3><br />
            <div class="basket_list">
                <div class="head">
                    <span class="name">Nom du menu</span>
                </div>
                <ul>
                    <% 
                        var meals = ViewData["meals"] as List<WeightForIt.Models.Meal>;
                        var calories = 0; 
                        var proteins = 0;
                        var lipids = 0;
                        var glucides = 0;
                    %>
                    <% foreach(var meal in meals){ %>
                            <li data-id="<%: meal.MenuId %>">
                                <span class="name"><%: meal.Menu.label %></span>
                                <button class="delete">&#10005;</button>
                            </li>
                    <%  
                            calories += meal.Menu.calories;
                            proteins += meal.Menu.proteins;
                            lipids += meal.Menu.lipids;
                            glucides += meal.Menu.glucides;
                        }
                    %>
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
    </aside>

</div>
<div class="clear"></div>
<div>
    <%: Html.ActionLink("Revenir à mes programmes", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryui") %>
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/bundles/program") %>
    <%: Scripts.Render("~/bundles/objective") %>
    <%: Styles.Render("~/Content/program") %>
    <script type="text/javascript">
        $("#buttonObjective").click(function () {
            $('#formObjective').bPopup();
        });

        $(".addObjective").click(function () {
            var intRegex = /^\d+$/;
            if (intRegex.test($(".fieldObjective").val())) {
                
            } else {
                alert("Veuillez entrer un chiffre.");
            }
        });
    </script>

</asp:Content>
