import 'dart:convert';
import 'package:app/src/pages/empleado/empleado.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/src/pages/productos/formProducto.dart';

import 'package:flutter/cupertino.dart';

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
      home: const MyHomeEmpleado(),
    );
  }
}

class MyHomeEmpleado extends StatefulWidget {
  const MyHomeEmpleado({super.key});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeEmpleado> {
  static Future<List<Empleado>> getPosts() async {
    var url = Uri.parse("https://zapateriaback.somee.com/api/Empleado");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Empleado.fromJson(e)).toList();
  }

  // ignore: non_constant_identifier_names
  Future<List<Empleado>> postsFuture = getPosts();

  // function to fetch data from api and return future list of posts

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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomeEmpleado())),
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 100, right: 10),
                      width: MediaQuery.of(context).size.width / 1,
                      color: Color.fromARGB(255, 3, 3, 3),
                      child: const Text(
                        "EXPORTAR",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormProducto())),
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 100, right: 10),
                      width: MediaQuery.of(context).size.width / 1,
                      color: Color.fromARGB(255, 3, 3, 3),
                      child: const Text(
                        "NUEVO Empleado",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomeEmpleado())),
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 100, right: 10),
                      width: MediaQuery.of(context).size.width / 1,
                      color: Color.fromARGB(255, 3, 3, 3),
                      child: const Text(
                        "VER EmpleadoES",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: const Text("Agregar"),
                  ),
                  FloatingActionButton(
                      child: Icon(Icons.hdr_plus),
                      backgroundColor: Colors.red,
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FormProducto()))
                          }),
                ],
              ),
              Container(
                color: Colors.black,
                child: const Text(
                  "Productos",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              Container(
                child: FutureBuilder<List<Empleado>>(
                  future: postsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // until data is fetched, show loader
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      // once data is fetched, display it on screen (call buildPosts())
                      final posts = snapshot.data!;
                      return buildPosts(posts);
                    } else {
                      // if no data, show simple Text
                      return const Text("No data available");
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPosts(List<Empleado> posts) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Container(
          color: Colors.grey.shade300,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            children: [
              SizedBox(width: 10),
              Expanded(flex: 3, child: Text(post.nombreEmpleado!)),
            ],
          ),
        );
      },
    );
  }
}
