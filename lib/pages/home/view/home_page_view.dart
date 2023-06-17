import 'package:codwise/constants.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/quote_card.dart';
import 'package:codwise/pages/home/view/widgets/today_date.dart';
import 'package:codwise/pages/home/viewmodel/home_cubit.dart';
import 'package:codwise/pages/home/viewmodel/home_state.dart';
import 'package:codwise/pages/main_app_bar.dart';
import 'package:codwise/pages/view_utils/screen_size_util.dart';
import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStateStatus.loading:
              return _loadingView();
            case HomeStateStatus.error:
              return _errorView();
            case HomeStateStatus.quote:
              return _quoteView(context, state.currentQuote);
          }
        },
      ),
    );
  }

  Widget _loadingView() {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }

  Widget _errorView() {
    return Container(
      alignment: Alignment.center,
      child: const Text("Oops.. Something went wrong"),
    );
  }

  Widget _quoteView(BuildContext context, QuoteEntity quote) {
    final isSmallScreen =
        ScreenSizeUtil.getFromSize(MediaQuery.of(context).size) == ScreenSize.small;
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.homeBackgroundTop,
            AppColors.homeBackgroundBottom,
          ],
        ),
      ),
      child: isSmallScreen ? _smallScreenUi(context, quote) : _bigScreenUi(context, quote),
    );
  }

  Widget _bigScreenUi(BuildContext context, QuoteEntity quote) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _quoteNavigateButton(context, false),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TodayDate(),
            QuoteCard(quoteEntity: quote),
          ],
        ),
        _quoteNavigateButton(context, true),
      ],
    );
  }

  Widget _smallScreenUi(BuildContext context, QuoteEntity quote) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TodayDate(),
        QuoteCard(quoteEntity: quote),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _quoteNavigateButton(context, false),
            _quoteNavigateButton(context, true),
          ],
        )
      ],
    );
  }

  Widget _quoteNavigateButton(BuildContext context, bool isNext) {
    final cubit = context.read<HomeCubit>();
    final icon = isNext ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_new_rounded;
    final navigateAction = isNext ? cubit.nextQuote : cubit.previousQuote;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RawMaterialButton(
        onPressed: navigateAction,
        hoverColor: AppColors.accentColor.withOpacity(0.1),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24.0),
        child: Icon(icon, size: 96.0, color: Colors.black26),
      ),
    );
  }
}
