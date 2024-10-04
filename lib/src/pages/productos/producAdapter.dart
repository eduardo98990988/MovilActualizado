import 'dart:convert';
import 'package:app/src/pages/Inicio/inicio.dart';
import 'package:app/src/pages/material/materialAdapter.dart';
import 'package:app/src/pages/proveedor/proveedorAdapter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_animate/flutter_animate.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeProduc(),
    );
  }
}

class ProductoAcabados {
  final String nombreProd;
  final int stock;
  // final String codigoProd;
  // final String precioUnitario;

  // final bool estadoProducto;
  // final String fotografia;

  ProductoAcabados({
    required this.nombreProd,
    required this.stock,
    // required this.codigoProd,
    // required this.precioUnitario,

    // required this.estadoProducto,
    // required this.fotografia,
  });

  factory ProductoAcabados.fromJson(Map<String, dynamic> json) {
    return ProductoAcabados(
      nombreProd: json['nombreProd'] ?? '',
      stock: json['stock'] is int
          ? json['stock']
          : int.tryParse(json['stock'].toString()) ?? 0,
      // codigoProd: json['codigoProd'] ?? '',
      // precioUnitario: json['precioUnitario'] ?? '',

      // estadoProducto: json['estadoProducto'] ?? false,
      // fotografia: json['fotografia'] ?? '',
    );
  }
}

Future<List<ProductoAcabados>> fetchProductoAcabados() async {
  final response = await http.get(Uri.parse(
      "https://zapateriaback.somee.com/api/Producto/productos-acabados"));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => ProductoAcabados.fromJson(e)).toList();
  } else {
    throw Exception("Failed to load productos");
  }
}

class MyHomeProduc extends StatefulWidget {
  const MyHomeProduc({super.key});

  @override
  _MyHomeProducState createState() => _MyHomeProducState();
}

class _MyHomeProducState extends State<MyHomeProduc> {
  late Future<List<ProductoAcabados>> futureDatos;

  @override
  void initState() {
    super.initState();
    futureDatos = fetchProductoAcabados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos Terminados'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              // Acción al presionar el botón
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Acción al presionar el botón
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Acción al presionar el botón
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menú',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeInicio()));
              },
              child: const Text('INICIO'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomeProduc()));
              },
              child: const Text('PRODUCTOS'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomeMaterial()));
              },
              child: const Text('MATERIALES'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomeProveedor()));
              },
              child: const Text('PROVEEDORES'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomeMaterial()));
              },
              child: const Text('VENTAS'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Navigator.pushNamed(context, '/RegistroProveedor');
              },
              child: const Text('RegistroProducto'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const InkWell(child: Text("Productos sin Stock")),
          Image.network("http://aa.somee.com/imagen_pagina/SeñorZapato1.jpg"),
          Expanded(
            child: FutureBuilder<List<ProductoAcabados>>(
              future: futureDatos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductoAcabados>? productos = snapshot.data;
                  return ListView.builder(
                    itemCount: productos!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(productos[index].nombreProd),
                        subtitle: Text('Stock: ${productos[index].stock}'),

                        // subtitle: Text('Precio: ${productos[index].precioUnitario}'),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Acción al presionar el botón
            },
            child: const Text('Datos Cargados Correctamente'),
          ),
        ],
      ),
    );
  }
}
