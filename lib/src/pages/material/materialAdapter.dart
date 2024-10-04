import 'dart:convert';
import 'package:app/src/pages/Inicio/inicio.dart';
import 'package:app/src/pages/productos/producAdapter.dart';
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
      home: const MyHomeMaterial(),
    );
  }
}

class MaterialAcabado {
  final String nombreMaterial;
  final int stock;

  MaterialAcabado({
    required this.nombreMaterial,
    required this.stock,
  });

  factory MaterialAcabado.fromJson(Map<String, dynamic> json) {
    return MaterialAcabado(
      nombreMaterial: json['nombreMaterial'] ?? '',
      stock: json['stock'] is int
          ? json['stock']
          : int.tryParse(json['stock'].toString()) ?? 0,
    );
  }
}

Future<List<MaterialAcabado>> fetchMaterialAcabado() async {
  final response =
      await http.get(Uri.parse("https://zapateriaback.somee.com/api/Material"));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => MaterialAcabado.fromJson(e)).toList();
  } else {
    throw Exception("Failed to load productos");
  }
}

class MyHomeMaterial extends StatefulWidget {
  const MyHomeMaterial({super.key});

  @override
  _MyHomeMaterialState createState() => _MyHomeMaterialState();
}

class _MyHomeMaterialState extends State<MyHomeMaterial> {
  late Future<List<MaterialAcabado>> futureDatos;
  TextEditingController _searchController = TextEditingController();
  List<MaterialAcabado> _filteredItems = [];
  List<MaterialAcabado> _allItems = [];
  String? _selectedName;

  @override
  void initState() {
    super.initState();
    futureDatos = fetchMaterialAcabado();
    futureDatos.then((data) {
      setState(() {
        _allItems = data;
        _filteredItems = data;
      });
    });
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    String query = _searchController.text.toLowerCase();
    String? selectedName = _selectedName;

    List<MaterialAcabado> filteredList = _allItems.where((item) {
      bool matchesQuery = item.nombreMaterial.toLowerCase().contains(query);
      bool matchesDropdown =
          selectedName == null || item.nombreMaterial == selectedName;
      return matchesQuery && matchesDropdown;
    }).toList();

    setState(() {
      _filteredItems = filteredList;
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materiales Terminados'),
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
              child: const Text('MATERIALES'),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .move(begin: const Offset(-16, 0), end: const Offset(0, 0)),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              hint: const Text('Seleccionar Material'),
              value: _selectedName,
              isExpanded: true,
              items: _allItems.map((item) {
                return DropdownMenuItem<String>(
                  value: item.nombreMaterial,
                  child: Text(item.nombreMaterial),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedName = value;
                  _filterItems();
                });
              },
            ),
          ),
          const InkWell(
            child: Text("Materiales sin Stock"),
          ),
          Image.network("http://aa.somee.com/img_material/descargar.jpg"),
          Expanded(
            child: FutureBuilder<List<MaterialAcabado>>(
              future: futureDatos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No hay datos disponibles"));
                } else {
                  return ListView.builder(
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_filteredItems[index].nombreMaterial),
                        subtitle: Text('Stock: ${_filteredItems[index].stock}'),
                      );
                    },
                  );
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Acción al presionar el botón
            },
            child: const Text('Contactos de Proveedores'),
          ),
        ],
      ),
    );
  }
}
