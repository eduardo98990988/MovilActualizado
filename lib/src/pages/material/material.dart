class MaterialAcabado {
  final String idMaterial;
  final String nombreMaterial;
  final String estado;

  final String stock;

  MaterialAcabado({
    required this.idMaterial,
    required this.nombreMaterial,
    required this.estado, 
    required this.stock,

  });

  factory MaterialAcabado.fromJson(Map<String, dynamic> json) {
    return MaterialAcabado(
      idMaterial: json['idMaterial'] ?? 0,
      nombreMaterial: json['nombreMaterial'] ?? '',
      estado: json['estado'] ?? '',
      stock: json['stock'] ?? 0,
    );
  }
}