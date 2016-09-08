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
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

var time = new Date().getTime();

function refresh() {
 modal = $('#modal').hasClass('in');
 if( (new Date().getTime() - time >= 180000) && (!modal)) 
     window.location.reload(true);
 else 
     setTimeout(refresh, 3000);
}

setTimeout(refresh, 3000);


//Lo siguiente es para agregar $10.000 cada 24 horas a cada jugador activo

$(function(){

	var $cardLinks = $('h1.hola');

	//Le asociamos un evento a la variable JQuery. En click se ejecuta la funcion 
	//definida y recibe como parámetro el evento (ev)
	$( document ).ready(function() {
		ev.preventDefault();

		var $link = $(this);
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

		//alert("Cada Jugador Recibirá 10.000 a su Balance");

	});

});




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
