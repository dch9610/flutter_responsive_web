import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/widgets/menu/menu.dart';
import 'package:flutter_responsive_web/widgets/screen_layout_builder.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(
      myBuilder: (screenModel, web, tablet, mobile) {
        return Scaffold(
          body: Column(
            children: [Menu(currentIndex: 3, screenModel: screenModel)],
          ),
        );
      },
    );
  }
}
