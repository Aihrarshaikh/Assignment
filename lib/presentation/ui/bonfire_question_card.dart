import 'package:flutter/material.dart';
import '../../configs/app_strings.dart';
import '../../configs/asset_paths.dart';
import '../../configs/app_theme.dart';

class BonfireQuestionCard extends StatelessWidget {
  const BonfireQuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double avatarLeft = MediaQuery.of(context).size.width * 0.1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: avatarLeft),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerLeft,
                children: [
                  // Name & Age Tag
                  Positioned(
                    top: 10,
                    left: 52,
                    child: Container(
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      decoration: BoxDecoration(
                        color: const Color(0xE5121518),
                        borderRadius: const BorderRadius.horizontal(right: Radius.circular(24),left:Radius.circular(24) ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.18),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.userNameAge,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.boldText,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                  // Avatar with border
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF0D0F11),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.18),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(AssetPaths.avatar1),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Text(
                      AppStrings.question,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.boldText),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '"${AppStrings.userAnswer}"',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.heading,
              fontStyle: FontStyle.italic,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
} 