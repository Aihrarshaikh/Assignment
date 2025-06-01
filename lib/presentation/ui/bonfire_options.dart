import 'package:flutter/material.dart';
import '../../configs/app_strings.dart';
import '../../configs/app_theme.dart';

class BonfireOptions extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  const BonfireOptions({super.key, required this.selectedIndex, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final options = [
      {'label': 'A', 'text': AppStrings.optionA},
      {'label': 'B', 'text': AppStrings.optionB},
      {'label': 'C', 'text': AppStrings.optionC},
      {'label': 'D', 'text': AppStrings.optionD},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: List.generate(options.length, (i) {
          final isSelected = selectedIndex == i;
          return GestureDetector(
            onTap: () => onSelect(i),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.42,
              height: 85,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.questionTile,
                borderRadius: BorderRadius.circular(16),
                border: isSelected ? Border.all(color: AppColors.highlight, width: 2) : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: isSelected ? AppColors.highlight : AppColors.questionTile,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? AppColors.highlight : Colors.white,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          options[i]['label']!,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      options[i]['text']!,
                      style: TextStyle(color: AppColors.normalText, fontSize: 15,fontWeight: FontWeight.w300),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
} 