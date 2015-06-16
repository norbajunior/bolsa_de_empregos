$(function () {
  $('#entity_nif').mask('000000000');

  $('#entity-dashboard').on('click', 'a[data-active]', function (e) {
    e.preventDefault();

    var id = $(this).data('offer-id'),
        active = !$(this).data('active'),
        params = { _method: 'patch', offer: { active: active } };

    $.post('/offers/' + id + '.json', params, function (offer) {
      var source = $('#offer-template').html(),
          template = Handlebars.compile(source);

      if (active) {
        $('#inactive-offers #offer_' + id).fadeOut('slow', function() {
          $(this).remove();

          $(template(offer)).appendTo('#active-offers').hide().fadeIn(1000);
        });
      } else {
        $('#active-offers #offer_' + id).fadeOut('slow', function() {
          $(this).remove();

          $(template(offer)).appendTo('#inactive-offers').hide().fadeIn(1000);
        });
      }
    });
  });
});
