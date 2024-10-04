class ProductoAcabados {
  final String idProducto;
  final String nombreProd;
  final String codigoProd;
  final String precioUnitario;
  final String stock;
  final bool estadoProducto;
  final String fotografia;

  ProductoAcabados({
    required this.idProducto,
    required this.nombreProd,
    required this.codigoProd,
    required this.precioUnitario,
    required this.stock,
    required this.estadoProducto,
    required this.fotografia,
  });

  factory ProductoAcabados.fromJson(Map<String, dynamic> json) {
    return ProductoAcabados(
      idProducto: json['idProducto'] ?? 0,
      nombreProd: json['nombreProd'] ?? '',
      codigoProd: json['codigoProd'] ?? '',
      precioUnitario: json['precioUnitario'] ?? '',
      stock: json['stock'] ?? 0,
      estadoProducto: json['estadoProducto'] ?? false,
      fotografia: json['fotografia'] ?? '',
    );
  }
}