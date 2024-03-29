import 'package:flutter/widgets.dart';

import '../themes/app_colors.dart';

extension WidgetModifier on Widget {
  Widget paddingAll([double value = 24]) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingHorizontal([double value = 20]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Widget paddingVertical([double value = 12]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Widget paddingSymmetric({double vertical = 12, double horizontal = 24}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      child: this,
    );
  }

  Widget paddingOnly({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        right: right,
        bottom: bottom,
        left: left,
      ),
      child: this,
    );
  }

  Widget expandedHorizontally() {
    return Row(
      children: [
        Expanded(child: this),
      ],
    );
  }

  Widget withPrimaryGradient() {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) =>
          AppColors.primaryGradient.createShader(bounds),
      child: this,
    );
  }
}
