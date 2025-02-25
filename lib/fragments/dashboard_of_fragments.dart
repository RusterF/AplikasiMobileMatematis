import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kuliah_tpm/fragments/counter_fragment_screen.dart';
import 'package:kuliah_tpm/fragments/calculator_fragment_screen.dart';
import 'package:kuliah_tpm/fragments/profile_fragment_screen.dart';
import 'package:kuliah_tpm/fragments/ganjil_genap_fragment_screen.dart';

class DashboardOfFragments extends StatelessWidget {
  final List<Widget> _fragmentScreens = [
    ProfileFragmentScreen(),
    GanjilGenapScreen(),
    CalculatorFragmentScreen(),
    DigitCounter(),
  ];

  final List _navigationButtonProperties = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.person_outlined,
      "label": "Home",
    },
    {
      "active_icon": Icons.numbers,
      "non_active_icon": Icons.numbers_outlined,
      "label": "GanjilGenap",
    },
    {
      "active_icon": Icons.calculate,
      "non_active_icon": Icons.calculate_outlined,
      "label": "Kalkulator",
    },
    
    {
      "active_icon": Icons.countertops,
      "non_active_icon": Icons.countertops_outlined,
      "label": "Total Angka",
    },
  ];

  RxInt _indexNumber = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      //   automaticallyImplyLeading: false,
      // ),
      body: Obx(() => _fragmentScreens[_indexNumber.value]), // Tambahkan ini
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _indexNumber.value,
          onTap: (value) {
            _indexNumber.value = value;
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.indigo[600],
          unselectedItemColor: Colors.grey[400],
          items: List.generate(4, (index) {
            var navBtnProperty = _navigationButtonProperties[index];
            return BottomNavigationBarItem(
              backgroundColor: Colors.grey[300],
              icon: Icon(navBtnProperty["non_active_icon"]),
              activeIcon: Icon(navBtnProperty["active_icon"]),
              label: navBtnProperty["label"],
            );
          }),
        ),
      ),
    );
  }
}
