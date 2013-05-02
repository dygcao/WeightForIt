function saveProgram(){
var tab=new Array();

 $("#listBasket ul").find("li").each(function(){
	tab.push( parseInt($(this).attr("data-id")) );
 });

 $.ajax({
  type: "POST",
  url: "/Front/Ajax/saveProgram",
  dataType: "json",
  data: {program : $("#builderProgram").attr("data-program") ,menus : tab },
  traditional: true,
  success: function(data){
	if(data.Success){
		alert("Sauvegarde réussie");
	}else{
		alert("Erreur de sauvegarde");
	}
  },
});
 
}

$(document).ready(function () {

		// jQuery UI Draggable
		$("#builderProgram #menu li").draggable({
		
			// brings the item back to its place when dragging is over
			revert:true,
		
			// once the dragging starts, we decrease the opactiy of other items
			// Appending a class as we do that with CSS
			drag:function () {
				$(this).addClass("active");
				$(this).closest("#builderProgram #menu").addClass("active");
			},
		
			// removing the CSS classes once dragging is over.
			stop:function () {
				$(this).removeClass("active").closest("#builderProgram #menu").removeClass("active");
			}
		});

        // jQuery Ui Droppable
		$("#listBasket.basket").droppable({
		
			// The class that will be appended to the to-be-dropped-element (basket)
			activeClass:"active",
		
			// The class that will be appended once we are hovering the to-be-dropped-element (basket)
			hoverClass:"hover",
		
			// The acceptance of the item once it touches the to-be-dropped-element basket
			// For different values http://api.jqueryui.com/droppable/#option-tolerance
			tolerance:"touch",
			drop:function (event, ui) {
		
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
		
					// Updating the quantity by +1" rather than adding it to the basket
					move.find("input").val(parseInt(move.find("input").val()) + 1);
				}
			}
		});

        // This function runs onc ean item is added to the basket
        function addBasket(basket, move) {
	
					basket.find("ul").append('<li data-id="' + move.attr("data-id") + '">'
							+ '<span class="name">' + move.find("h3").html() + '</span>'
							+ '<button class="delete">&#10005;</button>');
			
					var calories = move.find("."+move.attr("data-id")+"_calories");
					var proteins = move.find("."+move.attr("data-id")+"_proteins");
					var lipids =  move.find("."+move.attr("data-id")+"_lipids");
					var glucides =  move.find("."+move.attr("data-id")+"_glucides"); 
					
					$("#total li .total_calories").text( parseInt($("#total li .total_calories").text()) + parseInt(calories.text()) );
					$("#total li .total_proteins").text( parseInt($("#total li .total_proteins").text()) + parseInt(proteins.text()) );
					$("#total li .total_lipids").text( parseInt($("#total li .total_lipids").text()) + parseInt(lipids.text()) );
					$("#total li .total_glucides").text( parseInt($("#total li .total_glucides").text()) + parseInt(glucides.text()));	
		}


        // The function that is triggered once delete button is pressed
        $(".basket ul li button.delete").live("click", function () {
			var current = $(this).closest("li");
			
			var calories = $("."+current.attr("data-id")+"_calories");
			var proteins = $("."+current.attr("data-id")+"_proteins");
			var lipids =  $("."+current.attr("data-id")+"_lipids");
			var glucides =  $("."+current.attr("data-id")+"_glucides"); 
			
			 $.ajax({
						  type: "POST",
						  url: "/Front/Ajax/deleteMeal",
						  dataType: "json",
						  data: { program : $("#builderProgram").attr("data-program") ,menu : parseInt( current.attr("data-id") ) },
						  traditional: true,
						  success: function(data){
							if(data.Success){
										$("#total li .total_calories").text( parseInt($("#total li .total_calories").text()) - parseInt(calories.text()) );
										$("#total li .total_proteins").text( parseInt($("#total li .total_proteins").text()) - parseInt(proteins.text()) );
										$("#total li .total_lipids").text( parseInt($("#total li .total_lipids").text()) - parseInt(lipids.text()) );
										$("#total li .total_glucides").text( parseInt($("#total li .total_glucides").text()) - parseInt(glucides.text()));	
										current.remove();
							}else{
								alert("Suppression échouée");
							}
						  },
			});
		
	});
	
	$("#saveProgram").click(function(){
		saveProgram();
	});
});
