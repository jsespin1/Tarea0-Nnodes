// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require best_in_place
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});

var time = new Date().getTime();

function refresh() {
 modal = $('#modal').hasClass('in');
    var sourceUrl = 'roulette/new_round';
		$.ajax({
			"url": sourceUrl,
			"success": function(data,ts, jg){
				console.log("SUCCESS!", data, ts, jg);
				//buildCardInfo(data);

			},
			"error": function(jg, st, er){
				console.log("Error: (", jg, st, er);
			}
	});
    setTimeout(refresh, 3000);
}

setTimeout(refresh, 3000);


//Lo siguiente es para agregar $10.000 cada 24 horas a cada jugador active


$( document ).ready(function() {
		//ev.preventDefault();
		var sourceUrl = 'roulette/increase';
		$.ajax({
			"url": sourceUrl,
			"success": function(data,ts, jg){
				console.log("SUCCESS!", data, ts, jg);
				//buildCardInfo(data);

			},
			"error": function(jg, st, er){
				console.log("Error: (", jg, st, er);
			}
		});
	});



