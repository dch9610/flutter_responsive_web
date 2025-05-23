import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/menu_util.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/text_util.dart';
import 'package:flutter_responsive_web/widgets/costom_text_button.dart';

class PageDrawer extends StatelessWidget {
  const PageDrawer({
    super.key,
    required this.currentIndex,
    required this.tablet,
  });

  final int currentIndex;
  final bool tablet;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: tablet ? 280 : 230,
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Scaffold.of(context).closeEndDrawer();
              },
              customBorder: CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Icon(Icons.close, size: 20),
              ),
            ),
          ),
          ...List.generate(MenuUtil.menuList.length, (index) {
            var selected = TextUtil.get16(
              context,
              Colors.black,
            ).copyWith(fontWeight: FontWeight.bold);
            var unSelected = TextUtil.get16(context, MyColor.gray40);

            return CustomTextButton(
              label: MenuUtil.menuList[index],
              textStyle: currentIndex == index ? selected : unSelected,
              size: Size(double.infinity, 50),
              onPressed: () {
                Scaffold.of(context).closeEndDrawer();
                Future.delayed(const Duration(milliseconds: 200), () {
                  if (!context.mounted) return; // context 유효성 체크
                  MenuUtil.changeIndex(context, index);
                });
              },
            );
          }),
        ],
      ),
    );
  }
}
