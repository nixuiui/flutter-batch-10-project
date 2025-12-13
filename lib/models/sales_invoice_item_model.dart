class SalesInvoiceItem {
    final int? id;
    final int? saleId;
    final int? productId;
    final int? quantity;
    final double? price;
    final double? totalPrice;

    SalesInvoiceItem({
        this.id,
        this.saleId,
        this.productId,
        this.quantity,
        this.price,
        this.totalPrice,
    });

    factory SalesInvoiceItem.fromJson(Map<String, dynamic> json) => SalesInvoiceItem(
        id: json["id"],
        saleId: int.tryParse(json["sale_id"].toString()),
        productId: int.tryParse(json["product_id"].toString()),
        quantity: int.tryParse(json["quantity"].toString()),
        price: double.tryParse(json["price"].toString()),
        totalPrice: double.tryParse(json["total_price"].toString()),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sale_id": saleId,
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "total_price": totalPrice,
    };
}