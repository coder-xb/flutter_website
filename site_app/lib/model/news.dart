// 新闻列表数据
class NewsListModel {
  List<NewsItemModel> data;
  NewsListModel(this.data);

  factory NewsListModel.fromJson(List<dynamic> json) => NewsListModel(
      json.map((index) => NewsItemModel.fromJson((index))).toList());
}

// 新闻列表项数据
class NewsItemModel {
  String author; // 作者
  String title; // 标题
  String content; // 内容

  NewsItemModel({
    this.author,
    this.title,
    this.content,
  });

  factory NewsItemModel.fromJson(dynamic json) => NewsItemModel(
    author: json['author'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
  );
}
