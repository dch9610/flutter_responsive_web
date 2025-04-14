import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/screen/question/widgets/question_widgets.dart';
import 'package:flutter_responsive_web/util/question_util.dart';

class QuestionWeb extends StatelessWidget {
  const QuestionWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final qUtil = QuestionUtil();

    return Column(
      children: [
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(
              child: QuestionWidgets.dropdownBox(
                context: context,
                web: true,
                label: '프로젝트 / 서비스 선택 *',
                labelList: ['앱', '웹', '서비스', '협의'],
                selectedIndex: qUtil.questionTypeIndex,
                onChanged: (index) {
                  qUtil.changeQuestionType(index);
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: QuestionWidgets.formFieldBox(
                context: context,
                web: true,
                label: '문의 제목*',
                controller: qUtil.titleController,
                textInputType: TextInputType.text,
                hintText: '문의 제목을 입력해주세요.',
              ),
            ),
          ],
        ),

        SizedBox(height: 25),
        Row(
          children: [
            Expanded(
              child: QuestionWidgets.formFieldBox(
                context: context,
                web: true,
                label: '문의인 이름 *',
                controller: qUtil.nameController,
                textInputType: TextInputType.text,
                hintText: '문의인 이름을 입력해주세요.',
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: QuestionWidgets.formFieldBox(
                context: context,
                web: true,
                label: '이메일 *',
                controller: qUtil.emailController,
                textInputType: TextInputType.emailAddress,
                hintText: '회신 받을 이메일을 남겨주세요.',
              ),
            ),
            SizedBox(height: 25),
            // QuestionWidgets.formFieldBox(
            //   context: context,
            //   web: true,
            //   label: label,
            //   controller: controller,
            //   textInputType: textInputType,
            //   hintText: hintText,
            // ),
          ],
        ),
      ],
    );
  }
}
