<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Program>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Program</legend>

        <%: Html.HiddenFor(model => model.ProgramId) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.objective) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.objective) %>
            <%: Html.ValidationMessageFor(model => model.objective) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.StartDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.StartDate) %>
            <%: Html.ValidationMessageFor(model => model.StartDate) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.privacy) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.privacy) %>
            <%: Html.ValidationMessageFor(model => model.privacy) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.UserId, "UserProfile") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("UserId", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.UserId) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.PublicSince) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.PublicSince) %>
            <%: Html.ValidationMessageFor(model => model.PublicSince) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.label) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.label) %>
            <%: Html.ValidationMessageFor(model => model.label) %>
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
