import 'package:flutter_batch_10_project/data/remote_data/network_service/network_service.dart';
import 'package:flutter_batch_10_project/models/sales_model.dart';

import '../../models/order_model.dart';

abstract class SalesRemoteData {
  Future<List<SalesInvoice>> getSalesInvoices({
    int? page,
    int? size,
  });

  Future<void> postCreateSales(OrderModel data);
}

class SalesRemoteDataImpl implements SalesRemoteData {
  final NetworkService networkService;

  SalesRemoteDataImpl(this.networkService);

  @override
  Future<List<SalesInvoice>> getSalesInvoices({int? page, int? size}) async {
    final response = await networkService.get(
      url: '/api/sales/list',
      queryParameters: {
        'page': page,
        'size': size,
      },
    );

    return (response.data['data']['data'] as List)
        .map((item) => SalesInvoice.fromJson(item))
        .toList();
  }

  @override
  Future<void> postCreateSales(OrderModel data) async {
    await networkService.post(
      url: '/api/sales/create',
      data: data.toJson(),
    );
  }
}