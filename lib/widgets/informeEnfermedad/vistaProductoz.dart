import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesis/globals.dart';

class Producto extends StatefulWidget{
   dynamic productos =[{
     "id": 1,
     "nombre_del_producto": "Crema hidratante sin aceite",
     "descripcion_del_producto": "Crema hidratante sin aceite que ayuda a mantener la piel hidratada sin obstruir los poros.",
     "precio": "15.00",
     "disponibilidad": "En stock",
     "imagen": "https://i.imgur.com/example.jpg"
   },
     {
       "id": 1,
       "nombre_del_producto": "Crema hidratante sin aceite",
       "descripcion_del_producto": "Crema hidratante sin aceite que ayuda a mantener la piel hidratada sin obstruir los poros.",
       "precio": "15.00",
       "disponibilidad": "En stock",
       "imagen": "https://i.imgur.com/example.jpg"

     },
     { "id": 1,
       "nombre_del_producto": "Crema hidratante sin aceite",
       "descripcion_del_producto": "Crema hidratante sin aceite que ayuda a mantener la piel hidratada sin obstruir los poros.",
       "precio": "15.00",
       "disponibilidad": "En stock",
       "imagen": "https://i.imgur.com/example.jpg"
     }];
   dynamic prueba;

  Producto({required this.productos});

   @override
   _StateProducto createState() => _StateProducto();

}

class _StateProducto extends State<Producto>{
  Globals g = Globals();

  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //onCampo((this.productos as List).length*200);
    return widget.productos.length == 0?Column(children: [Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.dangerous_rounded)),),Center(child: Text("No se han registrado Productos"),)],):
    ListView(
      children: widget.productos.map<Widget>((p){
        return Column(
          children: [
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: g.lochmara950, width: 3 ),
                  color: Colors.white
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black
                          ),
                          child: validarImagen(p["imagen"])
                      ),
                      SizedBox(width: 10,),
                      Expanded(child: Column(
                        children: [
                          Text(p["nombre_del_producto"], style: TextStyle(fontSize: 17, color: g.lochmara900),),
                          SizedBox(height: 10,),
                          Text(p["descripcion_del_producto"],style: TextStyle(fontSize: 15),textAlign: TextAlign.justify,)
                        ],
                      ))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Precio: ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                      Text(" "+p["precio"],style: TextStyle(fontSize: 12,),),
                      SizedBox(width: 15,),
                      Text("Disponibilidad: ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                      Text(" "+p["disponibilidad"],style: TextStyle(fontSize: 12),),
                      SizedBox(width: 15,),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }

  Widget validarImagen (dynamic imagen){
    if(imagen == null){
      return Icon(Icons.report_gmailerrorred_rounded);
    }else{
      return Image.memory(
        base64Decode(imagen.toString().split(",")[1]),
        fit: BoxFit.fitWidth,
      );
    }
  }
}