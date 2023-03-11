import 'package:flutter/material.dart';

class PageViewInfo2 extends StatelessWidget {
  const PageViewInfo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,

        child:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sin terminar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              SizedBox(
                height: 20,
              ),
              Text("Esto quiere decir que todavía no tiene implementadas todas sus funcionalidades"),
              SizedBox(
                height: 10,
              ),
              Text("Una de ellas es revisar las fotos que se han subido previamente al servidor"),
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