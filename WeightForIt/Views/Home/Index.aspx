<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.LoginModel>" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Page d'accueil - Mon application ASP.NET MVC
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

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="menu_login_container" style="width: 375px;background: #FFFFFF;padding: 10px 25px;margin: 5px auto;">
         
        <h2>Connectez-vous</h2>
       <% using (Html.BeginForm("LogIn", "Account", FormMethod.Post, new { id = "LogOnForm" })) { %>
            <table>
                <tbody>
                    <tr>
                        <td colspan="2">
                            <%: Html.AntiForgeryToken() %>
                            <%: Html.ValidationSummary(true) %>
          
                            <%: Html.ValidationMessageFor(m => m.UserName) %>
                            <%: Html.ValidationMessageFor(m => m.Password) %>
                        </td>
                    </tr>
                    <tr>
                        <td class="html7magic">
                            <%: Html.LabelFor(m => m.UserName) %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%: Html.TextBoxFor(m => m.UserName) %>
                        </td>
                    </tr>
                    <tr>
                        <td class="html7magic">
                            <%: Html.LabelFor(m => m.Password) %>
                                       
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%: Html.PasswordFor(m => m.Password) %>
                        </td>
                    </tr>
                    <tr>
                        <td class="login_form_label_field">
                            <%: Html.CheckBoxFor(m => m.RememberMe) %>
                            <%: Html.LabelFor(m => m.RememberMe, new { @class = "checkbox" }) %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" id="loginbutton" value="Se connecter" />
                        </td>
                    </tr>
                </tbody>
            </table>
    <% } %>
            <p>
                <%: Html.ActionLink("S'inscrire", "Register", "Account", new { Area = "" }, htmlAttributes: new { id = "registerLink" }) %> si vous n'avez pas de compte.
            </p>
        </div>
</asp:Content>
