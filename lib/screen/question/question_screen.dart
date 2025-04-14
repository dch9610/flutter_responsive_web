import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_subtitle.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_web.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_widgets.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/question_util.dart';
import 'package:flutter_responsive_web/widgets/common_scaffold.dart';
import 'package:flutter_responsive_web/widgets/custom_dropdown_button.dart';
import 'package:flutter_responsive_web/widgets/custom_text_form_field.dart';
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
  int selectedIndex = 0;

  @override
  void initState(){
    QuestionUtil().initData();
    super.initState();

  }

  @override
  void dispose() {
    QuestionUtil().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(
      myBuilder: (screenModel, web, tablet, mobile) {
        return CommonScaffold(
          currentIndex: 3,
          screenModel: screenModel,
          black: false,
          childern: [
            Header(
              title: '온라인 문의',
              subTitle: '프로젝트 및 서비스 문의를 남겨주세요.',
              backgroundImage: AssetPath.questionHeaderImage,
              screenModel: screenModel,
            ),
            // QuestionSubtitle(screenModel: screenModel),
            // QuestionWeb(),
          ],
        );

        // return Scaffold(
        //   endDrawer: PageDrawer(currentIndex: 3, tablet: tablet),
        //   body: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         Menu(currentIndex: 3, screenModel: screenModel),
        //         Header(
        //           title: '온라인 문의',
        //           subTitle: '프로젝트 및 서비스 문의를 남겨주세요.',
        //           backgroundImage: AssetPath.questionHeaderImage,
        //           screenModel: screenModel,
        //         ),

        //         Footer(),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}
