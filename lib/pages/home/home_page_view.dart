import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wise_dev/pages/home/viewmodel/home_cubit.dart';
import 'package:wise_dev/pages/home/viewmodel/home_state.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adwisely"),
      ),
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
    final date = DateFormat.yMMMMEEEEd().add_Hm().format(DateTime.now());
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Text(
              quite.quote,
              style: TextStyle(fontSize: 42),
            ),
          ),
          Text(
            quite.author,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
