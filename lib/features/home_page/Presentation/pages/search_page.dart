import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meow_films/core/theme/app_theme.dart';
import 'package:meow_films/features/home_page/Presentation/Providers/movie_api_provider.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/grid_view_widget.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/search_textfield_widget.dart';

class SearchPage extends HookConsumerWidget {
  static const routePath = '/search';

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 32, 31, 31),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SearchTextFieldWidget(
                  text: 'Enter movie name',
                  controller: controller,
                ),
                const SizedBox(height: 20),
                Text(
                  'Results:',
                  style: AppTheme.of(context)
                      .typography
                      .h600
                      .copyWith(color: const Color.fromARGB(255, 34, 34, 34)),
                ),
                const SizedBox(height: 10),
                Builder(
                  builder: (context) {
                    return ref
                        .watch(searchMoviesProvider(controller.text))
                        .when(
                          data: (data) {
                            return data.isEmpty
                                ? const Center(
                                    child: Text("Search for movie"),
                                  )
                                : SizedBox(
                                    height:
                                        400, // Adjust the height accordingly
                                    child: GridViewWidget(entity: data),
                                  );
                          },
                          error: (error, stackTrace) => Center(
                            child: Column(
                              children: [
                                Text(
                                  "An error occurred: $error",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 20, 20, 20)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ref.invalidate(
                                        searchMoviesProvider(controller.text));
                                  },
                                  child: const Text(
                                    "No data available. Tap to retry.",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 36, 35, 35)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
