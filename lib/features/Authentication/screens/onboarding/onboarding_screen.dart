import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylesage/commons/widgets/buttons/custom_button.dart';
import 'package:stylesage/commons/widgets/buttons/custom_outlined_button.dart';
import 'package:stylesage/features/Authentication/controllers/onboarding_controller.dart';
import 'package:stylesage/features/Authentication/screens/SignUp/singnup_screen.dart';
import 'package:stylesage/features/Authentication/screens/login/login_screen.dart';
import 'package:stylesage/features/Authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:stylesage/features/Authentication/screens/onboarding/widgets/onboarding_next.dart';
import 'package:stylesage/features/Authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:stylesage/features/Authentication/screens/onboarding/widgets/onboarding_previous.dart';
import 'package:stylesage/features/Authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:stylesage/utils/constants/colors.dart';
import 'package:stylesage/utils/constants/image_strings.dart';
import 'package:stylesage/utils/constants/sizes.dart';
import 'package:stylesage/utils/constants/text_strings.dart';
import 'package:stylesage/utils/device/device_utilities.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Container(
        color: SColors.bgOnboardingScreens,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(SSizes.md),
                child: Obx(
                  () => Stack(
                    children: [
                      //for sliding pages
                      PageView(
                        controller: controller.pageController,
                        onPageChanged: controller.updatePageIndicator,
                        children: [
                          OnboardingPage(
                            imageUrl: SImages.onboarding_1,
                            title: STextStrings.title_1,
                            subtitle: STextStrings.subtitle_1,
                          ),
                          OnboardingPage(
                            imageUrl: SImages.onboarding_2,
                            title: STextStrings.title_2,
                            subtitle: STextStrings.subtitle_2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: SDeviceUtils.getScreenHeight() * 0.1,
                            ),
                            child: OnboardingPage(
                              imageUrl: SImages.onboarding_3,
                              title: STextStrings.title_3,
                              subtitle: STextStrings.subtitle_3,
                              width: 0.6,
                              height: 0.4,
                            ),
                          ),
                        ],
                      ),
                      //things to be shown for 0th nd 1st page only
                      if (controller.currentPageIndex.value != 2) ...[
                        const OnboardingSkip(),
                        const OnboardingDotNavigation(),
                        const OnboardingNext(),
                        if (controller.currentPageIndex.value == 1)
                          const OnboardingPrevious(),
                      ],
                      //things to be shown on 2nd page only
                      if (controller.currentPageIndex.value == 2) ...[
                        Positioned(
                          left: 0,
                          bottom: SDeviceUtils.getScreenHeight() * 0.15,
                          child: CustomButton(
                            onPressedCallback: () {
                              Get.offAll(const SignUpScreen());
                            },
                            buttonText: "Sign Up",
                            textStyle: Theme.of(context).textTheme.titleLarge!,
                            width: 0.909,
                            height: 44,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: SDeviceUtils.getScreenHeight() * 0.08,
                          child: CustomOutlinedButton(
                            onPressedCallback: () {
                              Get.offAll(const LoginScreen());
                            },
                            buttonText: "Already with us? Login",
                            textStyle: Theme.of(context).textTheme.bodyMedium!,
                            width: 0.909,
                            height: 44,
                            gradient: SColors.MainOutlinedButtonGradient,
                          ),
                        ),
                      ],
                    ],
                  ),
                )),
          ),
        ));
  }
}
