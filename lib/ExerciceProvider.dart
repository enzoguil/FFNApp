import 'package:flutter/cupertino.dart';

import 'models/ResultatExercice.dart';

class ExerciceProvider with ChangeNotifier {
  final List<ResultatExercice> _resultats = [
    ResultatExercice(
      id: 1,
      exercice: "Course à pied",
      date: DateTime.now(),
      distanceParcourue: 5.2,
      chemin: [
        {"lat": 48.8566, "lng": 2.3522},
        {"lat": 48.8570, "lng": 2.3530},
      ],
    ),
    ResultatExercice(
      id: 2,
      exercice: "Vélo",
      date: DateTime.now(),
      distanceParcourue: 12.4,
      chemin: [
        {"lat": 48.8566, "lng": 2.3522},
        {"lat": 48.8580, "lng": 2.3540},
      ],
    ),
  ];

  List<ResultatExercice> get resultats => _resultats;

  void ajouterResultat(ResultatExercice resultat) {
    _resultats.add(resultat);
    notifyListeners();
  }
}