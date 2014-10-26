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


PostsController = Paloma.controller('Posts');

update_title = ->
  $expected_title = $("#expected-post-title")
  price = $('#post_price').val()
  title = $('#post_title').val()
  size = $('#post_size_id').val()
  $expected_title.text("#{title} (size: #{size}) $#{price} SHIPPED")


PostsController.prototype.new = ->
  $(document).on 'keyup change blur', '#post_price', (e) ->
    update_title()
  $(document).on 'keyup change blur', '#post_title', (e) ->
    update_title()
  $(document).on 'change', '#post_size_id', (e) ->
    update_title()

