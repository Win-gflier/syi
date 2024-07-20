import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'SYI - Share Your Ideas',

          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: Text(
          'aldjss',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
