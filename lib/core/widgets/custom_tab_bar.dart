
import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:evently/features/home/tabs/home_tab/tab_item.dart';
import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, this.onCategoryItemClicked, required this.categories});
 final  void Function(CategoryModel)? onCategoryItemClicked;
final List<CategoryModel> categories;
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return    DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        padding: EdgeInsets.only(left: 16),
        tabAlignment: TabAlignment.start,
        onTap: (index){
          setState(() {
            selectedIndex = index;
            widget.onCategoryItemClicked?.call(widget.categories[selectedIndex]);
          });
        },
        isScrollable: true,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        tabs: widget.categories
            .map(
              (category) => TabItem(
            label: category.name,
            icon: category.iconData,
            selectedBgColor: ColorsManager.darkBlue,
            selectedFgColor: ColorsManager.white,
            unSelectedBgColor: ColorsManager.white,
            unSelectedFgColor: ColorsManager.black,
            isSelected: widget.categories.indexOf(category) == selectedIndex,
          ),
        )
            .toList(),
      ),
    );
  }
}
