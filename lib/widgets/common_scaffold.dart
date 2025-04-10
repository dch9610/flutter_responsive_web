import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/model/screen_model.dart';
import 'package:flutter_responsive_web/widgets/footer.dart';
import 'package:flutter_responsive_web/widgets/menu/menu.dart';
import 'package:flutter_responsive_web/widgets/page_drawer.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    super.key,
    required this.currentIndex,
    required this.screenModel,
    required this.childern, 
    this.black = true,
  });

  final int currentIndex;
  final ScreenModel screenModel;
  final List<Widget> childern;
  final bool black;

  @override
  Widget build(BuildContext context) {
    childern.add(const Footer());
    return Scaffold(
      endDrawer: PageDrawer(
        currentIndex: currentIndex,
        tablet: screenModel.tablet,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(child: Column(children: childern)),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Menu(currentIndex: currentIndex, screenModel: screenModel, black: black,),
          ),
        ],
      ),
    );
  }
}
