import 'package:flutter/material.dart';
import 'package:uts_tpm/presentation/pages/kalkulator_tabung_screen.dart';
import 'package:uts_tpm/presentation/pages/kalkulator_trapesium_screen.dart';

class CalculatorBangunScreen extends StatefulWidget {
  const CalculatorBangunScreen({super.key});

  @override
  State<CalculatorBangunScreen> createState() => _CalculatorBangunScreenState();
}

class _CalculatorBangunScreenState extends State<CalculatorBangunScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('HITUNG BANGUN RUANG')),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'TRAPESIUM',
              ),
              Tab(
                text: 'TABUNG',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            KalkulatorTrapesiumScreen(),
            KalkulatorTabungScreen(),
          ],
        ),
      ),
    );
  }
}
