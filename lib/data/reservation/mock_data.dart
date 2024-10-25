import '../../models/reservation.dart';

final List<Reservation> mockReservations = [
  Reservation(
    id: 1,
    name: "John Doe",
    plan: "All-Inclusive",
    accommodation: "Deluxe Cabin",
    companions: 2,
    services: ["Spa", "Airport Transfer"],
    startDate: DateTime(2024, 3, 15, 14),
    departureDate: DateTime(2024, 3, 20, 11),
    status: "confirmed",
    paymentInformation: "Paid in full - Voucher #12345",
  ),
  Reservation(
    id: 2,
    name: "Jane Smith",
    plan: "Bed & Breakfast",
    accommodation: "Standard Room",
    companions: 1,
    startDate: DateTime(2024, 3, 18, 15),
    departureDate: DateTime(2024, 3, 22, 10),
    status: "in lodging",
    paymentInformation: "Paid in full - Voucher #67890",
    checkIn: DateTime(2024, 3, 18, 15, 30),
  ),
  // Add more mock reservations as needed
];
