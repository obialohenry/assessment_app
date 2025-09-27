import 'package:assessment_app/src/components.dart';
import 'package:assessment_app/src/config.dart';
import 'package:assessment_app/src/screens.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        ///TODO:MIGHT NEED TO ADD A HEIGHT FOR SCREEN.
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.onboardingImage), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120,
                height: 32,
                padding: EdgeInsets.only(
                  top: AppSpacing.sm,
                  right: AppSpacing.sm,
                  bottom: AppSpacing.sm,
                  left: AppSpacing.md,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: AppColors.kWhite),
                ),
                child: Row(
                  children: [
                    TextView(text: "English (US)", textStyle: AppTextStyles.bodyNormal),
                    Gap(AppSpacing.xs),
                    Image.asset(
                      AppImages.dropDownIcon,
                      width: 16,
                      height: 16,
                      color: AppColors.kWhite,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: (MediaQuery.sizeOf(context).height * 0.46),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextView(
                      text: AppStrings.hdrConnectWithYourCommunity,
                      textStyle: AppTextStyles.display,
                    ),
                    Column(
                      children: [
                        AuthButton(
                          bgColor: AppColors.kRoyalViolet,
                          title: AppStrings.btnContinueWithApple,
                          icon: AppImages.appleIcon,
                        ),
                        Gap(AppSpacing.sm),
                        AuthButton(
                          bgColor: AppColors.kCrystalBlue,
                          title: AppStrings.btnContinueWithGoogle,
                          icon: AppImages.googleIcon,
                        ),
                        Gap(AppSpacing.sm),
                        AuthButton(
                          withBorder: true,
                          title: AppStrings.btnContinueWithEmail,
                          icon: AppImages.messageIcon,
                        ),
                      ],
                    ),
                    TextView(text: AppStrings.msgSignupInfo, textStyle: AppTextStyles.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  ///Creates a widget displayinga button with an Icon and a text.
  const AuthButton({
    super.key,
    required this.icon,
    required this.title,
    this.bgColor,
    this.withBorder = false,
  });
  final String icon;
  final String title;
  final Color? bgColor;
  final bool withBorder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, animation1) => const CommunityFeedScreen(),
          ),
        );
      },
      child: Container(
        width: 342,
        height: 48,
        padding: EdgeInsets.all(AppSpacing.smPlus),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: withBorder ? AppColors.kWhite : AppColors.kTransparent),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, width: 16, height: 16, color: AppColors.kWhite),
              Gap(AppSpacing.md),
              TextView(text: title, textStyle: AppTextStyles.bodyNormal),
            ],
          ),
        ),
      ),
    );
  }
}
