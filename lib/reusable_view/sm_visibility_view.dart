import 'package:flutter/cupertino.dart';

Widget smVisibilityView(Widget firstChild, bool hide,
    {Widget? secondChild, int duration = 200}) {
  return AnimatedCrossFade(
      firstChild: firstChild,
      secondChild: secondChild ?? const SizedBox(),
      //secondCurve: Curves.bounceInOut,
      // firstCurve: Curves.easeInOutCubic,
      // secondCurve: Curves.easeInOutCubic,
      crossFadeState:
          hide ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: duration));
}
