import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/product.dart';
import '../../utils/index.dart';
import '../detail.dart';

class ProductWidget extends StatelessWidget {
  final ProductListModel _list;
  ProductWidget(this._list);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(5),
      width: _width,
      child: _build(context, _width),
    );
  }

  Widget _build(BuildContext context, double width) {
    double _itemWidth = width * 172 / 360;
    double _imgWidth = width * 120 / 360;
    List<Widget> _listWidgets = _list.data.map((index) {
      Color _bgColor = str2Color('#f8f8f8');
      Color _titColor = str2Color('#db5d41');
      Color _subTitColor = str2Color('#999999');
      return GestureDetector(
        onTap: () {
          // 动态路由
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => DetailPage(index),
            ),
          );
        },
        child: Container(
          width: _itemWidth,
          margin: EdgeInsets.only(bottom: 5, left: 2),
          padding: EdgeInsets.only(top: 10, left: 12, bottom: 5),
          color: _bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                index.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: _titColor,
                ),
              ),
              Text(
                index.desc,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: _subTitColor,
                ),
              ),
              Container(
                alignment: Alignment(0, 0),
                //margin: EdgeInsets.only(top: 5),
                child: Image.asset(
                  index.img,
                  width: _imgWidth,
                  height: _imgWidth,
                ),
              )
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 12, top: 8, bottom: 5),
          child: Text(
            '最新产品',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
        ),
        // 流式布局列表
        Wrap(
          spacing: 2,
          children: _listWidgets,
        ),
      ],
    );
  }
}
