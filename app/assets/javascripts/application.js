// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require parsley.js
//= require moment.js
//= require angular
//= require angular-resource
//= require angularjs/rails/resource
//= require angular-ui
//- require angular-bootstrap
//- require angular-ui-bootstrap-tpls
//= require angular-slider.js
//= require jquery.cookie
//= require_tree .

// filepicker

function remove_fields (link) {
	$(link).prev("input[type=hidden]").value = "1";
	$(link).parent(".fields").hide();
}

function add_fields (link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g")
	$(link).before(content.replace(regexp, new_id));
}

$("#sign_up_business").on("show", function () {
  $("body").addClass("modal-open");
}).on("hidden", function () {
  $("body").removeClass("modal-open")
});

$("#sign_up_foodie").on("show", function () {
  $("body").addClass("modal-open");
}).on("hidden", function () {
  $("body").removeClass("modal-open")
});

$("#sign_in").on("show", function () {
  $("body").addClass("modal-open");
}).on("hidden", function () {
  $("body").removeClass("modal-open")
});

$("input").attr("autocomplete", "off");
$("select").attr("autocomplete", "off");

// bootstrap tooltips 

$('.city').tooltip();

$('.campaign').tooltip();

$('.why-zip').tooltip();

$('#yelp-explanation').tooltip();
