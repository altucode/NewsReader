NewsReader.Views.FeedShow = Backbone.View.extend({
  template: JST['feed_show'],
  events: {
    'click #update' : 'update'
  },
  render: function() {
    var content = this.template({ feed: this.model });
    this.$el.html(content);
    return this;
  },
  update: function() {
    this.model.fetch({
      success: this.render.bind(this)
    })
  }
});