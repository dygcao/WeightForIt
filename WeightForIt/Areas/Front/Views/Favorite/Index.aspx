<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Favoris
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Mes programmes favoris</h2>
    <div class="row programfeed">
        <% try
           { %>

        <table id="table_id">
            <thead>
                <tr>
                    <th>Intitulé</th>
                    <th>Utilisateur</th>
                    <th>Date de début</th>
                    <th>Objectif</th>
                </tr>
            </thead>
            <tbody>
                <% foreach (var item in ViewData["favoritePrograms"] as List<WeightForIt.Models.Favorite>)
               { %>
                <tr>
                    <td><%: Html.ActionLink(item.Program.label, "Details", "Program", new { id = item.Program.ProgramId }, null) %></td>
                    <td><%: item.Program.UserProfile.UserName %></td>
                    <td><%: String.Format("{0:dd/MM/yyyy}", item.Program.StartDate) %></td>
                    <td><%: item.Program.objective.Length > 50 ? item.Program.objective.Substring(0,50) : item.Program.objective %></td>
                </tr>
            </tbody>
             <% } %>
        </table>

        <% } %>
        <% catch (NullReferenceException nre)
           { %>
        <p>Aucun programme</p>
        <% } %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/datatable") %>
    <%: Styles.Render("~/Content/datatable") %>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#table_id').dataTable();
        });
    </script>
</asp:Content>
