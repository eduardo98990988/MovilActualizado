

class Empleado {
  String? id;
  String? nombreEmpleado;
  String? codigoEmpleado;
  String? precioUnitario;
  String? stock;
  String? estadoEmpleado;
  String? fotografia_Empleado;
  String? thumbnailUrl;
  String? url;

  Empleado({
    this.id,
    
    this.nombreEmpleado, 
    this.codigoEmpleado, 
    this.precioUnitario, 
    this.stock, 
    this.estadoEmpleado, 
    // ignore: non_constant_identifier_names
    this.fotografia_Empleado, 
   this.thumbnailUrl, 
    this.url});

  Empleado.fromJson(Map<String, dynamic> json) {
    id = json['idEmpleado'];
    nombreEmpleado = json['nombreProd'];
    codigoEmpleado = json['codigoProd'];
    precioUnitario = json['precioUnitario'];
    stock = json['stock'];
    estadoEmpleado = json['estadoEmpleado'];
    fotografia_Empleado = json['fotografia_Producto'];
    thumbnailUrl = json['thumbnailUrl'];
    url = json['thumbnailUrl'];
  }
}