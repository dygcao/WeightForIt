<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.WeightViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Weights
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<p>
    <%:Html.ActionLink("Retour", "Edit", new { id=Model.ProgramId }) %>
</p>

<h2>Nouveau Poids</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Poids</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.weight1, "Poids") %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.weight1) %>
            <%: Html.ValidationMessageFor(model => model.weight1) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.date, "Date") %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.date) %>
            <%: Html.ValidationMessageFor(model => model.date) %>
        </div>

        <%: Html.HiddenFor(model => model.ProgramId) %>
        <%: Html.HiddenFor(model => model.UserId) %>

        <p>
            <input type="submit" value="Ajouter" />
        </p>

    </fieldset>
<% } %>

<h2>Derniers Poids pour <%: Model.Program.label %></h2>

<table>
    <tr>
        <th>Date</th>
        <th>Poids</th>
        <th></th>
    </tr>

<% foreach (var item in Model.Weights) { %>
    <tr>
        <td>
            <%: String.Format("{0:dd/MM/yyyy}", item.date) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.weight1) %>
        </td>
        <td>
            <%: Html.ActionLink("Supprimer", "DeleteWeight", new { id=item.ProgramId, weightId=item.WeightId }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
