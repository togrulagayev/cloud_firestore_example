class ProductModel {
  String? id;
  String? name;
  bool? purchased;

  ProductModel({this.name, this.purchased});

  ProductModel.fromJson(this.id, Map<String, dynamic> json) {
    name = json['name'];
    purchased = json['purchased'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['purchased'] = purchased;
    return data;
  }
}
