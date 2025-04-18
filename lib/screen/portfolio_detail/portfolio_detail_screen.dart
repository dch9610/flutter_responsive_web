import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/model/screen_model.dart';
import 'package:flutter_responsive_web/route_page.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/screen_padding.dart';
import 'package:flutter_responsive_web/util/text_util.dart';
import 'package:flutter_responsive_web/widgets/screen_layout_builder.dart';

class PortfolioDetailScreen extends StatefulWidget {
  const PortfolioDetailScreen({super.key});

  @override
  State<PortfolioDetailScreen> createState() => _PortfolioDetailScreenState();
}

class _PortfolioDetailScreenState extends State<PortfolioDetailScreen> {
  final pageController = PageController();
  int currentIndex = 0;

  // 위젯이 화면에서 사라질 때 호출되는 함수
  // Controller는 내부에 리소스를 가지고 있으므로 사용이 끝났을 때 꼭 dispose()로 정리
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Padding을 넣기 위함 (ScreenLayoutBuilder)
    return ScreenLayoutBuilder(
      myBuilder: (screenModel, web, tablet, mobile) {
        var screenWidth = MediaQuery.of(context).size.width;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenPadding.get(web, screenWidth),
          ),
          child: Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Text(
                        "상세 이미지",
                        style: TextUtil.get20(context, Colors.black),
                      ),
                      const Spacer(),

                      InkWell(
                        onTap: () {
                          print('Tapped!');
                          RoutePage.backPage(context);
                        },
                        customBorder: const CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Icon(Icons.close, size: 36),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: PageView(
                          controller: pageController,
                          onPageChanged: (value) {
                            currentIndex = value;
                            setState(() {});
                          },
                          children: [
                            Image.asset(AssetPath.detail1, fit: BoxFit.cover),
                            Image.asset(AssetPath.detail2, fit: BoxFit.cover),
                          ],
                        ),
                      ),

                      if (currentIndex != 0) ...[
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .center, // center를 주지않으면 왼쪽 클릭만 해도 onTap 실행
                            children: [
                              InkWell(
                                onTap: () {
                                  currentIndex--;
                                  pageController.animateToPage(
                                    currentIndex,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                  );
                                  print("left click");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_left_rounded,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      
                      if (currentIndex != 1) ...[
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .center, // center를 주지않으면 왼쪽 클릭만 해도 onTap 실행
                            children: [
                              InkWell(
                                onTap: () {
                                  currentIndex++;
                                  pageController.animateToPage(
                                    currentIndex,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                  );
                                  print("right click");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
