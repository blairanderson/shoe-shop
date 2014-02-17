ShoeShop.PostsController = Ember.ArrayController.extend({
  titleLength: function() {
    return this.get('title').length;
  }.property('title')
});