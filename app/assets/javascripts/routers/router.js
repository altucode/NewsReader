NewsReader.Routers.Router = Backbone.Router.extend({
  routes: {
    '': 'root',
    'feeds/': 'feedIndex',
    'feeds/:id': 'feedShow'
  },

  index: function() {

    var router = this;

    NewsReader.Collections.feeds.fetch({
      success: function(collection) {
        var indexView = new NewsReader.Views.FeedIndex({
          collection: collection
        });
        router._swapView(indexView);
      }
    })
  },

  feedShow: function (id) {
    var router = this;
    NewsReader.Collections.feeds.getOrFetch(id).fetch({
      success: function(model) {
        var showView = new NewsReader.Views.FeedShow({
          model: model
        });
        router._swapView(showView);
      }
    });

  },

  _swapView: function(newView) {
    this.currentView && this.currentView.remove();

    $('#content').html(newView.render().$el);

    this.currentView = newView;
  }
});