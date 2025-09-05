import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/splash/presentation/screens/splash_screen.dart';
import 'package:quotes/playground/favourite_quote/presentation/screens/favourite_quote_screen.dart';
import 'package:quotes/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:quotes/injection_container.dart' as di;
class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
  static const String favouriteQuoteRoute = '/favouriteQuote';
}

// onGenerateRoute
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
          case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.randomQuoteRoute:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => di.sl<RandomQuoteCubit>(),
          child: const QuoteScreen()));
      case Routes.favouriteQuoteRoute:
        return MaterialPageRoute(builder: (_) => const FavouriteQuoteScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) =>
          const Scaffold(body: Center(child: Text(AppStrings.noRouteFound))),
    );
  }
}


// final namedRoutes = {
//   Routes.initialRoute: (context) => const QuoteScreen(),
//   Routes.favouriteQuoteRoute: (context) => const FavouriteQuoteScreen(),
// };