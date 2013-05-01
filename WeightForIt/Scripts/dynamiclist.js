/**
 * jQuery Dynamic List v 2.0.1
 * Copyright 2012 Ike Lin
 * http://www.apache.org/licenses/LICENSE-2.0.txt
 */
(function(a){a.fn.dynamiclist=function(d){if(this.length>1){this.each(function(){a(this).dynamiclist(d)});return this}var g=a.extend({itemClass:"list-item",addClass:"list-add",removeClass:"list-remove",minSize:1,maxSize:100,withEvents:false,addCallbackFn:null,removeCallbackFn:null},d);var f=function(o,n,j){var m=o.find("."+j.itemClass).length;if(m<j.maxSize){var l=o.find("."+j.itemClass+":first").clone(j.withEvents);l.find("."+j.removeClass).show().click(function(p){e(o,a(this),p,j)});b(l,m);i(l);var k=o.find("."+j.itemClass+":last");k.after(l);if(j.addCallbackFn!=null){j.addCallbackFn(l)}}if(n!=null){n.preventDefault()}};var e=function(o,k,n,j){var m=o.find("."+j.itemClass).length;var l=k.parents("."+j.itemClass+":first");if(m==j.minSize){i(l)}else{l.remove()}c(o,j);if(j.removeCallbackFn!=null){j.removeCallbackFn(l)}n.preventDefault()};var b=function(j,k){j.find("label, input, select, textarea").each(function(){var m=["class","name","id","for"];for(var n=0;n<m.length;n++){var l=a(this).attr(m[n]);if(l){l=l.replace(/\d+\./,k+".");l=l.replace(/\[\d+\]\./,"["+k+"].")}a(this).attr(m[n],l)}})};var c=function(k,j){k.find("."+j.itemClass).each(function(){var l=k.find("."+j.itemClass).index(this);b(a(this),l)})};var i=function(j){j.find("input[type=text], textarea").val("");j.find("input[type=radio]").attr({checked:false});j.find("input[type=checkbox]").attr({checked:false})};var h=function(k){k.find("."+g.itemClass+":first ."+g.removeClass).hide();var j=k.find("."+g.itemClass).length;while(g.minSize>j){f(k,null,g);j++}k.find("."+g.addClass).click(function(l){f(k,l,g)});k.find("."+g.removeClass).click(function(l){e(k,a(this),l,g)});return k};return h(this)}})(jQuery);