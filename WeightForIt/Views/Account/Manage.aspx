<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeightForIt.Models.LocalPasswordModel>" %>

<asp:Content ID="manageTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Gérer le compte
</asp:Content>

<asp:Content ID="manageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="menu_login_container" style="width: 375px;background: #FFFFFF;padding: 10px 25px;margin: 5px auto;">

        <% if (ViewBag.HasLocalPassword) {
            Html.RenderPartial("_ChangePasswordPartial");
        } else {
            Html.RenderPartial("_SetPasswordPartial");
    } %>
    </div>

</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>