import 'package:flutter_batch_10_project/models/product_model.dart';

abstract class ProductRemoteData {
  Future<List<Product>> getProduct({
    int? page,
    int? size,
  });
}