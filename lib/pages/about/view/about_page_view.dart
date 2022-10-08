import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:codwise/constants.dart';
import 'package:codwise/pages/about/view/widgets/about_main_description.dart';
import 'package:codwise/pages/about/view/widgets/about_main_title.dart';
import 'package:codwise/pages/about/view/widgets/about_steps.dart';
import 'package:codwise/pages/about/viewmodel/about_cubit.dart';
import 'package:codwise/pages/about/viewmodel/about_state.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/dashed_separator.dart';
import 'package:codwise/pages/main_app_bar.dart';
import 'package:codwise/pages/view_utils/screen_size_util.dart';

class AboutPageView extends StatelessWidget {
  const AboutPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        ScreenSizeUtil.getFromSize(MediaQuery.of(context).size) == ScreenSize.small;
    return BlocBuilder<AboutCubit, AboutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const MainAppBar(),
          backgroundColor: AppColors.aboutBackground,
          body: SingleChildScrollView(
            child: isSmallScreen
                ? _constructMobileView(state, isSmallScreen)
                : _constructDesktopView(state, isSmallScreen),
          ),
        );
      },
    );
  }

  Widget _constructDesktopView(AboutState state, bool isSmallScreen) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _aboutHeader(state, isSmallScreen),
        const AboutSteps(),
      ],
    );
  }

  Widget _constructMobileView(AboutState state, bool isSmallScreen) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AboutMainTitle(),
          AboutMainDescription(aboutDescription: state.aboutText),
          _aboutQuoteView(state, isSmallScreen),
          const AboutSteps(),
        ],
      ),
    );
  }

  Widget _aboutHeader(AboutState state, bool isSmallScreen) {
    return Padding(
      padding: const EdgeInsets.all(54.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          Expanded(flex: 7, child: _aboutDescriptionView(state)),
          const Spacer(flex: 2),
          Expanded(flex: 7, child: _aboutQuoteView(state, isSmallScreen)),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _aboutDescriptionView(AboutState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AboutMainTitle(),
        AboutMainDescription(aboutDescription: state.aboutText),
      ],
    );
  }

  Widget _aboutQuoteView(AboutState state, bool isSmallScreen) {
    final double iconSize = isSmallScreen ? 64 : 200;
    final double quoteFontSize = isSmallScreen ? 16 : 36;
    final double authorFontSize = isSmallScreen ? 14 : 22;
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: iconSize,
              child: SvgPicture.asset('assets/images/quote_icon.svg'),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            isSmallScreen ? _mobilePlaceHolder() : _desktopPlaceHolder(),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: state.quoteText1,
                style: TextStyle(
                  fontSize: quoteFontSize,
                  fontFamily: AppFonts.playfairDisplay,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: state.quoteText2,
                    style: const TextStyle(
                      color: AppColors.accentColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              state.quoteAuthor,
              style: TextStyle(
                fontSize: authorFontSize,
                fontFamily: AppFonts.poppins,
                fontStyle: FontStyle.italic,
              ),
            ),
            isSmallScreen ? _mobilePlaceHolder() : Container(),
          ],
        ),
      ],
    );
  }

  Widget _desktopPlaceHolder() {
    return const Visibility(
      visible: false,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: AboutMainTitle(),
      ),
    );
  }

  Widget _mobilePlaceHolder() {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: DashSeparator(),
    );
  }
}
