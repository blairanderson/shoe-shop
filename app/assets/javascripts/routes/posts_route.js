ShoeShop.PostsRoute = Ember.Route.extend({
  model: function(params) {
    return Ember.$.getJSON("/pairs.json");
  },
  setupController: function(controller, model) {
    this.controllerFor('posts').set('posts', model.posts);
  },
});