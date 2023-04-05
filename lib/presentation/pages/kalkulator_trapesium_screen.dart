import 'package:flutter/material.dart';

class KalkulatorTrapesiumScreen extends StatefulWidget {
  const KalkulatorTrapesiumScreen({super.key});

  @override
  State<KalkulatorTrapesiumScreen> createState() =>
      _KalkulatorTrapesiumScreenState();
}

class _KalkulatorTrapesiumScreenState extends State<KalkulatorTrapesiumScreen> {
  TextEditingController panjangSisiAtas = TextEditingController();
  TextEditingController panjangSisiBawah = TextEditingController();
  TextEditingController panjangSisiKiri = TextEditingController();
  TextEditingController panjangSisiKanan = TextEditingController();
  TextEditingController panjangTinggi = TextEditingController();
  double kelilingTrapesium = 0;
  double luasTrapesium = 0;
  bool isFilled = true;

  void hitung() {
    double sisiAtas = double.parse(panjangSisiAtas.text);
    double sisiBawah = double.parse(panjangSisiBawah.text);
    double sisiKiri = double.parse(panjangSisiKiri.text);
    double sisiKanan = double.parse(panjangSisiKanan.text);
    double tinggi = double.parse(panjangTinggi.text);

    setState(() {
      kelilingTrapesium = sisiAtas + sisiBawah + sisiKiri + sisiKanan;
      luasTrapesium = 1 / 2 * (sisiAtas + sisiBawah) * tinggi;
    });
  }

  bool inputHandler() {
    isFilled = true;
    if (panjangSisiAtas.text == '' ||
        panjangSisiBawah.text == '' ||
        panjangSisiKiri.text == '' ||
        panjangSisiKanan.text == '' ||
        panjangTinggi.text == '') {
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
                        'Keliling',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        kelilingTrapesium.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Luas',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        luasTrapesium.toStringAsFixed(2),
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
              controller: panjangSisiAtas,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Panjang Sisi Atas',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: panjangSisiBawah,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Panjang Sisi Bawah',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: panjangSisiKiri,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Panjang Sisi Kiri',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: panjangSisiKanan,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Panjang Sisi Kanan',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: panjangTinggi,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tinggi',
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
