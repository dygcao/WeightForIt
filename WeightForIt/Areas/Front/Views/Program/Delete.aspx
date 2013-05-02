<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Program>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>Program</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.objective) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.objective) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.StartDate) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.StartDate) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.privacy) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.privacy) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.UserProfile.UserName) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.UserProfile.UserName) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.PublicSince) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.PublicSince) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.label) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.label) %>
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
