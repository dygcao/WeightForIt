<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <link href="../../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
     <%: Styles.Render("~/Content/dragmenucss") %>
 
<h2>Créer un Menu </h2>
      <div id="retourMenu" style="padding-top:20px;">
          
             <input type="button" id="Button1" class="btn btn-primary btn-large" value="Menu"/>
            
        </div>

       <div class="container">
      <section id="sectList"> 
            <form class="form-horizontal">

            <div class="control-group">
                <label class="control-label">Menu</label>
                <div class="controls">
                    <input name="menuName" id="titre_f" type="text" placeholder="Menu Name">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Liste des aliments</label>
                <div id="listAlim" class="controls">
                    <div class="list-item">

                        <input name="alimentsList[0].name" type="text" placeholder="Aliment">
                        <a href="#" class="list-remove btn btn-small"><i class="icon-minus"></i> Supprimer un aliment</a>
                    </div>
                    <a href="#" class="list-add btn btn-small"><i class="icon-plus"></i> Ajouter un  aliment</a>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <input type="submit" class="btn btn-primary btn-large" value="Suivant"/>
                </div>
            </div>
        </form>
        <hr />

    </section>

    <section id="product">

    </section>
      
    <aside id="sidebar">
    <div class="basket">
        <div class="basket_list">
            <div class="head">
                <span class="name">Nom du Produit</span>
                <span class="count">Quantité</span>
            </div>
            <ul>
            </ul>
        </div>
    </div>

          <div class="basket2" style="padding-top:20px">
        <div class="basket_list">
            <div class="head">
                <span class="name">Total</span>
            </div>
           <ul>
                <li>
                      <span class="name">Calories</span>
                     <span id="tCalories" class="name2">0</span>
                    
                </li>
                   <li>
                      <span class="name">Proteins</span>
                        <span id="tProteins" class="name2">0</span>
                      
                </li>
                   <li>
                      <span class="name">Glucides</span>
                        <span id="tGlucides" class="name2">0</span>
                 
                </li>
                   <li>
                      <span class="name">Lipids</span>
                        <span id="tLipids" class="name2">0</span>
                 
                </li>

           </ul>
        </div>
    </div>

        <div id="controlBasket" style="padding-top:20px;">
          
             <input type="button" id="RetourAddAlim" class="btn btn-primary btn-large" value="Retour"/>
            <input type="submit" id="Valider" class="btn btn-primary btn-large" value="Valider"/>
        </div>
           
    </aside>

           </div>


   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
    <%: Scripts.Render("~/bundles/dragmenu") %>
   
</asp:Content>
