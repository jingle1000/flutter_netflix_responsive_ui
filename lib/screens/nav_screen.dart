import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_responsive_ui/cubits/cubits.dart';
import 'package:flutter_netflix_responsive_ui/screens/home_screen.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    "Home": Icons.home,
    "Races": Icons.flag,
    "Events": Icons.calendar_today,
    "Upload": Icons.upload_file,
    "Studio": Icons.camera_alt,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => this._currentIndex = index),
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedFontSize: 11.0,
        selectedItemColor: Colors.white,
        unselectedFontSize: 10.0,
        unselectedItemColor: Colors.white30,
        items: _icons
            .map(
              (title, icon) {
                return MapEntry(
                    title,
                    BottomNavigationBarItem(
                      icon: Icon(icon, size: 30.0),
                      label: title,
                    ));
              },
            )
            .values
            .toList(),
      ),
    );
  }
}
