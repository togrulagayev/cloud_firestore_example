import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_firebase_storage_example/models/product_model.dart';
import 'package:flutter_application_firebase_storage_example/services/firestore_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsStreamProvider = StreamProvider.autoDispose<List<ProductModel>>(
  (ref) {
    var stream = FirebaseFirestore.instance.collection('products').snapshots();

    return stream.map((snapshot) => snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.id, doc.data()))
        .toList());
  },
);

final productsServiceProvider =
    StateNotifierProvider<ProductServiceNotifier, List<ProductModel>>(
        (ref) => ProductServiceNotifier());
