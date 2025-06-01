import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../configs/app_strings.dart';
import '../../../configs/app_theme.dart';
import '../../../configs/asset_paths.dart';

class BottomNavigationAppBar extends StatelessWidget {
  const BottomNavigationAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.questionTile.withOpacity(0.95),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            AssetPaths.navCard,
            width: 44,
            height: 44,
          ),
          SvgPicture.asset(
            AssetPaths.navFire,
            width:  44,
            height:  44,
          ),
          Stack(
            children: [
              SvgPicture.asset(
                AssetPaths.navChat,
                width:  44,
                height:  44,
              ),
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.highlight,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    AppStrings.navChatBadge,
                    style: TextStyle(color: AppColors.boldText, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            AssetPaths.navProfile,
            width:  44,
            height:  44,
          ),
        ],
      ),
    );
  }
} 