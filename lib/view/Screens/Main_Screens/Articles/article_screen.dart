
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: const Scaffold(
      body: Center(
        child: Text('data'),
      ),
    ));
  }
}