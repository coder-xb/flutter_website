import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import './pages/tabs.dart';
import './pages/start.dart';

void main() => runApp(SiteApp());

class SiteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      title: 'Flutter企业站',
      // 自定义主题
      theme: _default,
      // 静态路由配置
      routes: <String, WidgetBuilder>{
        '/app': (BuildContext context) => AppTabs(),
        '/company': (BuildContext context) => WebviewScaffold(
          url: 'https://www.baidu.com',
          appBar: AppBar(
            title: Text('公司简介'),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // 切换路由回到主界面
                Navigator.of(context).pushReplacementNamed('/app');
              },
            ),
          ),
        )
      },
      // home 默认进入到启动页
      home: StartPage(),
    );
  }

  final ThemeData _default = ThemeData(
    primaryColor: Colors.blueGrey
  );
}
