import 'package:codwise/pages/home/view/home_page_view.dart';
import 'package:codwise/pages/home/viewmodel/home_cubit.dart';
import 'package:data_source/data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => QuoteRepository(
        quoteDataSource: CsvDataSource(
          quoteMapper: const QuoteMapper(),
        ),
      ),
      child: BlocProvider(
        create: (context) => HomeCubit(
          quoteRepository: context.read<QuoteRepository>(),
        ),
        child: const HomePageView(),
      ),
    );
  }
}
