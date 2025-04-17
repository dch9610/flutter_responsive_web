import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/route_page.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/screen_padding.dart';
import 'package:flutter_responsive_web/widgets/common_scaffold.dart';
import 'package:flutter_responsive_web/widgets/header.dart';
import 'package:flutter_responsive_web/widgets/screen_layout_builder.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  List<String> imageList = [
    AssetPath.bird,
    AssetPath.butterfly,
    AssetPath.flutter,
    AssetPath.office,
    AssetPath.office_2,
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(
      myBuilder: (screenModel, web, tablet, mobile) {
        var screenWidth = MediaQuery.of(context).size.width;
        return CommonScaffold(
          currentIndex: 1,
          screenModel: screenModel,
          horizontalPadding: ScreenPadding.get(web, screenWidth),
          children: [
            Header(
              title: '포트폴리오',
              subTitle: "모바일, 웹, 어드민 뿐만 아니라\n환경을 제안",
              backgroundImage: "",
              screenModel: screenModel,
              titleColor: Colors.black,
              subTitleColor: Colors.black,
            ),

            // Header 부분에 그림자 표시
            // OverflowBox, SizedBox 하는 이유는 Padding 부분까지 boxShadow를 표시하기 위함
            SizedBox(
              width: screenWidth,
              height: 1,
              child: OverflowBox(
                maxWidth: screenWidth,
                child: Container(
                  width: screenWidth,
                  height: 1,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: MyColor.gray20,
                        blurRadius: 7,
                        spreadRadius: 3,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            GridView.count(
              physics:
                  const NeverScrollableScrollPhysics(), // GridView Scroll 비활성화
              crossAxisCount: web ? 2 : 1,
              shrinkWrap: true,
              childAspectRatio: 1, // 가로,세로 비율 변경
              // 이미지 클릭 시 Detail Page로 이동
              children: List.generate(imageList.length, (index) {
                return InkWell(
                  onTap: () {
                    RoutePage.movePage(context, RoutePage.portfolioDetail);
                  },
                  child: Image.asset(imageList[index], fit: BoxFit.cover),
                );
              }),
            ),
            SizedBox(height: 150),
          ],
        );
      },
    );
  }
}
