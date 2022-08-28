import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/routes/app_routes.dart';
import 'package:ripple_car_frontend/app/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.isBack = true,
    this.isHome = false,
  }) : super(key: key);

  final String title;
  final bool isBack;
  final bool isHome;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isBack
          ? IconButton(
              onPressed: Get.back<dynamic>,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            )
          : null,
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      centerTitle: !isHome,
      actions: [
        if (isHome)
          IconButton(
            onPressed: () => Get.toNamed<dynamic>(AppRoutes.home),
            icon: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcATop,
              ),
              child: Image.asset(
                homeIcon,
                height: 24,
              ),
            ),
          ),
        IconButton(
          onPressed: () => Get.toNamed<dynamic>(AppRoutes.settings),
          icon: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcATop,
            ),
            child: Image.asset(
              settingsIcon,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}
