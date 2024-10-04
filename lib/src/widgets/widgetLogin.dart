import 'package:flutter/material.dart';

class widgetLogin extends StatelessWidget {
  const widgetLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://w.forfun.com/fetch/3b/3b20b52df5bf35b05f321f4c9fddfacf.jpeg?h=600&r=0.5"),
            fit: BoxFit.cover),
      ),
      child: const Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'USUARIO',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'CONTRASEÑA',
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
