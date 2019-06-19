import 'package:flutter/material.dart';
import '../model/product.dart';

class DetailPage extends StatelessWidget {
  final ProductItemModel _item;
  DetailPage(this._item);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(_item.name),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              _item.img,
              fit: BoxFit.cover,
            ),Padding(
                padding: EdgeInsets.all(20),
                child: Text(_item.desc),
              ),
          ],
        ),
      );
}
