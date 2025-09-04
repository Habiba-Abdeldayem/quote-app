import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:quotes/core/widgets/error_widget.dart' as error_widget;

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() => context.read<RandomQuoteCubit>().getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteIsLoading) {
          return Center(
            child: SpinKitFadingCircle(color: AppColors.primary, size: 50.0),
          );
        } else if (state is RandomQuoteError) {
          return Center(
            child: error_widget.ErrorWidget(onPress: () => _getRandomQuote()),
          );
        } else if (state is RandomQuoteLoaded) {
          return Column(
            children: [
              QuoteContent(quote: state.quote),
              InkWell(
                onTap: () => _getRandomQuote(),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: SpinKitFadingCircle(color: AppColors.primary, size: 50.0),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text(AppStrings.appName));
    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
        appBar: appBar,
        body: Center(child: _buildBodyContent()),
      ),
    );
  }
}
