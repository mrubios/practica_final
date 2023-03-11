import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


final mercadonaCAlcaniz = LatLng(40.351886, -1.108126);
final mercadonaAAragon = LatLng(40.331501, -1.105613);
final mercadonaCRamon = LatLng(40.331357, -1.093431);
final alcampo = LatLng(40.333420, -1.094355);
final lidl = LatLng(40.345323, -1.105565);
final carrefourOvalo = LatLng(40.341245, -1.108001);
final aldi = LatLng(40.326729, -1.096539);
final carrefourASagunto = LatLng(40.332711, -1.100428);
final carrefourCastralvo = LatLng(40.332690, -1.100956);
final dia = LatLng(40.347415, -1.116696);
final carrefourSanJulian = LatLng(40.341148, -1.102625);
final plazaDelTorico = LatLng(40.351886, -1.108126);
const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoiY2VxdWUiLCJhIjoiY2tkM3F4MzV1MHl4NjJ0bndzdWdmNWI5cSJ9._jBKVgTDTR2W1auJYOgiMg';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: plazaDelTorico,
          minZoom: 7.0,
          maxZoom: 19.0,
          zoom: 14.0,
        ),
        nonRotatedChildren: [
          TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              additionalOptions: const {
                'accessToken': MAPBOX_ACCESS_TOKEN,
                'id': 'mapbox/streets-v12'
              }),
          MarkerLayer(
            markers: [
              Marker(
                  point: mercadonaCAlcaniz,
                  builder: (context) {
                    return Container(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    );
                  }),
                  Marker(
                  point: mercadonaAAragon,
                  builder: (context) {
                    return Container(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    );
                  }),
                  Marker(
                  point: mercadonaCRamon,
                  builder: (context) {
                    return Container(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    );
                  }),
                  Marker(
                  point: alcampo,
                  builder: (context) {
                    return Container(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    );
                  }),
                  Marker(
                  point: aldi,
                  builder: (context) {
                    return Container(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    );
                  }),
                  Marker(
                  point: lidl,
                  builder: (context) {
                    return Container(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    );
                  }),
                  Marker(
                  point: carrefourOvalo,
                  builder: (context) {
                    return Container(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    );
                  }),
                  Marker(
                  point: carrefourASagunto,
                  builder: (context) {
                    return Container(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    );
                  }),
                  Marker(
                  point: carrefourCastralvo,
                  builder: (context) {
                    return Container(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    );
                  }),
                  Marker(
                  point: carrefourSanJulian,
                  builder: (context) {
                    return Container(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    );
                  }),
                  Marker(
                  point: dia,
                  builder: (context) {
                    return Container(
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    );
                  }),
            ],
          )
        ],
      ),
    );
  }
}