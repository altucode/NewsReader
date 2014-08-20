NewsReader.Views.FeedList = NewsReader.Views.List.extend({
  template: JST['feed_list'],
  itemView: NewsReader.Views.FeedListItem
});