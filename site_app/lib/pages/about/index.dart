import 'package:flutter/material.dart';
import './contact.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/company.jpg',
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('公司介绍'),
              onTap: () {
                // 动态路由跳转到新闻详情页面
                Navigator.of(context).pushReplacementNamed('/company');
              },
            ),
            Divider(
              height: 10,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('公司优势'),
            ),
            Divider(
              height: 10,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('联系我们'),
              onTap: () {
                // 动态路由跳转到新闻详情页面
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ContactPage(),
                  ),
                );
              },
            ),
            Divider(
              height: 10,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
