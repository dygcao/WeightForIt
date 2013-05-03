<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<WeightForIt.Models.Program>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%: Styles.Render("~/Content/dashboard") %>
    <%: Scripts.Render("~/bundles/dashboard") %>

    <% try
       { %>
    <% var program = ViewData["program"] as WeightForIt.Models.Program; %>
    <div class="container-fluid">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box widget-plain">
                        <div class="widget-content center">
                            <ul class="stats-plain">
                                <li>
                                    <h4><%: program.label %></h4>
                                    <span>Programme actuel</span>
                                </li>
                                <li>
                                    <h4><%: program.objective %></h4>
                                    <span>Objectif</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Statistique -->
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon">
                                <i class="icon-signal"></i>
                            </span>
                            <h5>Statistiques</h5>
                        </div>
                        <div class="widget-content">
                            <div class="chart"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% } %>
    <% catch (NullReferenceException nre)
       { %>
        <h5>Vous n'avez pas de programme</h5>
    <% } %>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
