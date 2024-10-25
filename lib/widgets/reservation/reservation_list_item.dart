import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/reservation.dart';
import 'reservation_details_dialog.dart';
import 'status_chip.dart';

class ReservationListItem extends StatelessWidget {
  final Reservation reservation;

  const ReservationListItem({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reservation.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    reservation.accommodation,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              StatusChip(status: reservation.status),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 8),
              Text(
                '${DateFormat('MMM d').format(reservation.startDate)} - '
                '${DateFormat('MMM d, yyyy').format(reservation.departureDate)}',
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            icon: const Icon(Icons.info_outline),
            label: const Text('More Info'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ReservationDetailsDialog(
                  reservation: reservation,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
