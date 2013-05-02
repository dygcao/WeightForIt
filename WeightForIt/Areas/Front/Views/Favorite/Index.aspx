<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>My favorite programs</h2>
<div class="row programfeed">
    <% try { %>
    <table>
    <% foreach (var item in ViewData["favoritePrograms"] as List<WeightForIt.Models.Favorite>)
       { %>  
        <tr>
            <td><strong><%: Html.ActionLink(item.Program.label, "Details", "Program", new { id = item.Program.ProgramId }, null) %></strong> [<%: item.Program.UserProfile.UserName %>]</td>
            <td>Objectif à atteindre : <%: item.Program.objective %></td>
            <td>Date de début : <%: String.Format("{0:dd/MM/yyyy}", item.Program.StartDate) %></td>
        </tr>    
    <% } %>
    </table>


    <% } %>
    <% catch (NullReferenceException nre) { %>  
    <p>Aucun programme</p>
    <% } %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
