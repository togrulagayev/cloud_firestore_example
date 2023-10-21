import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_firebase_storage_example/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductServiceNotifier extends StateNotifier<List<ProductModel>> {
  ProductServiceNotifier() : super([]);

  final product = FirebaseFirestore.instance
      .collection('products')
      .withConverter(fromFirestore: (snapshot, _) {
    return ProductModel.fromJson(snapshot.id, snapshot.data()!);
  }, toFirestore: (model, _) {
    return model.toJson();
  });

  void addProduct(ProductModel model) {
    product.add(model);
  }

  void updateProduct(ProductModel model) {
    product.doc(model.id).update({'purchased': !model.purchased!});
  }

  void deleteProduct(ProductModel model) {
    product.doc(model.id).delete();
  }
}
