class ResultatExercice {
  final int id;
  final String exercice;
  final DateTime date;
  final double distanceParcourue; // En kilomètres
  final List<Map<String, double>> chemin; // Liste des points GPS

  ResultatExercice({
    required this.id,
    required this.exercice,
    required this.date,
    required this.distanceParcourue,
    required this.chemin,
  });
}