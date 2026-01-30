import 'package:flutter/material.dart';
import 'package:smart_store/features/home/presentation/views/widgets/product_list_view.dart';
import 'package:smart_store/features/home/presentation/views/widgets/search_field.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';
import 'category_widget.dart';
import 'custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(height: 80, title: SearchField(), hideBack: true),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(
      'Font Family Used: ${Theme.of(context).textTheme.bodyMedium?.fontFamily}',
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children:const [
          Divider(),
          CategoryWidget(),
          SizedBox(height: 16),
          Text("Exclusive Offers", style: AppStyle.styleSemiBold20),
          SizedBox(height: 16),
          OfferCardListView(),
          Text("Recently Viewed", style: AppStyle.styleSemiBold20),
          SizedBox(height: 16),
          ProductListview(),

          SizedBox(height: 16),
          Text("Recommended For You", style: AppStyle.styleSemiBold20),
          SizedBox(height: 16),
          ProductListview(),
        ],
      ),
    );
  }
}

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.menImage),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text("Category", style: AppStyle.styleMedium14),
      ],
    );
  }
}

class OfferCardListView extends StatelessWidget {
  const OfferCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const OfferCardWidget(),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 10,
      ),
    );
  }
}

class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 196,
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 150,
            width: 196,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImages.bagImage),
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Classic Blue Suit",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.styleMedium14,
                ),
                SizedBox(height: 2),
                Text(
                  "Up to 30% off on selected summerlakjlfjlakjlkjlkjlk",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.styleGreyRegular10,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              height: 32,
              width: 164,
              decoration: BoxDecoration(
                color: Color(0xFF5d3A82),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "View Offer",
                  style: AppStyle.styleGreyRegular10.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
