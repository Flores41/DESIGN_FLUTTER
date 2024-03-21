import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        width: width,
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.search,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
