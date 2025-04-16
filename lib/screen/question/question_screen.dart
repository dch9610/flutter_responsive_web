import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_subtitle.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_tablet_mobile.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_web.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/question_util.dart';
import 'package:flutter_responsive_web/util/screen_padding.dart';
import 'package:flutter_responsive_web/widgets/common_scaffold.dart';
import 'package:flutter_responsive_web/widgets/header.dart';
import 'package:flutter_responsive_web/widgets/screen_layout_builder.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int selectedIndex = 0;

  late VoidCallback listener = () {
    setState(() {});
  };

  @override
  void initState() {
    QuestionUtil()
      ..initData()
      ..titleController.addListener(listener)
      ..nameController.addListener(listener)
      ..emailController.addListener(listener)
      ..contentController.addListener(listener);
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
        var scrennWidth = MediaQuery.of(context).size.width; // 현재 창에 가로사이즈
        return CommonScaffold(
          currentIndex: 3,
          screenModel: screenModel,
          horizontalPadding: ScreenPadding.get(web, scrennWidth),
          black: false,
          children: [
            Header(
              title: '온라인 문의',
              subTitle: '프로젝트 및 서비스 문의를 남겨주세요.',
              backgroundImage: AssetPath.questionHeaderImage,
              screenModel: screenModel,
            ),
            QuestionSubtitle(screenModel: screenModel),

            // 웹인 경우 QuestionWeb 함수를 리스트로 적용
            // 사이즈가 변경될때마다 빌드하지만 question_util에 Singleton으로 값을 넣어놨기 때문에
            // 데이터 변경은 없음
            if (web) ...[QuestionWeb()] else ...[QuestionTabletMobile()],
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
