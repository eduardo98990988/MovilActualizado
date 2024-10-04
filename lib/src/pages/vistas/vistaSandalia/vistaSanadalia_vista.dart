import 'dart:convert';
import 'package:app/src/pages/Inicio/inicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;
import 'package:app/src/pages/material/materialAdapter.dart';
import 'package:app/src/pages/productos/producAdapter.dart';
import 'package:app/src/pages/proveedor/proveedorAdapter.dart';

void main() => runApp(const MyApp());

class VistaSandalias {
  final String nombreProd;
  final String fotografia;

  VistaSandalias({
    required this.nombreProd,
    required this.fotografia,
  });

  factory VistaSandalias.fromJson(Map<String, dynamic> json) {
    return VistaSandalias(
      nombreProd: json['nombreProd'] ?? '',
      fotografia: json['fotografia'] ?? '',
    );
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.network(
            fotografia,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          nombreProd,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

Future<List<VistaSandalias>> fetchProductoAcabados() async {
  final response = await http
      .get(Uri.parse("https://aa.somee.com/img_producto/sandalia&Negra"));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => VistaSandalias.fromJson(e)).toList();
  } else {
    throw Exception("Failed to load productos");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio con Zapatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VistaHomeSandalia(),
    );
  }
}

class VistaHomeSandalia extends StatelessWidget {
  const VistaHomeSandalia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zandalias'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 63, 112),
              ),
              child: Text('Menú',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 24)),
            ),
            _buildDrawerButton(context, 'INICIO', const HomeInicio()),
            _buildDrawerButton(context, 'PRODUCTOS', const MyHomeProduc()),
            _buildDrawerButton(context, 'MATERIALES', const MyHomeMaterial()),
            _buildDrawerButton(context, 'PROVEEDORES', const MyHomeProveedor()),
            _buildDrawerButton(context, 'VENTAS', const MyHomeMaterial()),
            _buildDrawerButton(context, 'AJUSTES', const HomeInicio()),
          ],
        ),
      ),
      body: FutureBuilder<List<VistaSandalias>>(
        future: fetchProductoAcabados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay productos disponibles'));
          } else {
            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return snapshot.data![index].build(context);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildDrawerButton(
      BuildContext context, String title, Widget targetPage) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => targetPage));
      },
      child: Text(title),
    )
        .animate()
        .fadeIn(duration: 500.ms)
        .move(begin: const Offset(-16, 0), end: const Offset(0, 0));
  }
}
