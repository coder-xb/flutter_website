import 'package:flutter/material.dart';

import './home/index.dart';
import './news/index.dart';
import './about/index.dart';
import './product/index.dart';

class AppTabs extends StatefulWidget {
  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<AppTabs> {
  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter企业站APP'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/app');
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: _curPage(_curIndex),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _curIndex,
        onTap: (int index) {
          setState(() {
            _curIndex = index;
          });
        },
        // 底部导航项
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text('产品'), icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              title: Text('新闻'), icon: Icon(Icons.fiber_new)),
          BottomNavigationBarItem(title: Text('我们'), icon: Icon(Icons.message)),
        ],
      ),
    );
  }

  HomePage homePage;
  NewsPage newsPage;
  AboutPage aboutPage;
  ProductPage productPage;

  // 根据当前tab的索引返回不同页面
  dynamic _curPage(int index) {
    switch (index) {
      case 0:
        homePage = homePage ?? HomePage();
        return homePage;
      case 1:
        productPage = productPage ?? ProductPage();
        return productPage;
      case 2:
        newsPage = newsPage ?? NewsPage();
        return newsPage;
      case 3:
        aboutPage = aboutPage ?? AboutPage();
        return aboutPage;
    }
  }
}
