class ChargerModel {
  final String id; // charger unique identifier
  final String chargerImagePath; // charger image path
  final String chargerDescription; // charger description
  final double pricePerKwh; // charger current price per kWh
  bool isAvailable; // charger availability

  ChargerModel({
    required this.id,
    required this.chargerImagePath,
    required this.chargerDescription,
    required this.pricePerKwh,
    this.isAvailable = true,
  });
}
