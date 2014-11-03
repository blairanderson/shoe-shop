Filters = Paloma.controller('Filters')

Filters.prototype.index = ->
  $('img.transparent').on 'load', ->
    $(this).removeClass('transparent').addClass('visible')
