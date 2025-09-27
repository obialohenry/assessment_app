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
              SelectLanguageButton(),
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

class SelectLanguageButton extends StatelessWidget {
  ///Creates a widget displaying user's selected app language.
  ///
  /// When tapped, it opens a bottom sheet dialog (`SelectLanguageBottomSheetWidget`)
  /// allowing the user to change their preferred locale.
  const SelectLanguageButton({super.key});

  Future<void> selectLanguageBottomSheet(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, animation1) {
        return Align(alignment: Alignment.bottomCenter, child: SelectLanguageBottomSheetWidget());
      },
      transitionBuilder: (context, animation, animation1, child) {
        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOut);
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectLanguageBottomSheet(context);
      },
      child: Container(
        width: 120,
        height: 32,
        padding: EdgeInsets.only(
          top: AppSpacing.sm,
          right: AppSpacing.sm,
          bottom: AppSpacing.sm,
          left: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: AppColors.kWhite),
        ),
        child: Row(
          children: [
            TextView(text: "English (US)", textStyle: AppTextStyles.bodyNormal),
            Gap(AppSpacing.xs),
            Image.asset(AppImages.dropDownIcon, width: 16, height: 16, color: AppColors.kWhite),
          ],
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
          borderRadius: BorderRadius.circular(AppRadius.md),
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

class SelectLanguageBottomSheetWidget extends StatefulWidget {
  ///Creates a widget displaying a list of locale languages to select from.
  const SelectLanguageBottomSheetWidget({super.key});

  @override
  State<SelectLanguageBottomSheetWidget> createState() => _SelectLanguageBottomSheetWidgetState();
}

class _SelectLanguageBottomSheetWidgetState extends State<SelectLanguageBottomSheetWidget> {
  final List<String> _localeLanguages = [
    "English",
    "Español",
    "Français",
    "German",
    "Chinese",
    "Japanese",
    "Korea",
  ];
  String _preferredLang = "English";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppRadius.lg),
          topRight: Radius.circular(AppRadius.lg),
        ),
        color: AppColors.kWhite,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.kViolet10,
              ),
            ),
            Gap(AppSpacing.lg),
            Padding(
              padding: EdgeInsetsGeometry.all(AppSpacing.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    text: AppStrings.lblSelectPreferredLanguage,
                    textStyle: AppTextStyles.medium.copyWith(color: AppColors.kIndigoViolet),
                  ),
                  Image.asset(AppImages.closeIcon, width: 24, height: 24),
                ],
              ),
            ),
            Gap(AppSpacing.lg),
            Container(height: 1, width: double.infinity, color: AppColors.kViolet10),
            Gap(AppSpacing.lg),
            ..._localeLanguages.map(
              (language) => LanguageType(
                preferredLang: _preferredLang,
                lang: language,
                onTap: () {
                  _preferredLang = language;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageType extends StatelessWidget {
  ///Creates a widget displaying a selectable locale language.
  const LanguageType({
    super.key,
    required this.onTap,
    required this.lang,
    required this.preferredLang,
  });

  final VoidCallback onTap;
  final String preferredLang;
  final String lang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSpacing.lg,
        left: AppSpacing.lg,
        right: AppSpacing.lg,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: lang,
              textStyle: AppTextStyles.bodyNormal.copyWith(color: AppColors.kIndigoViolet),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.kIndigoViolet),
              ),
              child: preferredLang == lang
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kIndigoViolet,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
