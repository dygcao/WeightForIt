﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Page d'accueil - Mon application ASP.NET MVC
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Page d’accueil.</h1>
                <h2><%: ViewBag.Message %></h2>
            </hgroup>
            <p>
                Pour en savoir plus sur ASP.NET MVC, consultez la page
                <a href="http://asp.net/mvc" title="ASP.NET MVC Website">http://asp.net/mvc</a>.
                La page inclut <mark>des vidéos, des didacticiels et des exemples</mark> pour vous aider à tirer parti d’ASP.NET MVC.
                Si vous avez des questions sur ASP.NET MVC, consultez
                <a href="http://forums.asp.net/1146.aspx/1?MVC" title="ASP.NET MVC Forum">nos forums</a>.
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Nous suggérons ce qui suit :</h3>
    <ol class="round">
        <li class="one">
            <h5>Prise en main</h5>
            ASP.NET MVC permet de créer des sites Web dynamiques à l’aide de modèles. Le programme
            permet de séparer nettement les différents aspects et offre un contrôle total des balises
            pour simplifier et améliorer le développement. ASP.NET MVC inclut de nombreuses fonctionnalités qui accélèrent
            le développement TDD et permettent de créer des applications sophistiquées qui utilisent
            les derniers standards web.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245151">En savoir plus…</a>
        </li>

        <li class="two">
            <h5>Ajouter des packages NuGet et dynamiser votre codage</h5>
            NuGet simplifie l’installation et la mise à jour des bibliothèques et outils gratuits.
        <a href="http://go.microsoft.com/fwlink/?LinkId=245153">En savoir plus…</a>
        </li>

        <li class="three">
            <h5>Rechercher un hébergement Web</h5>
            Recherchez un fournisseur d’hébergement Web proposant le meilleur rapport qualité/prix
            pour vos applications.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245157">En savoir plus…</a>
        </li>
    </ol>
</asp:Content>
