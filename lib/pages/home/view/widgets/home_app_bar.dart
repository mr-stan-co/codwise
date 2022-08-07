import 'package:flutter/material.dart';
import 'package:wise_dev/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 64.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Text(AppStrings.appName),
          Text(AppStrings.appSlogan),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
