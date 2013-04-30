<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.Program>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Créer mon programme
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Création de mon programme de suivi</h2>
    <br />
<% using (Html.BeginForm(null, null, FormMethod.Post, new { id = "programform" }))
   { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset title="Etape 1">
        <legend>Donnez un nom à votre programme</legend>
        <div class="editor-label">
            <label>Nom du programme</label>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.label) %>
            <%: Html.ValidationMessageFor(model => model.label) %>
        </div>
    </fieldset>
    <fieldset title="Etape 2">
        <legend>Quel est votre objectif ?</legend>
        <div class="editor-label">
            <label>Votre objectif :</label>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.objective) %>
            <%: Html.ValidationMessageFor(model => model.objective) %>
        </div>
    </fieldset>
         <p>
            <input type="submit" class="finish" value="Créer mon programme" />
        </p>
<% } %>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Styles.Render("~/Content/cssstepy") %>
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/bundles/jquerystepy") %>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#programform').stepy();
        });
    </script>
</asp:Content>
