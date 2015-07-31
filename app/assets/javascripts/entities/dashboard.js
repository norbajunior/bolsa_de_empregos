Entities.Dashboard.Offers = (function () {
  var $context   = $('#entity-dashboard'),
      $template  = $('#offer-template'),
      target     = 'a[data-active]',
      url        = '/offers/:id.json';

  function addActivateOrDeactivateOnClickEvent () {
    $context.on('click', target, function (e) {
      e.preventDefault(); activateOrDeactivate($(this));
    });
  }

  function activateOrDeactivate ($el) {
    var id     = $el.data('offer-id'),
        active = !$el.data('active'),
        path    = url.replace(':id', id),
        params = { _method: 'patch', offer: { active: active } };

    $.post(path, params, function (offer) { handleView($el, id, offer, active); });
  }

  function handleView($el, id, offer, active) {
    var source = $template.html(), template = Handlebars.compile(source);

    if (active) {
      $('#inactive-offers #offer_' + id).fadeOut('slow', function() {
        $el.remove();

        $(template(offer)).appendTo('#active-offers').hide().fadeIn(1000);
      });
    } else {
      $('#active-offers #offer_' + id).fadeOut('slow', function() {
        $el.remove();

        $(template(offer)).appendTo('#inactive-offers').hide().fadeIn(1000);
      });
    }
  }

  return {
    init: function () {
      addActivateOrDeactivateOnClickEvent();
    }
  }
})();

Entities.Dashboard.Offers.init();
