Filters = Paloma.controller('Filters')

Filters.prototype.index = ->
  fadeIn = (el) ->
    $(el).removeClass('transparent').addClass('visible')

  fadeInImages = ->
    $('img.transparent').each (i, el) ->
      fadeIn(el)

  setTimeout(fadeInImages,2500)
  
  $('img.transparent').on 'load', ->
    fadeIn(this)
