<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Program>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Meals
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Meals</h2>

    <% foreach (var item in ViewData["meals"] as IQueryable<IGrouping<DateTime,WeightForIt.Models.Meal>>) { %>
        <div id="listBasket" class="basket">
            <div class="basket_list">
                <div class="head">
                    <span class="name"><%: item.Key %></span>
                </div>
                <ul>
                <% foreach (var meal in item) { %>
                    <li data-id="<%: meal.MenuId %>">
                        <span class="name"><%: meal.Menu.label %></span>
                    </li> 
                <% } %>
                </ul>
            </div>
        </div>
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
<%: Styles.Render("~/Content/program") %>
</asp:Content>
