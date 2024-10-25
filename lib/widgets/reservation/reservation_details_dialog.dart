import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/reservation.dart';

class ReservationDetailsDialog extends StatelessWidget {
  final Reservation reservation;

  const ReservationDetailsDialog({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reservation Details'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDetailSection('Guest', reservation.name),
            _buildDetailSection('Plan', reservation.plan),
            _buildDetailSection('Accommodation', reservation.accommodation),
            _buildDetailSection(
                'Companions', reservation.companions.toString()),
            if (reservation.services != null) ...[
              const SizedBox(height: 8),
              const Text(
                'Additional Services',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...reservation.services!.map((service) => Text('• $service')),
            ],
            _buildDetailSection(
              'Check-in',
              DateFormat('MMM d, y HH:mm').format(reservation.startDate),
            ),
            _buildDetailSection(
              'Check-out',
              DateFormat('MMM d, y HH:mm').format(reservation.departureDate),
            ),
            if (reservation.checkIn != null)
              _buildDetailSection(
                'Actual Check-in',
                DateFormat('MMM d, y HH:mm').format(reservation.checkIn!),
              ),
            if (reservation.checkOut != null)
              _buildDetailSection(
                'Actual Check-out',
                DateFormat('MMM d, y HH:mm').format(reservation.checkOut!),
              ),
            _buildDetailSection(
              'Payment Information',
              reservation.paymentInformation,
            ),
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

  Widget _buildDetailSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(content),
        ],
      ),
    );
  }
}
