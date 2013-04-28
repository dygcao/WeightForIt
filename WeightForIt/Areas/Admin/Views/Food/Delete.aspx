<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Food>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>Food</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.RefValue) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.RefValue) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.unit) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.unit) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.calories) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.calories) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.proteins) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.proteins) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.glucides) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.glucides) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.lipids) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.lipids) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
