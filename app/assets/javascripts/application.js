// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
// Giga
//= require jquery3
//= require bootstrap
//= require modernizr
// 3rd-party
//= require select2

$(document).on('turbolinks:load', function() {
  $('.select2').select2({ theme: 'bootstrap' });
});

WebFontConfig = {
  google: {
    families: ['Cambo', 'Lato:400,700']
  }
};

(function(d) {
  var wf = d.createElement('script'), s = d.scripts[0];
  wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js';
  wf.async = true;
  s.parentNode.insertBefore(wf, s);
})(document);
