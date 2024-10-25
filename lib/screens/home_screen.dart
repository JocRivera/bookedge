import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/main_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Hotel Manager'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          PopupMenuButton(
            icon: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://hosterialoslagos.com/wp-content/uploads/2024/09/Logolagos.png'),
            ),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                child: Text('Profile'),
              ),
              const PopupMenuItem(
                child: Text('Settings'),
              ),
              const PopupMenuItem(
                child: Text('Log out'),
              ),
            ],
          ),
        ],
      ),
      drawer: const Sidebar(),
      body: const MainContent(),
    );
  }
}
