import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuliah_tpm/authentication/login_screen.dart';

class ProfileFragmentScreen extends StatelessWidget {
  const ProfileFragmentScreen({super.key});

  void logout(BuildContext context) {
    Get.offAll(
      () => LoginScreen(),
    ); // This clears the navigation stack and redirects to login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Data Kelompok", style: TextStyle(color: Colors.white) ),
        
        backgroundColor: Colors.indigo[600],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Class Title Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
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

            // Group Members Table
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Table(
                border: TableBorder.all(color: Colors.grey.shade400),
                columnWidths: const {
                  0: FlexColumnWidth(3), // Name column wider
                  1: FlexColumnWidth(2), // NIM column
                },
                children: const [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.indigo),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Nama",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "NIM",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Rahel Anatasya Sinaga",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("123220018", textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Dea Reigina", textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("123220020", textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Naufal Rafid Muhammad Faddila",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("123220052", textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "R Fiuw Winlye Ferdiansyah",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("123220098", textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 50), // Mengangkat tombol ke atas
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () => logout(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[600],
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
