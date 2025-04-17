import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/model/screen_model.dart';
import 'package:flutter_responsive_web/util/text_util.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    required this.subTitle,
    required this.backgroundImage,
    required this.screenModel,
    this.titleColor = Colors.white,
    this.subTitleColor = Colors.white,
  });

  final String title;
  final String subTitle;
  final String backgroundImage;
  final ScreenModel screenModel;

  final Color titleColor;
  final Color subTitleColor;

  @override
  Widget build(BuildContext context) {
    var height = setHeight();
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height,
      child: OverflowBox(
        maxHeight: height,
        maxWidth: width,
        child: Container(
          width: width,
          height: height,
          // width: double.infinity,
          // height: setHeight(),
          decoration:
              backgroundImage.isEmpty
                  ? null
                  : BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(backgroundImage).image,
                      fit: BoxFit.cover,
                    ),
                  ),
          child: Column(
            children: [
              SizedBox(height: topPadding()),
              if (title.isNotEmpty) ...[
                Text(
                  title,
                  style: TextUtil.get20(context, titleColor).copyWith(
                    fontWeight: titleFontWeight(),
                    fontSize: titleFontSize(),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],

              if (subTitle.isNotEmpty) ...[
                SizedBox(height: 14),
                Text(
                  subTitle,
                  style: TextUtil.get20(context, subTitleColor).copyWith(
                    fontWeight: subTitleFontWeight(),
                    fontSize: subTitleFontSize(),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  topPadding() {
    if (screenModel.web) return 170;
    if (screenModel.tablet) return 100;
    return 75;
  }

  setHeight() {
    if (screenModel.web) return 408;
    if (screenModel.tablet) return 248;
    return 206;
  }

  FontWeight titleFontWeight() {
    if (screenModel.web) return FontWeight.bold;
    if (screenModel.tablet) return FontWeight.w600;
    return FontWeight.w500;
  }

  double titleFontSize() {
    if (screenModel.web) return 32;
    if (screenModel.tablet) return 24;
    return 20;
  }

  FontWeight subTitleFontWeight() {
    if (screenModel.web) return FontWeight.w600;
    if (screenModel.tablet) return FontWeight.w500;
    return FontWeight.w400;
  }

  double subTitleFontSize() {
    if (screenModel.web) return 18;
    if (screenModel.tablet) return 15;
    return 13;
  }
}
