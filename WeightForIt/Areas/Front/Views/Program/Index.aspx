<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<WeightForIt.Models.Program>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Mes programmes</h2>

<p>
    <%: Html.ActionLink("Créer un nouveau programme", "Create") %>
</p>
<table>
    <tr>
        <th>
            Nom du programme
        </th>
        <th>
            Objectif
        </th>
        <th>
            Statut
        </th>

        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.label) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.objective) %>
        </td>
        <td>
            <% if(item.privacy == 1){ %>
                  Privé
            <% }else{ %>
                  Public
            <% } %>
        </td>
        <td>
            <%: Html.ActionLink("Configurer", "Edit", new { id=item.ProgramId }) %> |
            <%: Html.ActionLink("Suivi", "Details", new { id=item.ProgramId }) %> |
            <%: Html.ActionLink("Supprimer", "Delete", new { id=item.ProgramId }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>