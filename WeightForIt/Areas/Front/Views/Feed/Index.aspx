<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Program feed
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Program feed</h2>
<div class="row programfeed">
    <% try { %>
    <table>
    <% foreach (var item in ViewData["programfeed"] as List<WeightForIt.Models.Program>) { %>  
        <tr>
            <td><strong><%: Html.ActionLink(item.label, "Details", "Program", new { id = item.ProgramId }, null) %></strong> [<%: Html.ActionLink(item.UserProfile.UserName, "User", "/", new { id = item.UserProfile.UserId }, null) %>]</td>
            <td>Objectif à atteindre : <%: item.objective %></td>
            <td>Date de début : <%: String.Format("{0:dd/MM/yyyy}", item.StartDate) %></td>
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
