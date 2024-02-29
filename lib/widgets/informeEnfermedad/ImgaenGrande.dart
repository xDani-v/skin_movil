import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagenGrande extends StatelessWidget{
  final path;

  ImagenGrande({required this.path});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          height: MediaQuery.sizeOf(context).height,
          width:  MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [InteractiveViewer(
                  child: Image.file(File(path)),
                ),]
              ),
              Positioned(top: 20,right: 10,child: IconButton(
                icon: Icon(Icons.close,size: 40,color: Colors.blue,), onPressed: () {
                Navigator.pop(context);
              },
              ),)
            ],
          ),
        ),
      ),
    );
  }

}