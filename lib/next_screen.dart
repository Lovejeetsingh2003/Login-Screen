import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NExt Page",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(47, 75, 78, 1),
          ),
        ),
      ),
    );
  }
}
