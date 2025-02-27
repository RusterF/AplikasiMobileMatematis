import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuliah_tpm/authentication/login_screen.dart';

class ProfileFragmentScreen extends StatelessWidget {
  ProfileFragmentScreen({super.key});

  void logout(BuildContext context) {
    Get.offAll(() => LoginScreen());
  }

  final List<Map<String, String>> members = [
    {"name": "Rahel Anatasya Sinaga", "nim": "123220018"},
    {"name": "Dea Reigina", "nim": "123220020"},
    {"name": "Naufal Rafid Muhammad Faddila", "nim": "123220052"},
    {"name": "R Fiuw Winlye Ferdiansyah", "nim": "123220098"},
  ];

  final List<Color> nameColors = [Colors.white, Colors.black, Colors.black, Colors.white];
  final List<Color> nimColors = [Colors.white, Colors.black, Colors.black, Colors.white];

  final List<Color> cardColors = [
    Colors.indigo[500]!,
    Colors.indigo[200]!,
    Colors.indigo[200]!,
    Colors.indigo[500]!,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Data Kelompok", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo[600],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
              ),
              child: const Column(
                children: [
                  Text(
                    "Teknologi Dan Pemrograman Mobile IF-C",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Daftar Anggota",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.8,
                  ),
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    final member = members[index];
                    return Card(
                      color: cardColors[index % cardColors.length],
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.person, size: 35, color: Colors.black54),
                            const SizedBox(height: 6),
                            Text(
                              member["name"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: nameColors[index % nameColors.length],
                              ),
                            ),
                            Text(
                              "NIM: ${member["nim"]!}",
                              style: TextStyle(
                                fontSize: 12,
                                color: nimColors[index % nimColors.length],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: () => logout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[600],
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
