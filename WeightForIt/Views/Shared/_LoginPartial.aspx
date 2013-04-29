<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<% if (Request.IsAuthenticated) { %>
    <ul class="nav btn-group">
        <li class="btn btn-inverse"><a href="<%: Url.Action("Manage", "Account", new { Area = "" })%>"><i class="icon icon-user"></i><span class="text"> <%: User.Identity.Name %></span></a>
            <%//: Html.ActionLink(User.Identity.Name, "Manage", "Account", routeValues: null, htmlAttributes: new { @class = "username", title = "Gérer" }) %></li>
        <li class="btn btn-inverse">
            <% using (Html.BeginForm("LogOff", "Account", new { Area = "" }, FormMethod.Post, new { id = "logoutForm" })) { %>
            <%: Html.AntiForgeryToken() %>
                <a href="javascript:document.getElementById('logoutForm').submit()"><i class="icon icon-share-alt"></i><span class="text">Déconnecter</span></a>
            <% } %>
        </li>
    </ul>
    
<% } else { %>
    <ul class="nav btn-group">
        <li><%: Html.ActionLink("S'inscrire", "Register", "Account", new { Area = "" }, htmlAttributes: new { id = "registerLink" })%></li>
        <li><%: Html.ActionLink("Se connecter", "Login", "Account", new { Area = "" }, htmlAttributes: new { id = "loginLink" })%></li>
    </ul>
<% } %>