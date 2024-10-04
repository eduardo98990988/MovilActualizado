import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Proveedor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegistroProveedor(),
    );
  }
}

class RegistroProveedor extends StatefulWidget {
  const RegistroProveedor({super.key});

  @override
  _RegistroProveedorState createState() => _RegistroProveedorState();
}

class _RegistroProveedorState extends State<RegistroProveedor> {
  // Definir la clave para el formulario
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto para los campos
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Proveedor de Materiales'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration:
                    const InputDecoration(labelText: 'Nombre del Proveedor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del proveedor';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _companyController,
                decoration:
                    const InputDecoration(labelText: 'Nombre de la Empresa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre de la empresa';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _materialController,
                decoration:
                    const InputDecoration(labelText: 'Materiales Proveídos'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese los materiales';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactController,
                decoration:
                    const InputDecoration(labelText: 'Teléfono de Contacto'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el teléfono de contacto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Dirección'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la dirección';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Procesar los datos del formulario
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registro exitoso')));
                  }
                },
                child: const Text('Registrar Proveedor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
