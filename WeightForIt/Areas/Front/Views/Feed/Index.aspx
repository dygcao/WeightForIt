<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Program feed
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Program feed</h2>
<div class="row programfeed">
    <% try { %>
    
    <% foreach (var item in ViewData["programfeed"] as List<WeightForIt.Models.Program>) { %>  
        <div class="span2 programfeeditem">
            <strong><%: Html.ActionLink(item.label, "Programs", "/", new { id = item.ProgramId }, null) %></strong> (<%: item.UserProfile.UserName %>)
            <p>Objectif à atteindre : <%: item.objective %></p>
            <p>Date de début : <%: item.StartDate %></p>
        </div>    
    <% } %>
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
