import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/asset_path.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/text_util.dart';

class RecruitCard extends StatelessWidget {
  const RecruitCard({
    super.key,
    required this.title,
    required this.responseibility,
    required this.requirement,
    required this.preference,
  });

  final String title;
  final String responseibility;
  final String requirement;
  final List<String> preference;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: MyColor.gray10, blurRadius: 10, spreadRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AssetPath.tagImage, width: 56, height: 56),
          Text(title, style: TextUtil.get24(context, MyColor.gray90)),
          const SizedBox(height: 48),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item(context, "담당업무"),
              const SizedBox(width: 16),

              Expanded(
                child: Text(
                  responseibility,
                  style: TextUtil.get14(context, MyColor.gray80),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item(context, "자격요건"),
              const SizedBox(width: 16),

              Expanded(
                child: Text(
                  requirement,
                  style: TextUtil.get14(context, MyColor.gray80),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item(context, "우대사항"),
              const SizedBox(width: 16),
              Expanded(
                child: Wrap(
                  spacing: 4,
                  runSpacing: 8,
                  children: List.generate(preference.length, (index) {
                    return preferenceChip(context, preference[index]);
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget item(BuildContext context, String label) {
    return Text(label, style: TextUtil.get14(context, MyColor.gray40));
  }

  Widget preferenceChip(BuildContext context, String label) {
    return Chip(
      label: Text(label, style: TextUtil.get14(context, MyColor.gray80)),
      backgroundColor: MyColor.gray10,
      padding: EdgeInsets.zero,
      side: null,
      // 긴쪽을 라운딩 처리리
      shape: StadiumBorder(side: BorderSide(color: Colors.transparent)),
    );
  }
}
