import 'dart:convert';
import 'package:app/src/pages/Inicio/inicio.dart';
import 'package:app/src/pages/material/materialAdapter.dart';
import 'package:app/src/pages/productos/producAdapter.dart';
// Asegúrate de importar la página de formulario
import 'package:app/src/pages/Registroproveedor/Registro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
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
      home: const MyHomeProveedor(),
    );
  }
}

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
    return Proveedor(
      nombreProveedor: json['nombreProveedor'] ?? '',
      telefono: json['telefono'] ?? '',
      nombreMaterial: json['nombreMaterial'] ?? '',
    );
  }
}

Future<List<Proveedor>> fetchProveedor() async {
  final response = await http
      .get(Uri.parse("https://zapateriaback.somee.com/api/Proveedor"));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => Proveedor.fromJson(e)).toList();
  } else {
    throw Exception("Failed to load proveedor");
  }
}

class MyHomeProveedor extends StatefulWidget {
  const MyHomeProveedor({super.key});

  @override
  _MyHomeProveedorState createState() => _MyHomeProveedorState();
}

class _MyHomeProveedorState extends State<MyHomeProveedor> {
  late Future<List<Proveedor>> futureDatos;

  @override
  void initState() {
    super.initState();
    futureDatos = fetchProveedor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proveedores'),
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
          const InkWell(child: Text("Proveedores")),
          Image.network("http://aa.somee.com/img_material/proveedor.jpg"),
          Expanded(
            child: FutureBuilder<List<Proveedor>>(
              future: futureDatos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Proveedor>? proveedor = snapshot.data;
                  return ListView.builder(
                    itemCount: proveedor!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(proveedor[index].nombreProveedor),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Proveedor: ${proveedor[index].nombreMaterial}'),
                            Row(
                              children: [
                                Expanded(
                                  child:
                                      SelectableText(proveedor[index].telefono),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.copy),
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(
                                        text: proveedor[index].telefono));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Teléfono copiado al portapapeles')));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistroProveedor()),
              );
            },
            child: const Text('Ir al Formulario'),
          ),
        ],
      ),
    );
  }
}
