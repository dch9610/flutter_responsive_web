import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/menu_util.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 20),
          InkWell(
            onTap: () {},
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
            return Text(MenuUtil.menuList[index]);
          }),

          const SizedBox(width:20),

        ],
      ),
    );
  }
}
