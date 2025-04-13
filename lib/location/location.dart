import 'package:location/location.dart';

class LocalisationService {
  final Location _location = Location();

  Future<bool> verifierPermissions() async {
    // Vérifie si le service de localisation est activé
    bool serviceActive = await _location.serviceEnabled();
    if (!serviceActive) {
      serviceActive = await _location.requestService();
      if (!serviceActive) return false;
    }

    // Vérifie les permissions de localisation
    PermissionStatus permission = await _location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await _location.requestPermission();
      if (permission != PermissionStatus.granted) return false;
    }

    return true;
  }

  // Retourne un flux des données de localisation
  Stream<LocationData> suivrePosition() {
    return _location.onLocationChanged;
  }
}