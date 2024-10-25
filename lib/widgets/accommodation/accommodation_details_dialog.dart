import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/accommodation.dart';

class AccommodationDetailsDialog extends StatelessWidget {
  final Accommodation accommodation;

  const AccommodationDetailsDialog({
    super.key,
    required this.accommodation,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(accommodation.name),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDetailSection('Type', accommodation.type),
            _buildDetailSection('Capacity', '${accommodation.capacity} guests'),
            _buildDetailSection('Status', accommodation.status),
            _buildDetailSection('Price', '\$${accommodation.price} / night'),
            const SizedBox(height: 8),
            const Text(
              'Amenities',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...accommodation.amenities.map((amenity) => Text('• $amenity')),
            if (accommodation.currentGuest != null) ...[
              const SizedBox(height: 8),
              _buildDetailSection('Current Guest', accommodation.currentGuest!),
              _buildDetailSection(
                'Check-in',
                DateFormat.yMMMd().add_jm().format(accommodation.checkIn!),
              ),
              _buildDetailSection(
                'Check-out',
                DateFormat.yMMMd().add_jm().format(accommodation.checkOut!),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildDetailSection(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
