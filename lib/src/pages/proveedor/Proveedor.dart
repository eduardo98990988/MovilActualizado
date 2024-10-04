class Proveedor {
  final String nombreProveedor;
  final String telefono;
  final String nombreMaterial;

  Proveedor({
    required this.nombreProveedor,
    required this.telefono,
    required this.nombreMaterial,
  });

  factory Proveedor.fromJson(Map<String, dynamic> json) {
    try {
      return Proveedor(
        nombreProveedor: json['nombreProveedor'] ?? 'Nombre no disponible',
        telefono: json['telefono'] ?? 'Teléfono no disponible',
        nombreMaterial: json['nombreMaterial'] ?? 'Material no disponible',
      );
    } catch (e) {
      throw Exception("Error parsing Proveedor JSON: $e");
    }
  }
}
