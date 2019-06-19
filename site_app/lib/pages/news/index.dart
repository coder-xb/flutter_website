import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/news.dart';
import '../../config/index.dart';
import './detail.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsPage> {
  NewsListModel _listData = NewsListModel([]);

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  // 添加数据
  void _getNews() async {
    NewsListModel _list = NewsListModel.fromJson(await getNews());
    setState(() {
      _listData.data.addAll(_list.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 带分割线的ListView
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: _listData.data.length,
        separatorBuilder: (BuildContext context, int index) => Divider(height: .5,color: Colors.grey,),
        // 新闻列表构造器
        itemBuilder: (BuildContext context, int index) {
          // 新闻列表项数据
          NewsItemModel _item = _listData.data[index];
          // 返回UI渲染
          return ListTile(
            title: Text(_item.title),
            subtitle: Text(_item.content),
            leading: Icon(Icons.fiber_new),
            trailing: Icon(Icons.arrow_forward_ios),
            enabled: true,
            contentPadding: EdgeInsets.all(12),
            onTap: () {
              // 动态路由跳转到新闻详情页面
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => DetailPage(_item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
