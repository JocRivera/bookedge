
class Reservation {
  final int id;
  final String name;
  final String plan;
  final String accommodation;
  final int companions;
  final List<String>? services;
  final DateTime startDate;
  final DateTime departureDate;
  final String status;
  final String paymentInformation;
  final DateTime? checkIn;
  final DateTime? checkOut;

  Reservation({
    required this.id,
    required this.name,
    required this.plan,
    required this.accommodation,
    required this.companions,
    this.services,
    required this.startDate,
    required this.departureDate,
    required this.status,
    required this.paymentInformation,
    this.checkIn,
    this.checkOut,
  });
}
