import 'package:flutter/material.dart';

class SearchFilterBar extends StatelessWidget {
  final Function(String) onSearchChanged;
  final Function(String) onFilterChanged;
  final String filterType;

  const SearchFilterBar({
    super.key,
    required this.onSearchChanged,
    required this.onFilterChanged,
    required this.filterType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: onSearchChanged,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search rooms or cabins...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: filterType,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: const [
              DropdownMenuItem(value: 'all', child: Text('All Types')),
              DropdownMenuItem(value: 'room', child: Text('Rooms')),
              DropdownMenuItem(value: 'cabin', child: Text('Cabins')),
              DropdownMenuItem(value: 'suite', child: Text('Suites')),
            ],
            onChanged: (value) => onFilterChanged(value ?? 'all'),
          ),
        ],
      ),
    );
  }
}
