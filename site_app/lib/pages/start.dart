import 'dart:async';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<StartPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      print('Flutter企业站APP启动...');
       Navigator.of(context).pushReplacementNamed('/app');
    });
  }

  @override
  Widget build(BuildContext context) {
    // 可用pageView进行广告页切换
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/loading.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              '企业站APP',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
