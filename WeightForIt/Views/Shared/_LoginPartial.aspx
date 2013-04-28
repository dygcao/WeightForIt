<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<% if (Request.IsAuthenticated) { %>
    <ul class="nav btn-group">
        <li class="btn btn-inverse"><%: Html.ActionLink(User.Identity.Name, "Manage", "Account", new { Area = "" }, htmlAttributes: new { @class = "username", title = "Gérer" }) %></li>
        <li class="btn btn-inverse">
			<% using (Html.BeginForm("LogOff", "Account", new { area = "" }, FormMethod.Post, new { id = "logoutForm" })) { %>
			<%: Html.AntiForgeryToken() %>
                <a href="javascript:document.getElementById('logoutForm').submit()">Se déconnecter</a>
            <% } %>
        </li>
    </ul>
    
<% } else { %>
    <ul class="nav btn-group">
        <li><%: Html.ActionLink("S'inscrire", "Register", "Account", new { Area = "" }, htmlAttributes: new { id = "registerLink" })%></li>
        <li><%: Html.ActionLink("Se connecter", "Login", "Account", new { Area = "" }, htmlAttributes: new { id = "loginLink" })%></li>
    </ul>
<% } %>