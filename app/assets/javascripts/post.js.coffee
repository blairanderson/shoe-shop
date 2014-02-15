$(document).on "ajax:success", "a.upvote", (e, data, status, xhr) ->
  score = data.cached_votes_score
  $(this).parent().find('a.score').text(score)
  $item = $(this).parents('.list-group-item')
  # $item.toggle('highlight')
  # $item.toggle('highlight')

$(document).on "ajax:success", "a.downvote", (e, data, status, xhr) ->
  score = data.cached_votes_score
  $(this).parent().find('a.score').text(score)
  $item = $(this).parents('.list-group-item')
  # $item.toggle('highlight')
  # $item.toggle('highlight')

