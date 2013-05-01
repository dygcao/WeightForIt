<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>
<div class="row programfeed">
    PROGRAM FEED
    <% try { %>
    
    <% foreach (var item in ViewData["programfeed"] as IEnumerable<WeightForIt.Models.Program>) { %>  
        <div class="span2 programfeeditem">
            <h3><%: item.objective %></h3>
            <p><%: item.StartDate %></p>
            <%: Html.ActionLink("More", "Programs", "News", new { id = @item.ProgramId }, null) %>
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
