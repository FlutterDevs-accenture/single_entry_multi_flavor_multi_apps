import 'package:flutter/material.dart';

class HomeJci extends StatelessWidget {
  const HomeJci({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JCI Home')),
      body: Center(child: Text('Welcome to JCI App')),
    );
  }
}
