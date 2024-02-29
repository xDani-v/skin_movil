// ignore_for_file: argument_type_not_assignable_to_error_handler

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tesis/globals.dart';
import 'package:tesis/widgets/informacionApp/dermatologosView.dart';
import 'package:tesis/widgets/informacionApp/vistaAyuda.dart';
import 'package:tesis/widgets/informacionApp/vistaInformacion.dart';

import 'package:tesis/widgets/informeEnfermedad/enfermedadDetalle.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

Future<void> main() async {
  // Obtén una lista de las cámaras disponibles en el dispositivo.

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.light(), home: TakePictureScreen());
  }
}

// Una pantalla que permite a los usuarios tomar una fotografía utilizando una cámara determinada.
class TakePictureScreen extends StatefulWidget  {
  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> with WidgetsBindingObserver{
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  List<CameraDescription> cameras = [];
  Globals g = Globals();
  double zoomLevel = 1.0;
  bool _iniciada = false;
  int camera = 0;
  String modo = "off";
  Map<String, Widget> iconList = {
    "always": Icon(Icons.flash_on,color: Colors.white),
    "off": Icon(Icons.flash_off,color: Colors.white)
  };

  @override
  void initState() {
    super.initState();

    iniciarCamera();
  }

  void iniciarCamera() async {
    cameras = await availableCameras();
    // Para visualizar la salida actual de la cámara, es necesario
    // crear un CameraController.
    print(cameras.length);
    _controller = CameraController(
      // Obtén una cámara específica de la lista de cámaras disponibles
      cameras[camera],
      // Define la resolución a utilizar
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();


    _initializeControllerFuture.then((value) async {
      await _controller.setFlashMode(FlashMode.off);
      print(_controller.value.flashMode);

      // Luego de que _initializeControllerFuture se complete, puedes llamar a setState para redibujar el widget.
      setState(() {
        _iniciada = true;
        modo = _controller.value.flashMode.name;
      });
    });
  }

  @override
  void dispose() {
    // Asegúrate de deshacerte del controlador cuando se deshaga del Widget.
    _controller.dispose();
    super.dispose();
  }



  Future<void> openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // El usuario ha seleccionado una imagen. Trabaja con ella, por ejemplo, muestra la imagen en tu interfaz de usuario o la subes a un servidor.
      final imageFile = XFile(pickedFile.path);
      print(pickedFile.path);
      cortarFoto(imageFile);
      // Aquí puedes realizar acciones con imageFile, como mostrarla en tu UI o enviarla a un servidor.
    } else {
      // El usuario canceló la selección.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
          appBar: AppBar(title: Text('Toma una foto')),
          // Debes esperar hasta que el controlador se inicialice antes de mostrar la vista previa
          // de la cámara. Utiliza un FutureBuilder para mostrar un spinner de carga
          // hasta que el controlador haya terminado de inicializar.
          body: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [g.lochmara200, g.lochmara500],
                  ),
                ),
              ),
              _iniciada
                  ? FutureBuilder<void>(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          // Si el Future está completo, muestra la vista previa
                          return Column(
                            children: [
                              GestureDetector(
                                child: CameraPreview(_controller),
                              ),
                            ],
                          );
                        } else {
                          // De lo contrario, muestra un indicador de carga
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    )
                  : Center(child: CircularProgressIndicator()),
              Positioned(
                  bottom: 10,
                  left: 0,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              toogleCamera();
                            },
                            icon: Icon(Icons.change_circle_outlined),color: Colors.white,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,

                          ),
                          child: IconButton(
                              onPressed: () {
                                tomarFoto();
                              },
                              icon: Icon(
                                Icons.circle,
                                color: Colors.white,
                              )),
                        ),
                        IconButton(
                            onPressed: () {
                              openGallery();
                            },
                            icon: Icon(Icons.photo),color: Colors.white,),
                      ],
                    ),
                  )),
              Positioned(
                  right: 10,
                  top: 30,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle,

                        ),
                        child: IconButton(
                          onPressed: () {
                            toogleFlash();
                          },
                          color: Colors.white,
                          icon: iconList[modo]!,
                        ),
                      )
                    ],
                  )),
            ],
          ),
          drawer: SafeArea(child: Container(
            width: MediaQuery.sizeOf(context).width/2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [g.lochmara200, g.lochmara500],
              ),

            ),
            child: ListView(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AyudaWidget()
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Icon(Icons.help,color: g.lochmara900,size: 25,),
                        SizedBox(width: 10,),
                        Text("Ayuda",style: TextStyle(color: g.lochmara900,fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            InformacionWidget()
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20,top:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Icon(Icons.info,color: g.lochmara900,size: 25,),
                        SizedBox(width: 10,),
                        Text("Información",style: TextStyle(color: g.lochmara900,fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DermatologosWidget()
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20,top:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Icon(Icons.people_alt,color: g.lochmara900,size: 25,),
                        SizedBox(width: 10,),
                        Expanded(child: Text("Dermatologos",style: TextStyle(color: g.lochmara900,fontSize: 20),),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),),
    );
  }

  void toogleCamera() async {
    if (camera == 0) {
      camera = 1;
      _controller = CameraController(
        // Obtén una cámara específica de la lista de cámaras disponibles
        cameras[camera],
        // Define la resolución a utilizar
        ResolutionPreset.high,
      );

      _initializeControllerFuture = _controller.initialize();

      _initializeControllerFuture.then((value) async{
        // Luego de que _initializeControllerFuture se complete, puedes llamar a setState para redibujar el widget.
        await _controller.setFlashMode(FlashMode.off);
        print(_controller.value.flashMode);
        setState(() {
          _iniciada = true;
          modo = _controller.value.flashMode.name;
        });
      });
      setState(() {

      });
    } else {
      camera = 0;
      _controller = CameraController(
        // Obtén una cámara específica de la lista de cámaras disponibles
        cameras[camera],
        // Define la resolución a utilizar
        ResolutionPreset.high,
      );
      _initializeControllerFuture = _controller.initialize();

      _initializeControllerFuture.then((value) async{
        await _controller.setFlashMode(FlashMode.off);
        print(_controller.value.flashMode);
        // Luego de que _initializeControllerFuture se complete, puedes llamar a setState para redibujar el widget.
        setState(() {
          _iniciada = true;
          modo = _controller.value.flashMode.name;
        });
      });
      setState(() {

      });
    }
  }

  void toogleFlash() async {
    FlashMode mode = _controller.value.flashMode;
    print(mode.name);

    if (mode == FlashMode.always){
      await _controller.setFlashMode(FlashMode.off);
      print(_controller.value.flashMode.name);
      setState(() {
        modo = _controller.value.flashMode.name;
      });
    }else{
      if (mode == FlashMode.auto){
        await _controller.setFlashMode(FlashMode.off);
        print(_controller.value.flashMode.name);
        setState(() {
          modo = _controller.value.flashMode.name;
        });
      }
      else{
        await _controller.setFlashMode(FlashMode.always);
        print(_controller.value.flashMode.name);
        setState(() {
          modo = _controller.value.flashMode.name;
        });
      }
    }


  }

  void tomarFoto() async {
    // Toma la foto en un bloque de try / catch. Si algo sale mal,
    // atrapa el error.
    try {
      if (_iniciada) {
        // Ensure the camera is initialized
        await _initializeControllerFuture;
        // Construye la ruta donde la imagen debe ser guardada usando
        // el paquete path.
        FlashMode mode = _controller.value.flashMode;
        print(mode.name);
        final path = await _controller.takePicture();

        cortarFoto(path);
        // ignore: use_build_context_synchronously

      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    print(state);
  }

  cortarFoto(XFile image)async{
    final file = await ImageCropper().cropImage(sourcePath: image.path,uiSettings: [
      AndroidUiSettings(toolbarTitle: 'Recortar Imagen',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false)
    ]);
    // ignore: use_build_context_synchronously
    if(file != null){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DisplayPictureScreen(imagePath: file!.path ),
        ),
      );
    }
  }
}
