// 产品列表数据
class ProductListModel {
  List<ProductItemModel> data;
  ProductListModel(this.data);

  factory ProductListModel.fromJson(List<dynamic> json) => ProductListModel(
      json.map((index) => ProductItemModel.fromJson((index))).toList());
}

// 产品列表项数据
class ProductItemModel {
  String desc; // 产品描述
  String type; // 产品类型
  String name; // 产品名称
  String img; // 产品图片路径
  String point; // 产品图片路径

  ProductItemModel({
    this.desc,
    this.type,
    this.name,
    this.img,
    this.point,
  });

  factory ProductItemModel.fromJson(dynamic json) => ProductItemModel(
        img: json['img'] as String,
        desc: json['desc'] as String,
        type: json['type'] as String,
        name: json['name'] as String,
        point: json['point'] as String,
      );
}
