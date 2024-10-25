import 'package:flutter/material.dart';
import '../../models/accommodation.dart';
import 'accommodation_card.dart';

class AccommodationGrid extends StatelessWidget {
  final List<Accommodation> accommodations;

  const AccommodationGrid({
    super.key,
    required this.accommodations,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: accommodations.length,
      itemBuilder: (context, index) {
        return AccommodationCard(
          accommodation: accommodations[index],
        );
      },
    );
  }
}
