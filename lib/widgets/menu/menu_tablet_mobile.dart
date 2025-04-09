import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/menu_util.dart';

class MenuTabletMobile extends StatelessWidget {
  const MenuTabletMobile({
    super.key,
    required this.currentIndex,
    required this.tablet,
  });
  final int currentIndex;
  final bool tablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: tablet ? 60 : 54,
      color: Colors.white,
      padding: EdgeInsets.only(left: tablet ? 20 : 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              MenuUtil.changeIndex(context, currentIndex);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Image.asset(
              AssetPath.menuLogo,
              width: tablet ? 180 : 120,
              height: 50,
              fit: BoxFit.fitWidth,
            ),
          ),

          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(tablet ? 20 : 16),
              child: Image.asset(AssetPath.hamburger, width: 20, height: 20),
            ),
          ),
        ],
      ),
    );
  }
}
