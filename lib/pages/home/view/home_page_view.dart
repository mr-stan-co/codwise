import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wise_dev/constants.dart';
import 'package:wise_dev/pages/main_app_bar.dart';
import 'package:wise_dev/pages/home/view/widgets/today_date.dart';
import 'package:wise_dev/pages/home/view/widgets/quote_card/quote_card.dart';
import 'package:wise_dev/pages/home/viewmodel/home_cubit.dart';
import 'package:wise_dev/pages/home/viewmodel/home_state.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const MainAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.when(
            loading: () => _loadingView(),
            error: () => _errorView(),
            data: (quote) => _dataView(quote),
          );
        },
      ),
    );
  }

  Widget _loadingView() {
    return const CircularProgressIndicator();
  }

  Widget _errorView() {
    return const Text("Error happened");
  }

  Widget _dataView(QuoteEntity quite) {
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
          )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TodayDate(),
          QuoteCard(quoteEntity: quite),
        ],
      ),
    );
  }
}
