
import 'package:app/src/pages/productos/producAdapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormProducto(),
    );
  }
}

class FormProducto extends StatefulWidget {
  const FormProducto({super.key});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FormProducto> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('APLICACION MOVIL D LOPEZ'),
      ),
      body: Container(
      
        child: 
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              
              Padding(
              
              padding: const EdgeInsets.all(
                  16.0), // especificar márgenes o espaciados en los cuatro lados de un contenedor o widget
              child: TextField(
                
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              // crear espacio o margen
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Codigo',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, //ocultar el contenido del campo de texto ..
              ),
            ),
            Padding(
              // crear espacio o margen
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Precio',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, //ocultar el contenido del campo de texto ..
              ),
            ),
            Padding(
              // crear espacio o margen
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Modelo',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, //ocultar el contenido del campo de texto ..
              ),
            ),
            Padding(
              // crear espacio o margen
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Codigo',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, //ocultar el contenido del campo de texto ..
              ),
            ), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormProducto()));
                      },
                      child: const Text('REGISTRAR')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: 
              Row(
                children: [
                  FilledButton(onPressed:  (){Navigator.push(  context,MaterialPageRoute(builder: (context)=>MyHomeProduc()));}, 
                  child: const Text("Volver"))
                ],
              )
              ,
            ),
        
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {}, // presionar un boton
                child: Text('VOLVER'),
              ),
            ),
          
          
            ]
            
          
        ),
      ),
      )
    );
  }
}
