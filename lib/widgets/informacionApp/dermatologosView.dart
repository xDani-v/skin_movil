import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tesis/globals.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class DermatologosWidget extends StatefulWidget{
  @override
  _stateDermatologoView createState() => _stateDermatologoView();


}

class _stateDermatologoView extends State<DermatologosWidget>{
  bool cargada = false;
  List filtrados = [];
  List dermatologos = [];
  List<String> provincias = [];
  String _selected = "El oro";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cargarLista();
  }

  Future<void> cargarLista()async {
    String url = "https://api-skin-adminstrator.onrender.com/dermatologo";
    final uri = Uri.parse(url);
    final req = await http.get(uri);
    if (req.statusCode == 200) {
      final res = req.body;
      final jsonResponse = jsonDecode(res);
      setState(() {
        filtrados = jsonResponse;
        dermatologos = jsonResponse;
        cargarProvincias();
      });
    }else{

    }
  }

  cargarProvincias(){
    filtrados.forEach((element) {
      if(!provincias.contains(element["provincia"])){
        provincias.add(element["provincia"]);
      }
    });
    setState(() {
      _selected = provincias[0];
      filtrarProvincia();
      cargada = true;
    });
  }

  filtrarProvincia(){
    filtrados = [];
    dermatologos.forEach((element) {
      if(element["provincia"]== _selected){
        filtrados.add(element);
      }
    });
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    Globals g = Globals();
    return Scaffold(
        appBar: AppBar(
          title: Text("Dermatologos"),
        ),
        body: !cargada?Center(child: CircularProgressIndicator(),):
        Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children:[
                SizedBox(width: 30,),
                Text("Provincia: ", style: TextStyle(fontSize: 17, color: g.lochmara900),),
                SizedBox(width: 20,),
                Expanded(child: DropdownButton<String>(
                  items: provincias.map((String e){
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (newValue){
                    setState(() {
                      _selected = newValue!;
                      filtrarProvincia();
                    });
                  },
                  value: _selected,
                  style:  TextStyle(fontSize: 17,color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.all(10),
                ),)
              ]
            ),
            SizedBox(height: 20,),
            Expanded(child: ListView(
              children: filtrados.map<Widget>((der){
                return  InkWell(
                  onTap: (){
                    _launchInBrowser(der["linkws"]);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 20,left: 10,right: 10),
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
                                child: validarImagen(der["foto"])
                            ),
                            SizedBox(width: 10,),
                            Expanded(child: Column(
                              children: [
                                Text(der["nombre"], style: TextStyle(fontSize: 17, color: g.lochmara900),),
                                SizedBox(height: 10,),
                                Text(der["direccion"],style: TextStyle(fontSize: 15),textAlign: TextAlign.justify,)
                              ],
                            ))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Provincia: ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            Text(" "+der["provincia"],style: TextStyle(fontSize: 12,),),
                            SizedBox(width: 15,),
                            Text("Numero: ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            Text(" "+der["numero"],style: TextStyle(fontSize: 12),),
                            SizedBox(width: 15,),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ))
          ],
        )
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

  Future<void> _launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.platformDefault,
    )) {
      throw Exception('Could not launch $url');
    }
  }

}