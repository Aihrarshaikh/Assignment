import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../configs/app_strings.dart';
import '../../configs/app_theme.dart';
import '../../configs/asset_paths.dart';

class BonfireFooter extends StatelessWidget {
  const BonfireFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.pickOption,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.normalText),
                ),
                Text(
                  AppStrings.seeSimilar,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.normalText),
                ),
              ],
            ),
          ),
          // Mic Button
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                AssetPaths.micIcon,
                width: 48,
                height: 48,
              ),
            ),
          ),
          // Send Button
          SizedBox(width: 10,),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                AssetPaths.sendIcon,
                width: 48,
                height: 48,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
