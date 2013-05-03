<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Program feed
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Program feed</h2>
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
                <% foreach (var item in ViewData["programfeed"] as List<WeightForIt.Models.Program>)
               { %>
                <tr>
                    <td><%: Html.ActionLink(item.label, "Details", "Program", new { id = item.ProgramId }, null) %></td>
                    <td><%: item.UserProfile.UserName %></td>
                    <td><%: String.Format("{0:dd/MM/yyyy}", item.StartDate) %></td>
                    <td><%: item.objective.Length > 50 ? item.objective.Substring(0,50) : item.objective %></td>
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
