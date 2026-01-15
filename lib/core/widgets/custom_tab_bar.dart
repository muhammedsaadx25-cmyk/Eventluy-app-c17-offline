import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:evently/features/home/tabs/home_tab/tab_item.dart';
import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return    DefaultTabController(
      length: CategoryModel.categories.length,
      child: TabBar(
        padding: EdgeInsets.only(left: 16),
        tabAlignment: TabAlignment.start,
        onTap: (index){
          setState(() {
            selectedIndex = index;

          });
        },
        isScrollable: true,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        tabs: CategoryModel.categories
            .map(
              (category) => TabItem(
            label: category.name,
            icon: category.iconData,
            selectedBgColor: ColorsManager.darkBlue,
            selectedFgColor: ColorsManager.white,
            unSelectedBgColor: ColorsManager.white,
            unSelectedFgColor: ColorsManager.black,
            isSelected: CategoryModel.categories.indexOf(category) == selectedIndex,
          ),
        )
            .toList(),
      ),
    );
  }
}
