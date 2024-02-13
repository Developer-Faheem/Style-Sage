import 'package:flutter/material.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final double width; //must be in percent 0-0 - 0.5 - 1.0
  final double height; //in px
  final TextStyle textStyle;
  final VoidCallback onPressedCallback;

  CustomButton(
      {required this.buttonText,
      required this.height,
      required this.width,
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
          boxShadow: [
            BoxShadow(
              color: SColors.primary.withOpacity(0.27),
              spreadRadius: 4,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(SSizes.radiusLarge),
          color: SColors.primary,
        ),
        child: Center(
          child: Text(buttonText, style: textStyle
              //Theme.of(context).textTheme.titleLarge,
              ),
        ),
      ),
    );
  }
}
