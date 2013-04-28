<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<% if (Request.IsAuthenticated) { %>
    Bonjour, <%: Html.ActionLink(User.Identity.Name, "Manage", "Account", new { Area = "" }, htmlAttributes: new { @class = "username", title = "Gérer" }) %>!
    <% using (Html.BeginForm("LogOff", "Account", new { area = "" }, FormMethod.Post, new { id = "logoutForm" })) { %>
        <%: Html.AntiForgeryToken() %>
        <a href="javascript:document.getElementById('logoutForm').submit()">Se déconnecter</a>
    <% } %>
<% } else { %>
    <ul>
        <li><%: Html.ActionLink("S'inscrire", "Register", "Account", new { Area = "" }, htmlAttributes: new { id = "registerLink" })%></li>
        <li><%: Html.ActionLink("Se connecter", "Login", "Account", new { Area = "" }, htmlAttributes: new { id = "loginLink" })%></li>
    </ul>
<% } %>