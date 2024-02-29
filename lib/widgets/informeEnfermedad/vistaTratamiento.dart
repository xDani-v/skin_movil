import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesis/globals.dart';

class Tratamiento extends StatelessWidget{
  late dynamic tratamiento;
  Globals g = Globals();

  Tratamiento({required this.tratamiento,});

  @override
  initState(){

  }

  @override
  Widget build(BuildContext context) {

    return tratamiento.length == 0?Column(children: [Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.dangerous_rounded)),),Center(child: Text("No se han registrado Tratamientos"),)],):
    ListView(
      children: tratamiento.map<Widget>((t){
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
                  Text(t["nombre_del_tratamiento"], style: TextStyle(fontSize: 17, color: g.lochmara900),),
                  SizedBox(height: 10,),
                  Text(t["descripcion_del_tratamiento"],style: TextStyle(fontSize: 15),textAlign: TextAlign.justify,)
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }

}