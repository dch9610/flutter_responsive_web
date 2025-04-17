import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

class RoutePage {
  static const company = "/";
  static const portfolio = "/portfolio";
  static const portfolioDetail = "/portfolio_detail";
  static const recruit = "/recruit";
  static const question = "/question";

  static movePage(BuildContext context, String routeName){
    context.beamToNamed(routeName);
  }

  static backPage(BuildContext context){
    context.beamBack();
  }
}