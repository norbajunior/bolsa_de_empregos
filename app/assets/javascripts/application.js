// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-datepicker
//= require bootstrap-filestyle
//= require handlebars
//= require_tree .
$(function() {
  $('a[data-interested]').click(function (e) {
    e.preventDefault();

    var that   = $(this),
        alreadyInterested = that.data('interested');

    if (alreadyInterested) {
      $.post('/interests/' + alreadyInterested, { _method: 'delete' }, function (response) {
        $(that).data('interested', false).
         text('Interessado/a').
         toggleClass("btn-warning btn-success");
      });
    } else {
      var params = { interest: { user_id: that.data('user-id') } };

      $.post('/interests', params, function (response) {
        $(that).data('interested', response.id).
         text('Remover interesse').
         toggleClass("btn-success btn-warning");
      });
    }
  })
});
