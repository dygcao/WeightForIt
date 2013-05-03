<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    S'inscrire
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Bienvenue !</h1>
                <br />
                <h3>Vous êtes en surpoids ou sous-poids et souhaitez faire un régime ? N'attendez plus ! <strong>Weight For It</strong> est là pour vous.
                <br />Inscrivez-vous et créez votre programme personnalisé.</h3>
            </hgroup>
        </div>
    </section>
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="menu_login_container" style="width: 375px;background: #FFFFFF;padding: 10px 25px;margin: 5px auto;">
    
        <hgroup class="title">
            <h2>Inscrivez-vous.</h2>
        </hgroup>

        <% using (Html.BeginForm()) { %>
            <%: Html.AntiForgeryToken() %>
            <%: Html.ValidationSummary() %>

            <fieldset>
                <legend>Formulaire d’inscription</legend>
                <ol>
                    <li>
                        <%: Html.LabelFor(m => m.UserName) %>
                        <%: Html.TextBoxFor(m => m.UserName) %>
                    </li>
                    <li>
                        <%: Html.LabelFor(m => m.Password) %>
                        <%: Html.PasswordFor(m => m.Password) %>
                    </li>
                    <li>
                        <%: Html.LabelFor(m => m.ConfirmPassword) %>
                        <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    </li>
                </ol>
                <input type="submit" value="S'inscrire" />
            </fieldset>
        <% } %>
    </div>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
