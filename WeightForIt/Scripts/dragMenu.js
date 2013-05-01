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


    var postData = { tab: arr, titre: jQuery("#titre_f").val() };

    jQuery.ajax({
        type: "POST",
        url: "/Menu/Create",
        data: postData,
        success: function (data) {
            if (data.Success) {
                alert("Menu valider :) ");
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
                      
                        return { label: item.RefValue, value: item.calories + '_' + item.proteins + '_' + item.glucides + '_' + item.lipids, id: item.FoodId }
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
                //http://api.jqueryui.com/autocomplete/#event-change -
                // The item selected from the menu, if any. Otherwise the property is null
                //so clear the item for force selection
                $(this).val("");
            }
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
                            return { label: item.RefValue, value: item.calories + '_' + item.proteins + '_' + item.glucides + '_' + item.lipids, id: item.FoodId }
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
                    //http://api.jqueryui.com/autocomplete/#event-change -
                    // The item selected from the menu, if any. Otherwise the property is null
                    //so clear the item for force selection
                    $(this).val("");
                }
            }
        });
    });

});


// display form submit data
$("form").submit(function (event) {
    event.preventDefault();
    var data = "";
    var testList = $("<ul class-'clear'></ul>");
    var i = 0;
    var first;
    var second;
    var arr = ["init"];

    $(this).find("input, select").each(function () {
        var element = $(this);
        if (element.attr("type") != "submit") {

            data += element.attr("name");
            data += "="
            data += element.attr("value");
            data += "; "
            if (element.attr("name") != "menuName") {

                if (element.attr("id") == "" || element.attr("id") == " " || element.attr("name") == "" || element.attr("name") == " " || element.attr("value") == " " || element.attr("value") == "") {
                    alert("Vérifier votre saisie");
                    return false;
                } else {

                    var split = element.attr("id").split('_');

                    if ($.inArray(split[1], arr) > -1) {
                        // pas d'ajout
                    } else {
                        arr.push(split[1]);
                        first = "<li data-id='" + split[1] + "'><a href='#'><h3>" + element.attr("value") + "</h3>";
                        second = "<p> Calories : " + split[2] + "  </p><p> Proteins : " + split[3] + " </p><p> Glucides : " + split[4] + " </p>   <p> Lipids : " + split[5] + " </p></a></li>";
                        $(testList).append($(first + second));
                        i++;
                    }

                    $('#product').html(testList);
                    //alert(data);
                    $("#sectList").hide();
                    $("#product").show();
                    $("#controlBasket").show();
                    ///////


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
            }
            else {
                // Add the dragged item to the basket
                addBasket(basket, move);

                move.find("input").val(parseInt(move.find("input").val()) + 1);
            }
        }
    });

    //Only number and one dot
    function onlyDecimal(element) {
        $(element).keypress(function (event) {
            if(event.which < 46
        || event.which > 59) {
                event.preventDefault();
            } // prevent if not number/dot

            if(event.which == 46
            && $(this).val().indexOf('.') != -1) {
                event.preventDefault();
            } // pre
        });
    }

   



    function addBasket(basket, move) {
        basket.find("ul").append('<li data-id="' + move.attr("data-id") + '">'
                + '<span class="name">' + move.find("h3").html() + '</span>'
                + '<input class="count" id="' + move.attr("data-id") + '" type="number" value="1" min="1" value="1">'
                + '<button class="delete">✕</button>');

       /* $(".count").bind("keyup paste", function () {
            setTimeout(jQuery.proxy(function () {
                this.val(this.val().replace(/[^0-9]/g, '1'));
            }, $(this)), 0);
        });*/

       

        onlyDecimal(".count", 1);
    }



    $(".basket ul li button.delete").live("click", function () {
        $(this).closest("li").remove();
    });


   
});
