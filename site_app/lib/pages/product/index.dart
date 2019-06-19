import 'package:flutter/material.dart';

import '../../model/product.dart';
import '../../config/index.dart';
import './list.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<ProductPage> {
  ProductListModel _listData = ProductListModel([]);
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _getProduct();
  }

  // 回调使用
  void _getProduct() async {
    ProductListModel _list =
        ProductListModel.fromJson(await getProduct(page: _page++));
    setState(() {
      _listData.data.addAll(_list.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProductList(
      _listData,
      nextPage: () => _getProduct(),
    );
  }
}
