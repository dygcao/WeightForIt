<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<WeightForIt.Models.Menu>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <link href="../../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
      <%: Styles.Render("~/Content/dragmenucss") %>
<h2>Vos Menus</h2>



    <div id="retourMenu" style="padding-top:20px;">
          
             <input type="button" id="Create" class="btn btn-primary btn-large" value="Créer un menu"/>
            
        </div>
      <div class="container">
    
    <section id="product">

        <ul class='clear'>

      <% foreach (var item in Model) { %>
                      <li data-id="<%: item.MenuId  %>">
                          <a href='/Front/Menu/Details/<%: item.MenuId  %>'><h5><%: item.label %></h5>
                         </a></li>
        <% } %>

        </ul>
    </section>

     </div>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script>

        $("#Create").click(function () {

            window.location.href = "/Front/Menu/Create"
        });

    </script>
</asp:Content>