import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'ExerciceProvider.dart';
import 'google_maps_flutter.dart';

class PagePrincipale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercices')),
      body: Consumer<ExerciceProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.resultats.length,
            itemBuilder: (context, index) {
              final resultat = provider.resultats[index];
              return ListTile(
                title: Text(resultat.exercice),
                subtitle: Text('Distance : ${resultat.distanceParcourue} km'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarteExercice(
                        chemin: resultat.chemin
                            .map((point) => LatLng(point['lat']!, point['lng']!))
                            .toList(),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}