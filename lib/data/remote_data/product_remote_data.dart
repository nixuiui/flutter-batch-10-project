import 'package:flutter_batch_10_project/data/remote_data/network_service/network_service.dart';
import 'package:flutter_batch_10_project/models/product_model.dart';

abstract class ProductRemoteData {
  Future<List<Product>> getProduct({
    int? page,
    int? size,
  });
}

class ProductRemoteDataImpl implements ProductRemoteData {
  final NetworkService networkService;

  ProductRemoteDataImpl(this.networkService);

  @override
  Future<List<Product>> getProduct({int? page, int? size}) async {
    final response = await networkService.get(
      url: '/api/product/list',
      queryParameters: {
        'page': page,
        'size': size,
      },
    );

    return (response.data['data']['data'] as List)
        .map((item) => Product.fromJson(item))
        .toList();
  }
}