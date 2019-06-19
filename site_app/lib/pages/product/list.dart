import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/index.dart';
import '../../model/product.dart';
import '../../utils/index.dart';
import '../detail.dart';

class ProductList extends StatelessWidget {
  // 列表数据
  final ProductListModel _list;
  // 获取下一页数据
  final VoidCallback nextPage;

  ProductList(this._list, {this.nextPage});

  @override
  Widget build(BuildContext context) {
    return _list.data.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: _list.data.length,
            itemBuilder: (BuildContext context, int index) {
              ProductItemModel _item = _list.data[index];
              // 加载一页
              if (index + 4 == _list.data.length) nextPage();
              return GestureDetector(
                onTap: () {
                  // 动态路由
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => DetailPage(_item),
                    ),
                  );
                },
                // 列表项背景
                child: Container(
                  color: ColorMap.bgColor,
                  padding: EdgeInsets.only(top: 5, right: 5),
                  child: Row(
                    children: <Widget>[
                      // 产品图片
                      Image.asset(
                        _item.img,
                        width: 120,
                        height: 120,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: ColorMap.lineColor,
                              ),
                            ),
                          ),
                          // 产品信息
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _item.desc,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // 产品类型
                                  Text(
                                    _item.type,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorMap.typeColor,
                                    ),
                                  ),
                                  // 产品特点
                                  _item.point == null
                                      ? SizedBox()
                                      : Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3),
                                          margin: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: ColorMap.pointColor)),
                                          child: Text(
                                            _item.point,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: ColorMap.pointColor),
                                          ),
                                        )
                                ],
                              ),
                              // 产品类型
                              Text(
                                _item.name,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF999999),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
