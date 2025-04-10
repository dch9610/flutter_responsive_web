import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/widgets/footer.dart';
import 'package:flutter_responsive_web/widgets/header.dart';
import 'package:flutter_responsive_web/widgets/menu/menu.dart';
import 'package:flutter_responsive_web/widgets/page_drawer.dart';
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
          endDrawer: PageDrawer(currentIndex: 3, tablet: tablet),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Menu(currentIndex: 3, screenModel: screenModel),
                Header(
                  title: '온라인 문의',
                  subTitle: '프로젝트 및 서비스 문의를 남겨주세요.',
                  backgroundImage: AssetPath.questionHeaderImage,
                  screenModel: screenModel,
                ),
            
                Footer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
