import 'package:flutter/material.dart';
import 'package:uts_tpm/presentation/pages/detail_screen.dart';
import 'package:uts_tpm/presentation/pages/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('APLIKASI UTS TPM')),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            ListTile(
              leading: ClipOval(
                child: Image.asset(
                  'assets/images/arya.JPG',
                ),
              ),
              title: const Text(
                'Maulana Arya Wisnu Wardhana',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: const Text(
                '123200138',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Padding(
                      padding: EdgeInsets.fromLTRB(5, 12, 8, 8),
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    title: const Text(
                      'View Profil',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailProfileScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Padding(
                      padding: EdgeInsets.fromLTRB(5, 12, 8, 8),
                      child: Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    title: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
