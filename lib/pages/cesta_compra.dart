

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/producto.dart';

const COLLECTION_NAME = 'cesta_compra';

class CestaCompraPage extends StatefulWidget {
  const CestaCompraPage({super.key});

  @override
  State<CestaCompraPage> createState() => _CestaCompraPageState();
}

class _CestaCompraPageState extends State<CestaCompraPage> {
  List<Producto> listaProductos = [];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection(COLLECTION_NAME).snapshots().listen(
      (productos) {
        mapProductos(productos);
      },
    );
    fetchProductos();
  }

  // Consultamos los registros de la coleccion de Firebase Firestorage
  void fetchProductos() async {
    var lista_productos =
        await FirebaseFirestore.instance.collection(COLLECTION_NAME).get();
    mapProductos(lista_productos);
  }

  void mapProductos(QuerySnapshot<Map<String, dynamic>> lista_productos) {
    // Me creo un producto por cada producto quw tenga en la coleccion
    var _list = lista_productos.docs
        .map((producto) => Producto(
              id: producto.id,
              descripcion: producto['descripcion'],
              cantidad: producto['cantidad'] ?? '',
            ))
        .toList();
    setState(() {
      listaProductos = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                //Abro el Dialogo para introducir los datos
                showItemDialog("Añadir Producto");
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: listaProductos.length,
          itemBuilder: (context, index) {
            return Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(onPressed: (context) {
                    //updateUser();
                    showUpdateItemDialog(listaProductos[index].id, 
                    listaProductos[index].descripcion, 
                    listaProductos[index].cantidad ?? "");
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.update,
                  label: "Actualizar",),
                ],
              ),

              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      eliminarProducto(listaProductos[index].id);
                      // Muestro un Snackbar diciendo que el producto se ha eliminado
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(
                              'Se ha eliminado el producto correctamente')));
                    },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: ListTile(
                title: Text(listaProductos[index].descripcion),
                subtitle: Text(listaProductos[index].cantidad ?? ''),
              ),
            );
          }),
    );
  }

  void showItemDialog(String info) {

    // 2 - Los EditController necesitan sus controladores asociados
    var nameController = TextEditingController();
    var quantityController = TextEditingController();
    // 1 - Llamamos a showDialog para abrir una ventana emergente
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(info),
                TextField(
                  decoration: const InputDecoration(
                      labelText: 'Descripción del producto'),
                  controller: nameController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Cantidad'),
                  controller: quantityController,
                ),
                TextButton(
                    onPressed: () {
                      var descripcion = nameController.text.trim();
                      var cantidad = quantityController.text.trim();
                      addProducto(descripcion, cantidad);
                      Navigator.pop(context);
                    },
                    child: const Text('Añadir')),
              ],
            ),
          ),
        );
      },
    );
  }

  void addProducto(String descripcion, String cantidad) {
    Producto producto =
        Producto(id: 'id', descripcion: descripcion, cantidad: cantidad);
    // Subo la instancia del producto a Firebase
    FirebaseFirestore.instance
        .collection(COLLECTION_NAME)
        .add(producto.toJson());
  }

  void updateUser(String id, String descripcion, String cantidad){
      Producto producto_actualizado =
      Producto(id: 'id', descripcion: descripcion, cantidad: cantidad);
      FirebaseFirestore.instance.collection(COLLECTION_NAME).doc(id).update(producto_actualizado.toJson());
  }

  void eliminarProducto(String id) {
    FirebaseFirestore.instance.collection(COLLECTION_NAME).doc(id).delete();
  }
  
  void showUpdateItemDialog(String id, String descripcion, String cantidad) {
    
    // 2 - Los EditController necesitan sus controladores asociados
    var nameController = TextEditingController(text: descripcion);
    var quantityController = TextEditingController(text: cantidad);
    // 1 - Llamamos a showDialog para abrir una ventana emergente
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Update"),
                TextField(
                  decoration: const InputDecoration(
                      labelText: 'Descripción del producto',
                      ),
                  controller: nameController,

                  
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Cantidad'),
                  controller: quantityController,
                ),
                TextButton(
                    onPressed: () {
                      var descripcion = nameController.text.trim();
                      var cantidad = quantityController.text.trim();
                      updateUser(id, descripcion, cantidad);
                      Navigator.pop(context);
                    },
                    child: const Text('Actualizar')),
              ],
            ),
          ),
        );
      },
    );
  }
}