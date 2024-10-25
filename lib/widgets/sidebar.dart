import 'package:flutter/material.dart';
import '../../screens/reservations_screen.dart';
import '../../screens/rooms_cabins_screen.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 80, // Ajusta la altura según sea necesario
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 73, 156, 178),
              ),
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24, // Reduce el tamaño de la fuente
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bed),
            title: const Text('Cabins & Rooms'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RoomsCabinsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Reservations'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReservationsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
