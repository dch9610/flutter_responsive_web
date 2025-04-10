import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/model/screen_model.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/menu_util.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/text_util.dart';
import 'package:flutter_responsive_web/widgets/costom_text_button.dart';
import 'package:flutter_responsive_web/widgets/menu/menu_tablet_mobile.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.currentIndex,
    required this.screenModel, 
    this.black = true,
  });
  final int currentIndex;
  final ScreenModel screenModel;
  final bool black;

  @override
  Widget build(BuildContext context) {
    if (screenModel.tablet || screenModel.mobile) {
      return MenuTabletMobile(
        currentIndex: currentIndex,
        tablet: screenModel.tablet,
      );
    }

    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 20),
          InkWell(
            onTap: () {
              MenuUtil.changeIndex(context, 0);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Image.asset(
              AssetPath.menuLogo,
              width: 200,
              height: 80,
              fit: BoxFit.fitWidth,
            ),
          ),

          const Spacer(),

          ...List.generate(MenuUtil.menuList.length, (index) {
            return CustomTextButton(
              label: MenuUtil.menuList[index],
              textStyle:
                  currentIndex == index
                      ? TextUtil.get16(
                        context,
                        black ? MyColor.gray90 : Colors.white,
                      ).copyWith(fontWeight: FontWeight.bold)
                      : TextUtil.get15(context, black ? MyColor.gray90 : Colors.white,).copyWith(fontWeight: FontWeight.w400),
              size: Size(100, 40),
              onPressed: () {
                MenuUtil.changeIndex(context, index);
              },
            );
          }),

          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
