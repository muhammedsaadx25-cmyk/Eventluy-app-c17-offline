import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_mnaager.dart';
import 'package:evently/features/home/tabs/favourite_tab/favourite_tab.dart';
import 'package:evently/features/home/tabs/home_tab/home_tab.dart';
import 'package:evently/features/home/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    HomeTab(), FavouriteTab(),
    ProfileTab(),

  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: _buildFab(),
      body: tabs[currentIndex],
      bottomNavigationBar:_buildBottomNsvBar()
    );
  }

  Widget _buildBottomNsvBar(){
    return BottomNavigationBar(

      currentIndex: currentIndex,
      onTap: _onTap,
      items: [
        BottomNavigationBarItem(
            activeIcon:  SvgPicture.asset(SvgAssets.selectedHomeIcon),
            icon: SvgPicture.asset(SvgAssets.unSelectedHomeIcon), label: "Home"),
        BottomNavigationBarItem(
            activeIcon:  SvgPicture.asset(SvgAssets.selectedFavIcon),
            icon: SvgPicture.asset(SvgAssets.unSelectedFavIcon), label: "Home"),
        BottomNavigationBarItem(
            activeIcon:  SvgPicture.asset(SvgAssets.selectedProfileIcon),
            icon: SvgPicture.asset(SvgAssets.unSelectedProfileIcon), label: "Home"),

      ],
    );
  }
Widget _buildFab(){
    return  FloatingActionButton(

      onPressed: (){}, child: Icon(Icons.add),);
}

  void _onTap(int index){
    if(currentIndex == index )return ;
    setState(() {
      currentIndex = index;
    });

  }
}
