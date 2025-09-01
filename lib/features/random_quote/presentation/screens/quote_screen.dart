import 'package:flutter/material.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/core/utils/assets_manager.dart';
import 'package:quotes/features/favourite_quote/presentation/screens/favourite_quote_screen.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(ImgAssets.quote),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavouriteQuoteScreen(),
                    ),
                  ),
                  child: Text("Anonymous Routing"),
                ),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.favouriteQuoteRoute),
                  child: Text("Named Routing"),
                ),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.favouriteQuoteRoute),
                  child: Text("Generated Routing"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
