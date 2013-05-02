<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<WeightForIt.Models.Program>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.objective) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.StartDate) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.privacy) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.UserProfile.UserName) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.PublicSince) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.label) %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.objective) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.StartDate) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.privacy) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.UserProfile.UserName) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.PublicSince) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.label) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.ProgramId }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.ProgramId }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.ProgramId }) %> |
            <%: Html.ActionLink("Poids", "Weight", new { id=item.ProgramId })%>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
