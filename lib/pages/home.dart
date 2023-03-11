import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practica_final/pages/page_vew_info3.dart';
import 'package:practica_final/pages/page_view_info1.dart';
import 'package:practica_final/pages/page_view_info2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeEstudiantePage extends StatelessWidget {
  const HomeEstudiantePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();

    return Scaffold(
      body: Center(
        child: Stack(children: [
          PageView(
            controller: _controller,
            children: [
              PageViewInfo1(),
              PageViewInfo2(),
              PageViewInfo3()
            ],
          ),
          Container(
            alignment: Alignment(0,0.80),
            child: SmoothPageIndicator(controller: _controller, count: 3),
          ),
        ]),
      ),
    );
  }
}
