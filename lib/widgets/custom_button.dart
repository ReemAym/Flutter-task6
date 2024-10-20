import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, 
    required this.title,
    this.onTap,
  });

  String title;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 45,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xff2B475E),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
