import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final double width; //must be in percent 0-0 - 0.5 - 1.0
  final double height; //in px
  final Gradient gradient;
  final VoidCallback onPressedCallback;
  final TextStyle textStyle;

  const CustomOutlinedButton(
      {super.key, required this.buttonText,
      required this.height,
      required this.width,
      required this.gradient,
      required this.textStyle,
      required this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedCallback,
      child: Container(
        height: height,
        width: SDeviceUtils.getScreenWidth() * width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SSizes.radiusLarge),
            color: Colors.white,
            border: Border.all(color: SColors.primary, width: 2),
            gradient: gradient),
        child: Center(
            child: Text(buttonText, style: textStyle
                //Theme.of(context).textTheme.headlineMedium,
                )),
      ),
    );
  }
}
