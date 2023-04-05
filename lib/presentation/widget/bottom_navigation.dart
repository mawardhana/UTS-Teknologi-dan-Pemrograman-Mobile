import 'package:flutter/material.dart';
import 'package:uts_tpm/presentation/pages/calendar_screen.dart';
import 'package:uts_tpm/presentation/pages/profile_screen.dart';
import '../pages/calculator_bangun_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  static const List<Widget> widgetOptions = [
    CalculatorBangunScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate,
            ),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blueGrey,
        currentIndex: selectedIndex,
      ),
    );
  }
}
