import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/screen/company/widgets/company_slogan.dart';
import 'package:flutter_responsive_web/util/screen_padding.dart';
import 'package:flutter_responsive_web/widgets/common_scaffold.dart';
import 'package:flutter_responsive_web/widgets/header.dart';
import 'package:flutter_responsive_web/widgets/screen_layout_builder.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(
      myBuilder: (screenModel, web, tablet, mobile) {
        var screenWidth = MediaQuery.of(context).size.width;
        return CommonScaffold(
          currentIndex: 0,
          screenModel: screenModel,
          horizontalPadding: ScreenPadding.get(web, screenWidth),
          children: [
            Header(
              title: "당신의 꿈과 가치가 현실이 되는 곳",
              subTitle: "동국시스템즈 SPC팀!",
              backgroundImage: "",
              screenModel: screenModel,
              titleColor: Colors.black,
              subTitleColor: Colors.black,
            ),
            CompanySlogan(web:web),
          ],
        );
      },
    );
  }
}
