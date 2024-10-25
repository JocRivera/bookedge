import '../../models/accommodation.dart';

final List<Accommodation> mockAccommodations = [
  Accommodation(
    id: 1,
    name: "Deluxe Cabin 101",
    type: "cabin",
    capacity: 4,
    status: "occupied",
    currentGuest: "John Doe",
    checkIn: DateTime(2024, 3, 15, 14),
    checkOut: DateTime(2024, 3, 20, 11),
    amenities: ["Kitchen", "Fireplace", "Mountain View"],
    price: 250,
  ),
  Accommodation(
    id: 2,
    name: "Standard Room 201",
    type: "room",
    capacity: 2,
    status: "available",
    amenities: ["TV", "Mini Fridge", "City View"],
    price: 150,
  ),
  // Añade más datos aquí...
];
