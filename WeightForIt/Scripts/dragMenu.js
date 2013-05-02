$("#retourMenu").click(function () {

    window.location.href = "/Front/Menu"
});



$("#RetourAddAlim").click(function () {
    $("#sectList").show();
    $("#product").hide();
    $("#controlBasket").hide();
});

$("#Valider").click(function () {
    $("#sectList").show();
    $("#product").hide();
    $("#controlBasket").hide();

    var arr = new Array();
    
    $(".count").each(function () {
        var element = $(this);
        if (element.attr("id") == "" || element.attr("value") == "") {
          
                alert("Veuillez vérifier votre menu !");
            

            return false;
        } else {
            if ((typeof element.attr("id") != 'undefined') && (typeof element.attr("value") != 'undefined')) {
                var id = element.attr("id")
                var qte = element.attr("value")
                var final = id + '_' + qte;
                arr.push(final);
            }

        }
       
    });


    var postData = { tab: arr, titre: jQuery("#titre_f").val(), tcal: jQuery("#tCalories").text().toString(), tpro: jQuery("#tProteins").text().toString(), tglu: jQuery("#tGlucides").text().toString(), tlip: jQuery("#tLipids").text().toString() };

    jQuery.ajax({
        type: "POST",
        url: "/Menu/Create",
        data: postData,
        success: function (data) {
            if (data.Success) {
          

                window.location.href = "/Front/Menu"

            } else {
                alert("Echec :( ");
            }
        },
        dataType: "json",
        traditional: true
    });


});


$("#product").hide();
$("#controlBasket").hide();


$("#listAlim").dynamiclist();


var $searchBox = jQuery('#listAlim input');


$searchBox.each(function () {
    var autoCompelteElement = this;
    var formElementName = $(this).attr('name');
   



    $(this).autocomplete({
        selectFirst: true,
        source: function (request, response) {
            jQuery.ajax({
                url: "/Menu/FindFoods", type: "POST", dataType: "json",
                data: { searchText: request.term, maxResults: 10 },
                success: function (data) {
                    response($.map(data, function (item) {
                      
                        return { label: item.RefValue, value: item.calories + '_' + item.proteins + '_' + item.glucides + '_' + item.lipids + '_' + item.unit, id: item.FoodId }
                    }))
                }
            })
        },
        select: function (event, ui) {
            $(this).next().val(ui.item.id);

            var selectedObj = ui.item;

            $(autoCompelteElement).val(selectedObj.label);
            $(autoCompelteElement).attr('id', formElementName + '_' + selectedObj.id + '_' + selectedObj.value);
            return false;
        },
        change: function (event, ui) {
            if (!ui.item) {
         
                $(this).val("");
            }
        },
        focus: function (event, ui) {
            var selectedObj = ui.item;
            this.value = selectedObj.label
        
            event.preventDefault(); // <-----
        }
    });
});




$(".list-add").click(function () {

    var $searchBox = jQuery('#listAlim input');
    $searchBox.each(function () {
        var autoCompelteElement = this;
        var formElementName = $(this).attr('name');
     
        $(this).autocomplete({
            selectFirst: true,
            source: function (request, response) {
                jQuery.ajax({
                    url: "/Menu/FindFoods", type: "POST", dataType: "json",
                    data: { searchText: request.term, maxResults: 10 },
                    success: function (data) {
                        response($.map(data, function (item) {
                            return { label: item.RefValue, value: item.calories + '_' + item.proteins + '_' + item.glucides + '_' + item.lipids + '_' + item.unit, id: item.FoodId }
                        }))
                    }
                })
            },
            select: function (event, ui) {
                $(this).next().val(ui.item.id);

                var selectedObj = ui.item;
                $(autoCompelteElement).val(selectedObj.label);
                $(autoCompelteElement).attr('id', formElementName + '_' + selectedObj.id + '_' + selectedObj.value);
                return false;
            },
            change: function (event, ui) {
                if (!ui.item) {
                
                    $(this).val("");
                }
            },
            focus: function (event, ui) {
                var selectedObj = ui.item;
                this.value = selectedObj.label

                event.preventDefault(); // <-----
            }
        });
    });

});


// display form submit data
$("form").submit(function (event) {
    event.preventDefault();
    if (jQuery("#titre_f").val().length<=0) {
    
         alert("Veuillez saisir un titre");

    return false;
    }
    var data = "";
    var testList = $("<ul class-'clear'></ul>");
    var i = 0;
    var first;
    var second;
    var arr = ["init"];
    var j = 0;
    $(this).find("input, select").each(function () {
        var element = $(this);
        if (element.attr("type") != "submit") {

            data += element.attr("name");
            data += "="
            data += element.attr("value");
            data += "; "
            if (element.attr("name") != "menuName") {

                if (element.attr("id") == "" || element.attr("id") == " " || element.attr("name") == "" || element.attr("name") == " " || element.attr("value") == " " || element.attr("value") == "") {
                    if (j == 0) {
                        alert("Vérifier votre saisie");
                    }
                    return false;
                } else {
                    
                    var split = element.attr("id").split('_');

                    if ($.inArray(split[1], arr) > -1) {
                        // pas d'ajout
                    } else {
                        arr.push(split[1]);
                        first = "<li data-id='" + split[1] + "'><a href='#'><h5>" + element.attr("value") + "</h5>";
                        second = "<p> Unité : " + split[6] + "  </p><p> Calories : <span class='name2 calories'>" + split[2] + "</span>  </p><p> Proteins : <span class='name2 proteins'>" + split[3] + "</span>  </p><p> Glucides : <span class='name2 glucides'>" + split[4] + "</span>  </p>   <p> Lipids : <span class='name2 lipids'>" + split[5] + "</span>  </p></a></li>";
                        $(testList).append($(first + second));
                        i++;
                    }

                    $('#product').html(testList);
                    //alert(data);
                    $("#sectList").hide();
                    $("#product").show();
                    $("#controlBasket").show();
                    ///////
                    j++;

                }

            }

         
        }
    });





    // jQuery UI Draggable
    $("#product li").draggable({

        // brings the item back to its place when dragging is over
        revert: true,

        // once the dragging starts, we decrease the opactiy of other items
        // Appending a class as we do that with CSS
        drag: function () {
            $(this).addClass("active");
            $(this).closest("#product").addClass("active");
        },

        // removing the CSS classes once dragging is over.
        stop: function () {
            $(this).removeClass("active").closest("#product").removeClass("active");
        }
    });


    function changeTotal() {
    
               //on vide all
        $("#tCalories").text("0");

        $("#tProteins").text("0");

        $("#tGlucides").text("0");
  
        $("#tLipids").text("0");
    

         $(".count").each(function () {
     
             var element = $(this);
             if (element.attr("id") == "" || element.attr("value") == "") {
            
               
                 return false;
             } else {
              
                 if ((typeof element.attr("id") != 'undefined') && (typeof element.attr("value") != 'undefined')) {
                     var id = element.attr("id");
                     var qte = parseFloat(element.attr("value"));
 
                    // alert("id : "+id);
                     //alert("qte : "+qte);
                     var itemId = $("#product").find("ul li[data-id='" + id + "']");
                     if (itemId.html() != null) {
                         var e = $(this);
                        
                         itemId.find(".name2").each(function () {
                             var a = $(this);
                          
                             var type = parseFloat(a.text());
                             
                             if (a.hasClass('calories')) {
                                
                                 $("#tCalories").text(Math.round(type * qte).toFixed(2));
                                
                             } else if (a.hasClass('proteins')) {
                                 $("#tProteins").text(Math.round(type * qte).toFixed(2));
                             } else if (a.hasClass('glucides')) {
                                 $("#tGlucides").text(Math.round(type * qte).toFixed(2));
                             } else if (a.hasClass('lipids')) {
                                 $("#tLipids").text(Math.round(type * qte).toFixed(2));
                             }
 
                         });
 
                     }
                 }
 
             }
         });
             
    }


    // jQuery UI Droppable
    $(".basket").droppable({
        
        // The class that will be appended to the to-be-dropped-element (basket)
        activeClass: "active",

        // The class that will be appended once we are hovering the to-be-dropped-element (basket)
        hoverClass: "hover",

        // The acceptance of the item once it touches the to-be-dropped-element basket
        // For different values http://api.jqueryui.com/droppable/#option-tolerance
        tolerance: "touch",
        drop: function (event, ui) {

            var basket = $(this),
                    move = ui.draggable,
                    itemId = basket.find("ul li[data-id='" + move.attr("data-id") + "']");
            

            // To increase the value by +1 if the same item is already in the basket
            if (itemId.html() != null) {
                itemId.find("input").val(parseInt(itemId.find("input").val()) + 1);
                changeTotal();
            }
            else {
                // Add the dragged item to the basket
                addBasket(basket, move);

                move.find("input").val(parseInt(move.find("input").val()) + 1);
            
                changeTotal();
            }

          
        }
    });

    //Only number and one dot
    function onlyDecimal(element) {
        
        $(element).keypress(function (event) {
            if(event.which < 46
        || event.which > 59) {
                event.preventDefault();
                changeTotal();
            } // prevent if not number/dot

            if(event.which == 46
            && $(this).val().indexOf('.') != -1) {
                event.preventDefault();
                changeTotal();
            } // pre
        });
        changeTotal();
    }


   

   



    function addBasket(basket, move) {
        basket.find("ul").append('<li data-id="' + move.attr("data-id") + '">'
                + '<span class="name">' + move.find("h5").html() + '</span>'
                + '<input class="count" id="' + move.attr("data-id") + '" type="number" value="1" min="1" value="1">'
                + '<button class="delete">✕</button>');

       /* $(".count").bind("keyup paste", function () {
            setTimeout(jQuery.proxy(function () {
                this.val(this.val().replace(/[^0-9]/g, '1'));
            }, $(this)), 0);
        });*/

        // onlyDecimal(".count", 1);

        $(".count").numeric();
        $('.count').blur(function () {
            changeTotal();
        });
        
    }



    $(".basket ul li button.delete").live("click", function () {
        $(this).closest("li").remove();
        changeTotal();
    });



   
});
