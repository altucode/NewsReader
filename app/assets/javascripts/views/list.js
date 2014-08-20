NewsReader.Views.List = Backbone.View.extend({
  remove: function() {
    Backbone.View.prototype.remove.call(this);
    this.subviews().forEach(function (subviews))
  },
  render: function() {
    var content = this.template({ list: this.collection });
    this.$el.html(content);
    var ul = this.$el.find('ul');
    this.subviews().forEach(function(subview) {
      ul.append(subview);
    });

    return this;
  },
});