import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/text_util.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.labelList,
    required this.height,
    required this.web,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<String> labelList;
  final double height;
  final bool web;
  final int selectedIndex;
  final Function(int index) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: DropdownButton<int>(
              autofocus: false,
              elevation: 12,
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemHeight: height,
              dropdownColor: Colors.white,
              underline: const SizedBox(), // 드롭박스 밑줄 제거
              icon: Visibility(visible: false, child: Icon(Icons.add)),
              style:
                  web
                      ? TextUtil.get16(context, MyColor.gray90)
                      : TextUtil.get15(context, MyColor.gray90),
              value: selectedIndex,
              items: List.generate(labelList.length, (index) {
                return DropdownMenuItem(
                  value: index,
                  child: Text(labelList[index]),
                );
              }),
              onChanged: (value) {
                onChanged(value!);
              },
            ),
          ),

          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 24,
              color: MyColor.gray40,
            ),
          ),
        ],
      ),
    );
  }
}
