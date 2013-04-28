<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<WeightForIt.Models.Food>>" %>

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
            <%: Html.DisplayNameFor(model => model.RefValue) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.unit) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.calories) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.proteins) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.glucides) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.lipids) %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.RefValue) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.unit) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.calories) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.proteins) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.glucides) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.lipids) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.FoodId }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.FoodId }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.FoodId }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
