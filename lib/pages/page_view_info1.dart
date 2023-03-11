import 'package:flutter/material.dart';

class PageViewInfo1 extends StatelessWidget {
  const PageViewInfo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

        child:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sobre la app", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              SizedBox(
                height: 20,
              ),
              Text("Esta aplicación está hecha para la gente que se olvida de la lista de la compra"),
              SizedBox(
                height: 10,
              ),
              Text("Con esta app podrás poner una foto de tu lista o hacer una lista digital"),
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