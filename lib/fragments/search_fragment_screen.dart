import 'package:flutter/material.dart';

class SearchFragmentScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/white.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
