import 'package:flutter/material.dart';
import 'package:quotes/core/utils/assets_manager.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/utils/media_query_values.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/playground/favourite_quote/presentation/screens/favourite_quote_screen.dart';

class PlaygroundScreen extends StatelessWidget {
  const PlaygroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Playground")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image with context.width
              Image.asset(ImgAssets.quote, width: context.width * 0.5),

              const SizedBox(height: 20),

              // Routing examples
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FavouriteQuoteScreen(),
                      ),
                    ),
                    child: const Text("Anonymous Routing"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      Routes.favouriteQuoteRoute,
                    ),
                    child: const Text("Named Routing"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      Routes.favouriteQuoteRoute,
                    ),
                    child: const Text("Generated Routing"),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Dialog + Toast examples
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Constants.showErrorDialog(
                      context: context,
                      message: "Error Happened",
                    ),
                    child: const Text("Show Error Dialog"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => Constants.showToast(
                      context: context,
                      message: "Toast Message",
                      color: Colors.red,
                    ),
                    child: const Text("Show Toast"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
