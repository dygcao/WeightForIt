/**
 * Unicorn Admin Template
 * Diablo9983 -> diablo9983@gmail.com
**/
$(document).ready(function(){
	

	// === Prepare peity charts === //
	unicorn.peity();
	
	// === Make chart === //
	
	$.getJSON('/Dashboard/GetJsonData', function(data) {
	    var Poids    = [];
	    var Calories = [];

	    $.map(data.collectionWeight, function (item) {
	        var itemtest = (item.Date).replace('/Date(', '');
	        var result = itemtest.replace(')/', '');
	        Poids.push([result, item.Poids]);
		})

	    $.map(data.collectionCalorie, function (item) {

	        var itemtest = (item.Date).replace('/Date(', '');
	        var result = itemtest.replace(')/', '');
	        Calories.push([result, item.Calories]);
	    })
	    //alert("Poids = " + Poids + " et Calories = " + Calories);

		
		var plot = $.plot($(".chart"),
		[{ data: Poids, label: "Poids (Kg)", color: "#BA1E20" }, { data: Calories, label: "Calories (KCal)", color: "#459D1C" }], {
		   series: {
			   lines: { show: true },
			   points: { show: true }
		   },
		   grid: { hoverable: true, clickable: true },
		   xaxis: { mode: "time", minTickSize: [1, "day"], timeformat: "%d/%m/%y"}
	   });
	});
	
	
	// === Point hover in chart === //
    var previousPoint = null;
    $(".chart").bind("plothover", function (event, pos, item) {
		
        if (item) {
            if (previousPoint != item.dataIndex) {
                previousPoint = item.dataIndex;
                
                $('#tooltip').fadeOut(200,function(){
					$(this).remove();
				});
                var x = item.datapoint[0].toFixed(2),
					y = item.datapoint[1].toFixed(2);
                    
                if(item.series.label=='Poids (Kg)'){
					unicorn.flot_tooltip(item.pageX, item.pageY, parseInt(y) + ' Kg');
				}else{
					unicorn.flot_tooltip(item.pageX, item.pageY, parseInt(y) + ' Kcal');
				}
            }
            
        } else {
			$('#tooltip').fadeOut(200,function(){
					$(this).remove();
				});
            previousPoint = null;           
        }   
    });
	
});

unicorn = {
		// === Peity charts === //
		peity: function(){		
			$.fn.peity.defaults.line = {
				strokeWidth: 1,
				delimeter: ",",
				height: 24,
				max: null,
				min: 0,
				width: 50
			};
			$.fn.peity.defaults.bar = {
				delimeter: ",",
				height: 24,
				max: null,
				min: 0,
				width: 50
			};
			$(".peity_line_good span").peity("line", {
				colour: "#B1FFA9",
				strokeColour: "#459D1C"
			});
			$(".peity_line_bad span").peity("line", {
				colour: "#FFC4C7",
				strokeColour: "#BA1E20"
			});	
			$(".peity_line_neutral span").peity("line", {
				colour: "#CCCCCC",
				strokeColour: "#757575"
			});
			$(".peity_bar_good span").peity("bar", {
				colour: "#459D1C"
			});
			$(".peity_bar_bad span").peity("bar", {
				colour: "#BA1E20"
			});	
			$(".peity_bar_neutral span").peity("bar", {
				colour: "#757575"
			});
		},

		// === Tooltip for flot charts === //
		flot_tooltip: function(x, y, contents) {
			
			$('<div id="tooltip">' + contents + '</div>').css( {
				top: y + 5,
				left: x + 5
			}).appendTo("body").fadeIn(200);
		}
}
