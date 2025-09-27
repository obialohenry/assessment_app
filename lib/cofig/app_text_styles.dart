import 'package:assessment_app/src/config.dart';
import 'package:flutter/widgets.dart';

///Creates a class to manage textstyle constants in app.
class AppTextStyles {
  static const display = TextStyle(
    fontFamily: AppStrings.aeonik,
    fontWeight: FontWeight.w700,
    fontSize: 32,
    letterSpacing: 32 * (-1/100),
    height: (102/100),
    fontStyle: FontStyle.normal,
    color: AppColors.kWhite,
  );

  static const bodyLarge = TextStyle(
    fontFamily: AppStrings.aeonik,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    letterSpacing: 0,
    height: (24/22),
    fontStyle: FontStyle.normal,
    color: AppColors.kWhite,
  );

  static const bodyNormal = TextStyle(
    fontFamily: AppStrings.aeonik,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: (18/15),
    color: AppColors.kWhite,
    letterSpacing: 0,fontStyle: FontStyle.normal,
  );

  static const bodySmall = TextStyle(
    fontFamily: AppStrings.aeonik,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: (140/100),
    color: AppColors.kWhite,
    letterSpacing: 0,fontStyle: FontStyle.normal,
  );

   static const large = TextStyle(
    fontFamily: AppStrings.aeonik,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: (12/11),
    color: AppColors.kRoyalViolet,
    letterSpacing: 0,fontStyle: FontStyle.normal,
  );

  static const medium = TextStyle(
    fontFamily: AppStrings.aeonik,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: (18/15),
    color: AppColors.kRoyalViolet,
    letterSpacing: 0,fontStyle: FontStyle.normal,
  );

   static const small = TextStyle(
    fontFamily: AppStrings.aeonik,
    fontWeight: FontWeight.w400,
    fontSize: 8,
    height: (10/8),
    color: AppColors.kRoyalViolet,
    letterSpacing: 0,fontStyle: FontStyle.normal,
  );
}
