import 'package:flutter/material.dart';

class PageViewInfo3 extends StatelessWidget {
  const PageViewInfo3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Para hacer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              SizedBox(
                height: 20,
              ),
              Text("Puedes hacer una lista de la compra a papel y subir la fotografía"),
              SizedBox(
                height: 10,
              ),
              Text("Puedes crear tu propia lista digital(actualmente la compartes con todo el mundo)"),
              SizedBox(
                height: 10,
              ),
              Text("Tambien puedes revisar los supermercados cercanos de Teruel"),
              SizedBox(
                height: 10,
              ),
              Image.asset("assets/cart.png")
            ],
          ),
        ),
      
    );
  }
}