import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/widgets/menu/menu.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        children: [
          Menu(currentIndex: 3,),
        ],
      ),
    );
  }
}