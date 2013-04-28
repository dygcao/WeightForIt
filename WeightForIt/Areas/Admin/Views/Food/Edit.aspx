<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Food>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Food</legend>

        <%: Html.HiddenFor(model => model.FoodId) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.RefValue) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.RefValue) %>
            <%: Html.ValidationMessageFor(model => model.RefValue) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.unit) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.unit) %>
            <%: Html.ValidationMessageFor(model => model.unit) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.calories) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.calories) %>
            <%: Html.ValidationMessageFor(model => model.calories) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.proteins) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.proteins) %>
            <%: Html.ValidationMessageFor(model => model.proteins) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.glucides) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.glucides) %>
            <%: Html.ValidationMessageFor(model => model.glucides) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.lipids) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.lipids) %>
            <%: Html.ValidationMessageFor(model => model.lipids) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
