import 'package:flutter/material.dart';
import '../../model/news.dart';

class DetailPage extends StatelessWidget {
  final NewsItemModel _item;
  DetailPage(this._item);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(_item.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Text(_item.content),
        ),
      );
}
