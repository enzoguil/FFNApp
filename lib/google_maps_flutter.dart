import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarteExercice extends StatefulWidget {
  final List<LatLng> chemin;

  const CarteExercice({Key? key, required this.chemin}) : super(key: key);

  @override
  _CarteExerciceState createState() => _CarteExerciceState();
}

class _CarteExerciceState extends State<CarteExercice> {
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.chemin.isNotEmpty ? widget.chemin.first : const LatLng(0, 0),
        zoom: 15,
      ),
      polylines: {
        Polyline(
          polylineId: PolylineId('chemin'),
          points: widget.chemin,
          color: Colors.blue,
          width: 5,
        ),
      },
      onMapCreated: (controller) {
        try {
          _mapController = controller;
        } catch (e) {
          print('Erreur lors de l\'initialisation de la carte : $e');
        }
      },
    );
  }
}