
import 'package:app/src/pages/login/login.dart';
import 'package:app/src/pages/productos/producAdapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: cuerpo(context),
     
    );
  }
}
Widget cuerpo(BuildContext context)
{
  return Container(
  
    decoration: const BoxDecoration(
      image: DecorationImage(image: NetworkImage("http://aa.somee.com/imagen_pagina/720X1300-ecco.jpg"),
      fit: BoxFit.cover
      ),
      
    ),
    
    child: Center(
      child: SingleChildScrollView(
        
        child:Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget>[
          
        SizedBox(
          height: 100.0,
          
          width:200,
          child: Image.asset('assets/images.png'),
          
        ),
        const SizedBox(
         child: Text(
          "Bienvenido a la aplicacion",
        style: TextStyle(
          color: Colors.white, // Debe ser `color` en lugar de `Color`
              ),
          ),
        ),
       
        ElevatedButton(
          
        onPressed: (){
          Navigator.push(
            
            context, MaterialPageRoute(builder: (context)=>const MyHomeProduc()));
        }, 
        
        style: ElevatedButton.styleFrom(
          
              foregroundColor: Colors.white, backgroundColor: Colors.blue, // Color del texto
              shadowColor: Colors.black, // Color de la sombra
              elevation: 5, // Elevación
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Bordes redondeados
              ),
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 40), // Padding
            ),
            
         child: Text("LOGIN")),
       
        ] 
       ), 
       
      )
      
      
      
      )
      
    ,);
    
  
}

