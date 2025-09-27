import 'package:assessment_app/src/components.dart';
import 'package:assessment_app/src/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommunityFeedScreen extends StatefulWidget {
  const CommunityFeedScreen({super.key});

  @override
  State<CommunityFeedScreen> createState() => _CommunityFeedScreenState();
}

class _CommunityFeedScreenState extends State<CommunityFeedScreen> {
  final List<String> _membersImages = [
    AppImages.memberImage,
    AppImages.profileImage,
    AppImages.memberImage,
    AppImages.profileImage,
  ];
  final List<String> _feedTab = [AppStrings.lblFeed, AppStrings.lblMedia, AppStrings.lblEvents];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kWhite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ///[]
            Container(
              padding: EdgeInsets.all(AppSpacing.lg),
              height: MediaQuery.sizeOf(context).height * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.feedImage), fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(AppImages.pupUpMenuIcon, width: 24, height: 24),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            TextView(text: "Ekwale People", textStyle: AppTextStyles.bodyLarge),
                            Gap(AppSpacing.xs),
                            Image.asset(AppImages.verifiedIcon, width: 24, height: 24),
                          ],
                        ),
                        Gap(AppSpacing.md),
                        Row(
                          children: [
                            Image.asset(AppImages.flagIcon, width: 16, height: 16),
                            Gap(AppSpacing.sm),
                            TextView(text: "Nigerian", textStyle: AppTextStyles.bodyNormal),
                            Gap(AppSpacing.sm),
                            Container(
                              width: 3,
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.kWhite,
                              ),
                            ),
                            Gap(AppSpacing.sm),
                            Image.asset(AppImages.usersIcon, width: 16, height: 16),
                            Gap(AppSpacing.sm),
                            TextView(
                              text: AppStrings.lblLocal,
                              textStyle: AppTextStyles.bodyNormal,
                            ),
                          ],
                        ),
                        Gap(AppSpacing.md),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Members(image: AppImages.profileImage),
                                      for (int i = 1; i <= _membersImages.length; i++)
                                        Positioned(
                                          left: (14 * i).toDouble(),
                                          child: Members(image: _membersImages[i - 1]),
                                        ),
                                    ],
                                  ),
                                ),
                                Gap(AppSpacing.sm),
                                TextView(text: "170 members", textStyle: AppTextStyles.bodyNormal),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(AppImages.addUserIcon, width: 16, height: 16),
                                Gap(AppSpacing.md),
                                Image.asset(AppImages.infoIcon, width: 16, height: 16),
                                Gap(AppSpacing.md),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: AppColors.kRoyalViolet,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      AppImages.settingsIcon,
                                      width: 16,
                                      height: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Gap(AppSpacing.sm),
          ///[Tab]
          ],
        ),
      ),
    );
  }
}

class Members extends StatelessWidget {
  ///Creates a widget displaying the profile image of a memeber.
  const Members({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
