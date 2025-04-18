import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/route_page.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/menu_util.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/text_util.dart';
import 'package:flutter_responsive_web/widgets/costom_text_button.dart';

class CompanySlogan extends StatelessWidget {
  const CompanySlogan({super.key, required this.web});

  final bool web;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("SLOGAN", style: TextUtil.get20(context, MyColor.gray40)),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Text(
              "매일매일 성장하며\n목표를 향해 나아갑니다.",
              style:
                  web
                      ? TextUtil.get32(context, Colors.black)
                      : TextUtil.get24(context, Colors.black),
            ),

            if (web) ...[
              const Spacer(),
              CustomTextButton(
                label: "프로젝트 상담 문의",
                textStyle: TextUtil.get18(context, Colors.white),
                size: Size(300, 60),
                backgroundColor: MyColor.blue30,
                onPressed: () {
                  MenuUtil.changeIndex(context, 3);
                },
              ),
            ],
          ],
        ),
        const SizedBox(height: 60),
        Image.asset(
          AssetPath.companyDevice,
          width: double.infinity,
          fit: BoxFit.fitWidth, // 세로는 자동 비율로 조정
        ),
        const SizedBox(height: 60),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("VISION", style: TextUtil.get20(context, MyColor.gray40)),
            const SizedBox(width: 35),

            if (web) ...[
              Text(
                "SPC팀은 동국시스템즈 소속입니다.\n당신의 꿈과 어쩌구저쩌구 \n당신의 꿈과 어쩌구저쩌구 \n당신의 꿈과 어쩌구저쩌구",
                style: TextUtil.get24(context, MyColor.gray90),
              ),
            ] else ...[
              Text(
                "SPC팀은 동국시스템즈 소속입니다.\n  당신의 꿈과 어쩌구저쩌구 \n당신의 꿈과 어쩌구저쩌구 당신의 꿈과 어쩌구저쩌구",
                style: TextUtil.get16(context, MyColor.gray90),
              ),
            ],
          ],
        ),
        const SizedBox(height: 50),
        if (!web) ...[
          CustomTextButton(
            label: "프로젝트 상담 문의",
            textStyle: TextUtil.get16(context, Colors.white),
            size: Size(double.infinity, 54),
            backgroundColor: MyColor.blue30,
            onPressed: () {
              MenuUtil.changeIndex(context, 3);
            },
          ),
        ],
      ],
    );
  }
}
