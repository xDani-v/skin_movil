// Un Widget que muestra la imagen tomada por el usuario
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tesis/globals.dart';
import 'package:tesis/widgets/informacionApp/dermatologosView.dart';
import 'package:tesis/widgets/informeEnfermedad/ImgaenGrande.dart';
import 'package:tesis/widgets/informeEnfermedad/vistaConsejos.dart';
import 'package:tesis/widgets/informeEnfermedad/vistaProductoz.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({required this.imagePath});


  @override
  DisplayPictureScreenState createState() => DisplayPictureScreenState();
}

class DisplayPictureScreenState extends State<DisplayPictureScreen> with SingleTickerProviderStateMixin{
  dynamic enfermedad;
  dynamic enfInfo;
  final Globals g = Globals();
  dynamic prediction = "ninguna";
  bool cargado = false;
  dynamic productos = [];
  dynamic tratamientos = [];
  dynamic reco = [];
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;
  double _altura = 500;

  Future<bool> uploadImage() async {
    final uri = Uri.parse('https://t053hknn-5000.use.devtunnels.ms/predict');
    print(uri.path);
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', widget.imagePath));
    final response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Imagen subida con éxito');
      final res = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(res);
      print('Imagen subida con éxito. Resultado: $jsonResponse');
      enfermedad = jsonResponse;
      bool v = enfermedad.containsKey("prediction");
      print(v);
      if (v) {
        prediction = enfermedad["prediction"];
        setState(() {
          cargado = true;
        });
      }
      bool w = enfermedad.containsKey("index");
      print(w);
      if (w) {
        print(int.parse(enfermedad["index"].toString()) + 1);
        getInfoEnfermedad(int.parse(enfermedad["index"].toString()) + 1);
        getRecomendaciones(int.parse(enfermedad["index"].toString()) + 1);
        getProductos(int.parse(enfermedad["index"].toString()) + 1);
      }
      return true;
    } else {
      // ignore: use_build_context_synchronously
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error!!"),
              content: Text("Error en el servidor"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"))
              ],
            );
          });
      Navigator.pop(context);
      return false;
    }
  }

  Future<void> getInfoEnfermedad(dynamic id) async {
    String url = 'https://api-skin-adminstrator.onrender.com/enfermedad/' +
        id.toString();
    print(url);
    final uri = Uri.parse(url);
    final req = await http.get(uri);
    if (req.statusCode == 200) {
      final res = req.body;
      final jsonResponse = jsonDecode(res);
      print('Imagen subida con éxito. Resultado: $jsonResponse');
      enfInfo = jsonResponse;
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error!!"),
              content: Text("Error en el servidor"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"))
              ],
            );
          });
    }
    print(req);
  }

  Future<void> getRecomendaciones(dynamic id) async {
    String url =
        'https://api-skin-adminstrator.onrender.com/enfermedad_recomendacion/es/' +
            id.toString();
    print(url);
    final uri = Uri.parse(url);
    final req = await http.get(uri);
    if (req.statusCode == 200) {
      final res = req.body;
      final jsonResponse = jsonDecode(res);
      print('Imagen subida con éxito. Resultado: $jsonResponse');
      setState(() {
        reco = jsonResponse;
      });
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error!!"),
              content: Text("Error en el servidor"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"))
              ],
            );
          });
    }
    print(req);
  }


  Future<void> getProductos(dynamic id) async {
    String url =
        'https://api-skin-adminstrator.onrender.com/enfermedad_producto/es/' +
            id.toString();
    print(url);
    final uri = Uri.parse(url);
    final req = await http.get(uri);
    if (req.statusCode == 200) {
      final res = req.body;
      final jsonResponse = jsonDecode(res);
      print('Imagen subida con éxito. Resultado: $jsonResponse');
      setState(() {
        cargado = true;
        productos = jsonResponse;
        showAlert(context, "Este apartado es solamente informativo, se recomienda consultar un profesional antes de usar algun producto o tratamiento");
      });
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error!!"),
              content: Text("Error en el servidor"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"))
              ],
            );
          });
    }
    print(req);
  }

  mostrarImagen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImagenGrande(
          path: widget.imagePath,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3,vsync: this); // Reemplaza 3 con la cantidad de pestañas que tengas
    cargarInicio();
  }


  cargarInicio()async{
    bool v = await uploadImage();
    print("Se abrio $v");

  }


  void showAlert(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Retorna un objeto AlertDialog
        return AlertDialog(
          title: Text('Alerta'),
          icon: Icon(Icons.info_outline_rounded),
          content: Text(mensaje,textAlign: TextAlign.justify),
          actions: <Widget>[
            // Botón para cerrar el cuadro de diálogo
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Entendido'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(title: Text('Informe')),
            body: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                ),
                cargado
                    ? CustomScrollView(
                  controller: _scrollController,
                        slivers: [
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    prediction == "ninguna"
                                        ? enfInfo["nombre_de_la_enfermedad"]
                                        .toUpperCase()
                                        : prediction.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: g.lochmara950,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    mostrarImagen();
                                  },
                                  child: Container(
                                      width: MediaQuery.sizeOf(context).width/2,
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: g.lochmara950, width: 3)),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.file(
                                              File(widget.imagePath),
                                              fit: BoxFit.fitWidth))),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    prediction == "ninguna"
                                        ? enfInfo["caracteristica"]
                                        : "Tras el analisis de la imagen, no se ha detectado ninguna enfermedad apreciable en su rostro",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: g.lochmara900,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    prediction == "ninguna"
                                        ? "Nivel de confianza: ${(enfermedad["confidence"] * 100).toInt()}%"
                                        : "",
                                    style: TextStyle(color: g.lochmara900),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          if (prediction == "ninguna")
                            SliverPersistentHeader(pinned: true,floating: false,delegate: MySliverAppBarDelegate(TabBar(
                              controller: _tabController,
                                onTap: (index){
                                },
                                unselectedLabelColor: g.lochmara500,
                                automaticIndicatorColorAdjustment: true,
                                labelColor: g.lochmara950,
                                tabs: const [
                                  Tab(
                                    icon: Icon(Icons.comment),
                                    text: "Consejos",
                                  ),
                                  Tab(
                                    icon: Icon(Icons.medical_information),
                                    text: "Medicinas",
                                  ),
                                ]))) ,
                          if (prediction == "ninguna")
                            SliverToBoxAdapter(
                              child: Container(
                                height: MediaQuery.sizeOf(context).height,
                                child:TabBarView(
                                    controller: _tabController,
                                    children: [
                                  Consejos(consejos: reco, controller: _scrollController),
                                  Producto(productos: productos)
                                ]),
                              ),
                            )
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          floatingActionButton: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: g.lochmara950
            ),
            child:
            IconButton(
              icon: Icon(Icons.people_alt_outlined),
              color: Colors.white,
              iconSize: 25,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DermatologosWidget()
                  ),
                );
              },
            ),
          )
        ),
    );
  }
}

class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  Globals g = Globals();

  MySliverAppBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // Establecer el color de fondo aquí
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}