class Accommodation {
  final int id;
  final String name;
  final String type;
  final int capacity;
  final String status;
  final String? currentGuest;
  final DateTime? checkIn;
  final DateTime? checkOut;
  final List<String> amenities;
  final double price;

  Accommodation({
    required this.id,
    required this.name,
    required this.type,
    required this.capacity,
    required this.status,
    this.currentGuest,
    this.checkIn,
    this.checkOut,
    required this.amenities,
    required this.price,
  });
}
