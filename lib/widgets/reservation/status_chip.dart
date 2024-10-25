import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final String status;

  const StatusChip({
    super.key,
    required this.status,
  });

  Color get backgroundColor {
    switch (status) {
      case 'pending':
        return Colors.yellow.shade100;
      case 'confirmed':
        return Colors.green.shade100;
      case 'in lodging':
        return Colors.blue.shade100;
      case 'cancelled':
        return Colors.red.shade100;
      case 'finalized':
        return Colors.grey.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  Color get textColor {
    switch (status) {
      case 'pending':
        return Colors.yellow.shade900;
      case 'confirmed':
        return Colors.green.shade900;
      case 'in lodging':
        return Colors.blue.shade900;
      case 'cancelled':
        return Colors.red.shade900;
      case 'finalized':
        return Colors.grey.shade900;
      default:
        return Colors.grey.shade900;
    }
  }

  @override // This line ensures you're overriding the inherited method
  Widget build(BuildContext context) {
    // Here you define the UI of the chip based on status
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
