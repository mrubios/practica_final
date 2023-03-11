import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/image_service.dart';
import '../services/upload_service.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _HomePageState();
}

class _HomePageState extends State<ImagePage> {
  File? imagen_to_upload;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              imagen_to_upload != null
                  ? Image.file(imagen_to_upload!)
                  : Container(
                      height: 200,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      color: Colors.grey,
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                  onPressed: () async {
                    final XFile? imagen = await takeImage();
                    setState(() {
                      imagen_to_upload = File(imagen!.path);
                    });
                  },
                  child: const Text('Tomar Imagen')),
                  SizedBox(width: 15,),
                  ElevatedButton(
                  onPressed: () async {
                    final XFile? imagen = await getImage();
                    setState(() {
                      imagen_to_upload = File(imagen!.path);
                    });
                  },
                  child: const Text('Seleccionar Imagen'),),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   ElevatedButton(
                      onPressed: () async {
                        if (imagen_to_upload == null) {
                          return;
                        }
                        final uploaded = await uploadImage(imagen_to_upload!);
        
                        if (uploaded) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Imagen subida correctamente")));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Error al subir la imagen")));
                        }
                      },
                      child: const Text('Subir Imagen')),
                      
                 ],
               ),
              
            ],
          ),
        ));
  }
}