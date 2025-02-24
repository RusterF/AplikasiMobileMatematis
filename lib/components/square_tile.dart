import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const SquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(width: 15),
            Image.asset(
              imagePath,
              height: 40,
            ),
            SizedBox(width: 30), // Add some space between the image and text
            Text(
              'LOGIN WITH GOOGLE',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
