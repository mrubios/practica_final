import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

Future<bool> uploadImage(File imagen) async {
  //print("Ruta de la imagen" + imagen.path);
  // dividimos el nombre de la ruta del archivo enpartes separadas por '/'
  // y nos quedamos con la última.
  final String nombreImagen = imagen.path.split('/').last;

  final firebase_storage.Reference ref =
      storage.ref().child('imagenes').child(nombreImagen);
  final firebase_storage.UploadTask uploadTask = ref.putFile(imagen);
  //print(uploadTask);

  final firebase_storage.TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
  //print(snapshot);
  //Vamos a obtener la url del archivo subido a Storage
  final String url = await snapshot.ref.getDownloadURL();


  if (snapshot.state == firebase_storage.TaskState.success) {
    return true;
  } else {
    return false;
  }
}
