NewsReader.Models.Feed = Backbone.Model.extend({
  name: 'feed',
  url: function() {
    return 'api/feeds/' + (this.id);
  },
  entries: function () {
    if (!this._entries) {
      this._entries = new NewsReader.Collections.Entries({
        feed: this
      });
    }
    return this._entries;
  },
  parse: function (response) {
    if (response['latest_entries']) {
      this.entries().set(response['latest_entries']);
      delete response['latest_entries'];
    }
    return response;
  }
});