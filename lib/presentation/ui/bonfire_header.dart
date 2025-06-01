import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../configs/app_strings.dart';
import '../../configs/app_theme.dart';
import '../../configs/asset_paths.dart';

class BonfireHeader extends StatelessWidget {
  const BonfireHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.bonfireTitle,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetPaths.timerIcon,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(AppColors.normalText, BlendMode.srcIn),
              ),
              const SizedBox(width: 4),
              Text(
                AppStrings.timerLabel,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.normalText,
                ),
              ),
              const SizedBox(width: 16),
              SvgPicture.asset(
                AssetPaths.userIcon,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(AppColors.normalText, BlendMode.srcIn),
              ),
              const SizedBox(width: 4),
              Text(
                AppStrings.participantsLabel,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.normalText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 