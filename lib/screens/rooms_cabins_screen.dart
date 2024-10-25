import 'package:flutter/material.dart';
import '../widgets/accommodation/accommodation_grid.dart';
import '../widgets/accommodation/search_filter_bar.dart';
import '../widgets/sidebar.dart';
import '../models/accommodation.dart';
import '../data/accommodation/mock_data.dart';

class RoomsCabinsScreen extends StatefulWidget {
  const RoomsCabinsScreen({super.key});

  @override
  State<RoomsCabinsScreen> createState() => _RoomsCabinsScreenState();
}

class _RoomsCabinsScreenState extends State<RoomsCabinsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _filterType = 'all';
  String _searchQuery = '';

  List<Accommodation> get filteredAccommodations {
    return mockAccommodations.where((acc) {
      final matchesType = _filterType == 'all' || acc.type == _filterType;
      final matchesSearch =
          acc.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesType && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Rooms & Cabins'),
      ),
      body: Column(
        children: [
          SearchFilterBar(
            onSearchChanged: (value) => setState(() => _searchQuery = value),
            onFilterChanged: (value) => setState(() => _filterType = value),
            filterType: _filterType,
          ),
          Expanded(
            child: AccommodationGrid(accommodations: filteredAccommodations),
          ),
        ],
      ),
    );
  }
}
