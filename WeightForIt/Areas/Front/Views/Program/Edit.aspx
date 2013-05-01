<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Program>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Suivi du programme</h2>
    <br />
<p><a href="#">Créer un menu</a></p>


<div id="builderProgram">
    <section id="menu">
        <h3>MES MENUS - <i>Glisser le menu de votre choix dans la partie</i> </h3><br />
        <ul class="clear">
            <li data-id="1">
                <a href="#">
                    <h3>iPad 32gb retina screen</h3>
                    <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                </a>
            </li>
            <li data-id="2">
                <a href="#">
            		<h3>Turntable mixer</h3>
                    <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                </a>
            </li>
            <li data-id="3">
                <a href="#">
            		<h3>IBM 15" super-fast computer</h3>
                    <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                </a>
            </li>
            <li data-id="4">
                <a href="#">
            		<h3>Some crazy circuit</h3>
                    <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                </a>
            </li>
            <li data-id="5">
                <a href="#">
                    <h3>White earpieces</h3>
                    <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                </a>
            </li>
            <li data-id="6">
                <a href="#">
            		<h3>Headphones with free keyboard</h3>
                    <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                </a>
            </li>
            <li data-id="7">
                <a href="#">
            		<h3>iPhone 4S</h3>
                    <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                </a>
            </li>
            <li data-id="8">
                <a href="#">
            		<h3>Another crazy circuit or..</h3>
                    <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
                </a>
            </li>
        </ul>
    </section>
    <aside id="sidebar">
        <div class="basket">
            <h3>Jour <%: ViewData["day"] %></h3><br />
            <div class="basket_list">
                <div class="head">
                    <span class="name">Nom du menu</span>
                </div>
                <ul>
                </ul>
            </div>
        </div>
        <div>
            Total : 5000 calories
        </div>
    </aside>
</div>
<div class="clear"></div>
<% var meals = ViewData["meals"] as List<WeightForIt.Models.Meal>; %>
<%: meals.Count %>


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
