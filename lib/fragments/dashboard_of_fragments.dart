import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kuliah_tpm/fragments/home_fragment_screen.dart';
import 'package:kuliah_tpm/fragments/order_fragment_screen.dart';
import 'package:kuliah_tpm/fragments/profile_fragment_screen.dart';
import 'package:kuliah_tpm/fragments/search_fragment_screen.dart';

class DashboardOfFragments extends StatelessWidget {
  List<Widget> _fragmentScreens = [
    HomeFragmentsScreen(),
    SearchFragmentScreen(),
    OrderFragmentScreen(),
    ProfileFragmentScreen(),
  ];

  List _navigationButtonProperties = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Home",
    },
    {
      "active_icon": Icons.search,
      "non_active_icon": Icons.search_outlined,
      "label": "Search",
    },
    {
      "active_icon": FontAwesomeIcons.boxOpen,
      "non_active_icon": FontAwesomeIcons.box,
      "label": "Orders",
    },
    {
      "active_icon": Icons.person,
      "non_active_icon": Icons.person_outlined,
      "label": "Profile",
    },
  ];

  RxInt _indexNumber = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(child: Obx(() => _fragmentScreens[_indexNumber.value])),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _indexNumber.value,
          onTap: (value) {
            _indexNumber.value = value;
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
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
