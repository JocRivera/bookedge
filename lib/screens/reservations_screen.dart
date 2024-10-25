import 'package:flutter/material.dart';
import '../models/reservation.dart';
import '../../data/reservation/mock_data.dart';
import '../../widgets/reservation/reservation_list_item.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  String? expandedStatus;

  Map<String, List<Reservation>> get groupedReservations {
    final Map<String, List<Reservation>> grouped = {};
    for (var reservation in mockReservations) {
      grouped.putIfAbsent(reservation.status, () => []).add(reservation);
    }
    return grouped;
  }

  List<String> get sortedStatuses {
    final statuses = groupedReservations.keys.toList();
    statuses.sort((a, b) {
      final order = [
        "pending",
        "confirmed",
        "in lodging",
        "finalized",
        "cancelled"
      ];
      return order.indexOf(a).compareTo(order.indexOf(b));
    });
    return statuses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservations'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sortedStatuses.length,
        itemBuilder: (context, index) {
          final status = sortedStatuses[index];
          final reservations = groupedReservations[status]!;

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    '${status.toUpperCase()} Reservations',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  trailing: Icon(
                    expandedStatus == status
                        ? Icons.expand_less
                        : Icons.expand_more,
                  ),
                  onTap: () {
                    setState(() {
                      expandedStatus = expandedStatus == status ? null : status;
                    });
                  },
                ),
                if (expandedStatus == status)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reservations.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final reservation = reservations[index];
                      return ReservationListItem(reservation: reservation);
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
