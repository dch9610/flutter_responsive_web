import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_subtitle.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_widgets.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
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
            QuestionSubtitle(screenModel: screenModel),
            QuestionWidgets.dropdownBox(
              context: context,
              web: web,
              label: '프로젝트 / 서비스 선택 *',
              labelList: ['앱', '웹', '서비스', '협의'],
              selectedIndex: selectedIndex,
              onChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),

            QuestionWidgets.formFieldBox(
              context: context,
              web: web,
              label: '문의 제목*',
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              hintText: '문의 제목을 입력해주세요.',
            ),

            CustomTextFormField(
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              hintText: '이메일을 입력해주세요.',
            ),
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
