import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/screen/recruit/widgets/recruit_card.dart';
import 'package:flutter_responsive_web/screen/recruit/widgets/recruit_subtitle.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/screen_padding.dart';
import 'package:flutter_responsive_web/widgets/common_scaffold.dart';
import 'package:flutter_responsive_web/widgets/header.dart';
import 'package:flutter_responsive_web/widgets/screen_layout_builder.dart';

class RecruitScreen extends StatefulWidget {
  const RecruitScreen({super.key});

  @override
  State<RecruitScreen> createState() => _RecruitScreenState();
}

class _RecruitScreenState extends State<RecruitScreen> {
  final server = RecruitCard(
    title: "서버 개발자",
    responseibility: "신규 프로젝트 참여, 기존 프로젝트 유지보수",
    requirement:
        "주도적인 개발이 가능한 사람 \n"
        "Git 사용 경험 \n"
        "Spring boot 사용 경험 \n"
        "AWS 사용 경험 \n"
        "스타트업 근무 경험 \n"
        "프로젝트 초기부터 배포까지 참여한 경험 \n",
    preference: [
      "커뮤니케이션 능력",
      "긍정적인 마인드",
      "발전적인 습관",
      "다양한 서버 Framework 경험",
      "FrontEnd 개발 경험",
    ],
  );

  final front = RecruitCard(
    title: "프론트 개발자",
    responseibility: "신규 프로젝트 참여, 기존 프로젝트 유지보수",
    requirement:
        "주도적인 개발이 가능한 사람 \n"
        "Git 사용 경험 \n"
        "스타트업 근무 경험 \n"
        "프로젝트 초기부터 배포까지 참여한 경험 \n",
    preference: [
      "커뮤니케이션 능력",
      "긍정적인 마인드",
      "발전적인 습관",
      "다양한 서버 Framework 경험",
      "FrontEnd 개발 경험",
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(
      myBuilder: (screenModel, web, tablet, mobile) {
        final screenWidth = MediaQuery.of(context).size.width;
        return CommonScaffold(
          currentIndex: 2,
          screenModel: screenModel,
          black: true,
          horizontalPadding: ScreenPadding.get(web, screenWidth),
          children: [
            Header(
              title: "LLM을 활용한\n 실전 AI 애플리케이션 개발",
              subTitle: '',
              titleColor: Colors.black,
              backgroundImage: AssetPath.recruitHeaderImage,
              screenModel: screenModel,
            ),
            RecruitSubtitle(screenModel: screenModel),
            const SizedBox(height: 48),
            if (web) ...[
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: server),
                    const SizedBox(width: 20),
                    Expanded(child: front),
                  ],
                ),
              ),
            ] else ...[
              server,
              const SizedBox(height: 16),
              front,
            ],

            const SizedBox(height: 100),
          ],
        );
        // return Scaffold(
        //   endDrawer: PageDrawer(currentIndex: 2, tablet: tablet),
        //   body: Column(
        //     children: [Menu(currentIndex: 2, screenModel: screenModel)],
        //   ),
        // );
      },
    );
  }
}
