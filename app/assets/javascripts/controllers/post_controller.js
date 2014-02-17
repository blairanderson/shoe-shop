ShoeShop.PostController = Ember.ObjectController.extend({
  titleLength: function() {
    return this.get('title').length;
  }.property('title')
});