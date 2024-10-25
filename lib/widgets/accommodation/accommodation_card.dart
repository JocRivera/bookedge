import 'package:flutter/material.dart';
import '../../models/accommodation.dart';
import 'accommodation_details_dialog.dart';

class AccommodationCard extends StatelessWidget {
  final Accommodation accommodation;

  const AccommodationCard({
    super.key,
    required this.accommodation,
  });

  Color _getStatusColor() {
    switch (accommodation.status) {
      case 'available':
        return Colors.green.shade100;
      case 'occupied':
        return Colors.blue.shade100;
      case 'maintenance':
        return Colors.yellow.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    accommodation.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    accommodation.status,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Type: ${accommodation.type[0].toUpperCase()}${accommodation.type.substring(1)}',
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              'Capacity: ${accommodation.capacity} guests',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${accommodation.price.toStringAsFixed(0)} / night',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AccommodationDetailsDialog(
                      accommodation: accommodation,
                    ),
                  );
                },
                child: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
