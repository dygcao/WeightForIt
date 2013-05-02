<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Program>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Suivi du programme</h2>
    <br />
<p style="float:left;"><button>Créer un menu</button></p><p style="float:right;"><button>Sauvegarder</button><button>Mon objectif calorique</button></p>
    <br /><br/>
<div class="clear"></div>
<div id="builderProgram">
    <section id="menu">
        <h3>MES MENUS - <i>Glisser les menus que vous avez consommé dans la liste à droite.</i></h3><br />
        <ul class="clear">
            <% var menus = ViewData["menus"] as List<WeightForIt.Models.Menu>; %>
            <% foreach(var menu in menus){ %>
                    <li data-id="<%: menu.MenuId %>">
                        <a href="#">
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
    <%: Styles.Render("~/Content/program") %>

</asp:Content>
