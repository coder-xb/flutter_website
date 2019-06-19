import 'package:flutter/material.dart';
import './banner.dart';
import './product.dart';
import '../../model/product.dart';
import '../../config/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  ProductListModel _listData = ProductListModel([]);

  @override
  void initState() {
    super.initState();
    _getProduct();
  }

  void _getProduct() async {
    ProductListModel _list = ProductListModel.fromJson(await getProduct());
    setState(() {
      _listData.data.addAll(_list.data);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),
          ProductWidget(_listData),
        ],
      ),
    );
  }
}
