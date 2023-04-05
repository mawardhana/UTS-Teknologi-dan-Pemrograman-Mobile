import 'package:flutter/material.dart';

class KalkulatorTabungScreen extends StatefulWidget {
  const KalkulatorTabungScreen({super.key});

  @override
  State<KalkulatorTabungScreen> createState() => _KalkulatorTabungScreenState();
}

class _KalkulatorTabungScreenState extends State<KalkulatorTabungScreen> {
  TextEditingController panjangJariController = TextEditingController();
  TextEditingController panjangTinggiController = TextEditingController();
  double volumeTabung = 0;
  double luasTabung = 0;
  bool isFilled = true;

  void hitung() {
    double jari = double.parse(panjangJariController.text);
    double tinggi = double.parse(panjangTinggiController.text);

    setState(() {
      luasTabung = 2 * 3.14 * jari * (jari + tinggi);
      volumeTabung = 3.14 * jari * jari * tinggi;
    });
  }

  bool inputHandler() {
    isFilled = true;
    if (panjangJariController.text == '' ||
        panjangTinggiController.text == '') {
      isFilled = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Tidak Boleh Kosong !!',
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
          width: 300,
          duration: Duration(seconds: 2),
        ),
      );
      return isFilled;
    }
    return isFilled;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Luas',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        luasTabung.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Volume',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        volumeTabung.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: panjangJariController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Jari - Jari Tabung',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: panjangTinggiController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tinggi Tabung',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                if (inputHandler()) {
                  hitung();
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'Mulai Hitung',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
