class ChargerModel {
  final String name; // charger name
  final String id; // charger unique identifier
  final String imagePath; // charger image path
  final String description; // charger description
  final double pricePerKwh; // charger current price per kWh
  bool isAvailable; // charger availability

  ChargerModel({
    required this.name,
    required this.id,
    required this.imagePath,
    required this.description,
    required this.pricePerKwh,
    this.isAvailable = true,
  });
}
