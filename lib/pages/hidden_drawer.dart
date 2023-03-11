import 'package:flutter/material.dart';

import 'pages.dart';

class HiddenDrawerPage extends StatefulWidget {
  const HiddenDrawerPage({super.key});

  @override
  State<HiddenDrawerPage> createState() => HiddenDrawerState();
}

final _baseStyle = TextStyle(fontSize: 20);
final _selectedStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple);

class HiddenDrawerState extends State<HiddenDrawerPage> {
  List<ScreenHiddenDrawer> _pages = [
    ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: "Home",
            baseStyle: _baseStyle,
            selectedStyle: TextStyle(),
            colorLineSelected: Colors.purple),
        HomeEstudiantePage()),
    ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: "Foto de la lista",
            baseStyle: _baseStyle,
            selectedStyle: TextStyle(),
            colorLineSelected: Colors.purple),
        ImagePage()),
    ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: "Lista digital",
            baseStyle: _baseStyle,
            selectedStyle: TextStyle(),
            colorLineSelected: Colors.purple),
        CestaCompraPage()),
    ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: "Mapa de tiendas",
            baseStyle: _baseStyle,
            selectedStyle: TextStyle(),
            colorLineSelected: Colors.purple),
        MapPage()),
    ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: "Cerrar Sesión",
            baseStyle: _baseStyle,
            selectedStyle: TextStyle(),
            colorLineSelected: Colors.purple),
        LogoutPage())
  ];

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.transparent,
      screens: _pages,
      initPositionSelected: 0,
    );
  }
}
