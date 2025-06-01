import 'package:flutter/material.dart';
import '../../configs/asset_paths.dart';

class BonfireAvatars extends StatelessWidget {
  const BonfireAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(AssetPaths.avatar2),
            ),
          ),
          Positioned(
            left: 28,
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(AssetPaths.avatar3),
            ),
          ),
        ],
      ),
    );
  }
} 