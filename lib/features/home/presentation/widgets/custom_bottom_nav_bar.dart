import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/domain/entities/bottom_nav_bar_entity.dart';
import 'package:fruits_hub_app/features/home/presentation/widgets/active_and_inactive_selected_icons.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.activeIndex,
    required this.onTap,
  });
  final int activeIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 12,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: BottomNavBarEntity.bottomNavBarItems(context)
            .asMap()
            .entries
            .map((e) {
              var index = e.key;
              var entity = e.value;
              return Expanded(
                flex: activeIndex == index ? 3 : 2,
                child: GestureDetector(
                  onTap: () => onTap(index),

                  child: NavBarItems(
                    bottomNavBarEntity: entity,
                    isSelected: activeIndex == index,
                  ),
                ),
              );
            })
            .toList(),
      ),
    );
  }
}
