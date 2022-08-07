import 'package:flutter/material.dart';
import 'package:wise_dev/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: _appBarDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 160),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _logo(),
                  _divider(),
                  _slogan(),
                ],
              ),
              _about(),
            ]),
      ),
    );
  }

  Widget _logo() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Text(
        AppStrings.appName,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 20,
          fontFamily: AppFonts.playfairDisplay,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _divider() {
    return const SizedBox(
      width: 2,
      height: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.appBarDividerGray,
        ),
      ),
    );
  }

  Widget _slogan() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Text(
        AppStrings.appSlogan,
        style: TextStyle(
          color: AppColors.textGray,
          fontSize: 16,
          fontFamily: AppFonts.poppins,
        ),
      ),
    );
  }

  Widget _about() {
    return InkWell(
      onTap: () => _onAboutClicked(),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Text(
          "About",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontFamily: AppFonts.poppins,
          ),
        ),
      ),
    );
  }

  _onAboutClicked() {
    // TODO navigate to about page
  }

  Decoration _appBarDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 4,
          spreadRadius: 2,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
