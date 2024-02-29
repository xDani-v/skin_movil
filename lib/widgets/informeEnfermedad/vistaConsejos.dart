import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesis/globals.dart';

class Consejos extends StatelessWidget{
  dynamic consejos = [{"nombre_recomendacion": "Lavarse la cara dos veces al día",
    "descripcion_recomendacion": "Lavarse la cara con un limpiador suave dos veces al día para eliminar el exceso de grasa y células muertas de la piel."},
{"nombre_recomendacion": "Lavarse la cara dos veces al día",
    "descripcion_recomendacion": "Lavarse la cara con un limpiador suave dos veces al día para eliminar el exceso de grasa y células muertas de la piel."},
{"nombre_recomendacion": "Lavarse la cara dos veces al día",
    "descripcion_recomendacion": "Lavarse la cara con un limpiador suave dos veces al día para eliminar el exceso de grasa y células muertas de la piel."},
    {"nombre_recomendacion": "Lavarse la cara dos veces al día",
    "descripcion_recomendacion": "Lavarse la cara con un limpiador suave dos veces al día para eliminar el exceso de grasa y células muertas de la piel."}];
  dynamic prueba;
  Globals g = Globals();
  ScrollController controller;

  Consejos({required this.consejos,required this.controller});

  @override
  Widget build(BuildContext context) {
    return consejos.length == 0?Column(children: [Center(child:IconButton(onPressed: (){}, icon:  Icon(Icons.dangerous_rounded)),),Center(child: Text("No se han registrado Consejos"),)],):
    ListView(
      controller: controller,
      children: consejos.map<Widget>((c){
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(c["nombre_de_la_recomendacion"], style: TextStyle(fontSize: 17, color: g.lochmara900),),
                  SizedBox(height: 10,),
                  Text(c["descripcion_de_la_recomendacion"],style: TextStyle(fontSize: 15),textAlign: TextAlign.justify,)
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }

}