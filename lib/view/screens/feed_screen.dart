import 'package:assessment_app/src/components.dart';
import 'package:assessment_app/src/config.dart';
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
  int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kWhite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ///[]
            CommunitySummary(membersImages: _membersImages),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.75,
              child: Column(
                children: [
                  ///[Tabs]
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TabWidget(label: AppStrings.lblFeed, currentTab: _currentTab, page: 0),
                        TabWidget(label: AppStrings.lblMedia, currentTab: _currentTab, page: 1),
                        TabWidget(label: AppStrings.lblEvents, currentTab: _currentTab, page: 2),
                      ],
                    ),
                  ),

                  ///[TabView].
                  Expanded(
                    child: PageView(
                      onPageChanged: (value) {
                        _currentTab = value;
                        setState(() {});
                      },
                      children: [
                        ///[Feed View]
                        Column(
                          children: [
                            DividerWidget(height: 2, color: AppColors.kViolet10),
                            Gap(AppSpacing.lg),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      AProfileImage(),
                                      Gap(AppSpacing.sm),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              TextView(
                                                text: "Anthony",
                                                textStyle: AppTextStyles.bodyNormal.copyWith(
                                                  color: AppColors.kIndigoViolet,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Gap(AppSpacing.xs),
                                              Image.asset(
                                                AppImages.verifiedIcon,
                                                width: 12,
                                                height: 12,
                                              ),
                                              Gap(AppSpacing.sm),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                    AppSpacing.sm,
                                                  ),
                                                  color: AppColors.kViolet10,
                                                ),
                                                child: Center(
                                                  child: TextView(
                                                    text: AppStrings.lblAdmin,
                                                    textStyle: AppTextStyles.small,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Gap(AppSpacing.xs),
                                          TextView(
                                            text: "Just now",
                                            textStyle: AppTextStyles.large,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Image.asset(AppImages.moreIcon, width: 24, height: 24),
                                ],
                              ),
                            ),
                            Gap(AppSpacing.lg),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                              child: Column(
                                children: [
                                  TextView(
                                    text:
                                        "Congratulations to @Adekoya for the new whip. "
                                        "Who's available for a quick spin around the city in my Benzo!!",
                                    maxLines: 3,
                                    textStyle: AppTextStyles.bodyNormal.copyWith(
                                      color: AppColors.kIndigoViolet,
                                    ),
                                  ),
                                  Gap(AppSpacing.sm),
                                  Container(
                                    height: 200,
                                    padding: EdgeInsets.all(AppSpacing.sm),
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.carImage),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 21,
                                          width: 33,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: AppColors.kBlack40,
                                          ),
                                          child: Center(
                                            child: TextView(
                                              text: "0:59",
                                              textStyle: AppTextStyles.bodySmall,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 21,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: AppColors.kBlack40,
                                          ),
                                          child: Image.asset(
                                            AppImages.muteIcon,
                                            width: 16,
                                            height: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(AppSpacing.lg),
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(horizontal: AppSpacing.lg),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      FeedActionButton(
                                        logo: AppImages.likeIcon,
                                        title: AppStrings.lblLike,
                                      ),
                                      Gap(AppSpacing.xl),
                                      FeedActionButton(
                                        logo: AppImages.commentIcon,
                                        title: AppStrings.lblComment,
                                      ),
                                    ],
                                  ),
                                  FeedActionButton(
                                    logo: AppImages.sendCommentIcon,
                                    title: AppStrings.lblShare,
                                  ),
                                ],
                              ),
                            ),
                            Gap(AppSpacing.lg),
                            DividerWidget(height: 2, color: AppColors.kViolet10),
                            Gap(AppSpacing.lg),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AProfileImage(),
                                  Container(
                                    height: 40,
                                    width: 262,
                                    padding: EdgeInsets.only(
                                      top: AppSpacing.md,
                                      bottom: AppSpacing.md,
                                      left: 5,
                                      right: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(AppRadius.md),
                                      border: Border.all(color: AppColors.kIndigoTint),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AppImages.hintSuffixIcon,
                                          width: 32,
                                          height: 32,
                                        ),
                                        Gap(AppSpacing.xs),
                                        TextView(
                                          text: AppStrings.hintWriteSomething,
                                          textStyle: AppTextStyles.regular,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.kIndigoTint,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        AppImages.sendCommentIcon,
                                        color: AppColors.kWhite,
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(AppSpacing.lg),
                            DividerWidget(height: 2, color: AppColors.kViolet10),
                          ],
                        ),

                        ///[Media View],
                        Center(
                          child: TextView(
                            text: "Coming Soon.",
                            textStyle: AppTextStyles.display.copyWith(
                              color: AppColors.kIndigoViolet,
                            ),
                          ),
                        ),

                        ///[Events View]
                        Center(
                          child: TextView(
                            text: "Coming Soon.",
                            textStyle: AppTextStyles.display.copyWith(
                              color: AppColors.kIndigoViolet,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunitySummary extends StatelessWidget {
  ///Creates a widget showing a summary of the community.
  const CommunitySummary({super.key, required List<String> membersImages})
    : _membersImages = membersImages;

  final List<String> _membersImages;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    TextView(text: AppStrings.lblLocal, textStyle: AppTextStyles.bodyNormal),
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
                            child: Image.asset(AppImages.settingsIcon, width: 16, height: 16),
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
    );
  }
}

class AProfileImage extends StatelessWidget {
  ///Creates a widget displaying a user's profile picture.
  const AProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(AppImages.profileImage, width: 40, height: 40, fit: BoxFit.cover),
    );
  }
}

class FeedActionButton extends StatelessWidget {
  ///Creates a widget displaying an image and a label for performing feed actions.
  const FeedActionButton({super.key, required this.logo, required this.title});
  final String logo;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(logo, width: 16, height: 16),
        Gap(AppSpacing.sm),
        TextView(
          text: title,
          textStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.kIndigoViolet),
        ),
      ],
    );
  }
}

class TabWidget extends StatelessWidget {
  ///Creates a widget displaying a tab label.
  const TabWidget({super.key, required this.currentTab, required this.label, required this.page});
  final int page;
  final int currentTab;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextView(
          text: label,
          textStyle: AppTextStyles.bodyNormal.copyWith(
            fontWeight: FontWeight.w500,
            color: currentTab == page ? AppColors.kIndigoViolet : AppColors.kSoftLilac,
          ),
        ),
        currentTab == page
            ? Row(
                children: [
                  Gap(AppSpacing.xs),
                  Image.asset(
                    AppImages.dropDownIcon,
                    width: 16,
                    height: 16,
                    color: AppColors.kIndigoViolet,
                  ),
                ],
              )
            : SizedBox.shrink(),
      ],
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
