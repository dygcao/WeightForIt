﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Flux d'actualité
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Mon flux d'actualité</h2>
    <div id="programFeed" data-id="<%: ViewData["user"] %>" class="row programfeed">
        <% try
           { %>
	
        <table id="table_id">
            <thead>
                <tr>
                    <th>Intitulé</th>
                    <th>Utilisateur</th>
                    <th>Date de début</th>
                    <th>Objectif</th>
                    <th>Favoris</th>
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
                    <td class="td_favorite" data-id="<%: item.ProgramId %>"><button id="<%: item.ProgramId %>_program">Mettre en favoris</button></td>
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

        $("#table_id tr .td_favorite").click(function () {
            var programId = $(this).attr("data-id");
            $.ajax({
                type: "POST",
                url: "/Front/Ajax/addFavorite",
                dataType: "json",
                data: { program: programId, user: $("#programFeed").attr("data-id") },
                traditional: true,
                success: function (data) {
                    if (data.Success) {
                        alert("Ajout en favoris.");
                    } else {
                        alert("Déjà dans les favoris");
                    }
                },
            });
        });
    </script>
</asp:Content>
