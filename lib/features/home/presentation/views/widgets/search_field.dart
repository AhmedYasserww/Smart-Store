import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';
import 'custom_app_bar.dart';


class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        readOnly: true,
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SearchView();
                },
              ),
            ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(1),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          hintText: "Search on Smart Store...",
          hintStyle: AppStyle.styleMedium14,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Image.asset(AppImages.scanImage),
                onPressed: () {},
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(AppImages.micImage),
                iconSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(height: 80, title: SearchWidget()),
      body: Column(children: [Divider()]),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppStyle.styleMedium14,
      autofocus: true,

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0.25),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: const Icon(Icons.search, color: Colors.black),
        hintText: "Search on Smart Store...",
        hintStyle: AppStyle.styleMedium14,
      ),
    );
  }
}
