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
//= require jquery.mask
//= require handlebars

var Entities = { Dashboard: { Offers: {} } };

$(function() {
  // refactor :(
  // add or remove an interest

  $('#collection').on('click', 'a[data-interested]', function (e) {
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
  });

  // add or remove an application
  $('#collection').on('click', 'a.application', function (e) {
    e.preventDefault();

    var that   = $(this),
        alreadyApplied = that.attr('data-application-id');

    if (alreadyApplied) {
      $.post('/applications/' + alreadyApplied, { _method: 'delete' }, function (offerId) {
         that.attr('data-apply', true).
         attr('data-offer-id', offerId).
         removeAttr('data-application-id').
         text('Candidatar-me');
      });
    } else {
      var params = { application: { offer_id: that.data('offer-id') } };

      $.post('/applications', params, function (response) {
         that.attr('data-application-id', response.id).
         removeAttr('data-apply').
         removeAttr('data-offer-id').
         text('Remover candidatura');
      });
    }

    that.toggleClass("btn-warning btn-success");
  });

  $('input[type=file]').change(function(){
    var file  = this.files[0],
        size  = file.size || file.fileSize,
        maxSize = $(this).data('max-size'),
        parentElement = $(this).parent();

    if (size > maxSize) {
      $(parentElement).addClass('has-error');

      var source = $('#error-message-template').html(),
          template = Handlebars.compile(source);

      $(parentElement).append(template({msg: 'deve ser menor que ' + (maxSize / 1024 / 1024) + 'MB' }));
    } else {
      $(parentElement).removeClass('has-error');
      $(parentElement).find('.help-block').remove();
    }
	});
});
