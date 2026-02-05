import 'package:flutter/material.dart';
import '../../../../../core/utils/app_style.dart';
import '../find_size_widgets/precise_size_tab.dart';
import '../find_size_widgets/quick_size_tab.dart';
import '../find_size_widgets/size_tabs.dart';

class FindSizeViewBody extends StatefulWidget {
  const FindSizeViewBody({super.key});

  @override
  State<FindSizeViewBody> createState() => _FindSizeViewBodyState();
}

class _FindSizeViewBodyState extends State<FindSizeViewBody> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          const SizedBox(height: 16),

          Text('Find Your Size', style: AppStyle.styleBold20),
          const SizedBox(height: 8),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Text(
              selectedTab == 0
                  ? 'View the size guide for measurements and size tips.'
                  : 'Get your ideal size based on your body measurements.',
              key: ValueKey(selectedTab),
              textAlign: TextAlign.center,
              style: AppStyle.styleGreyRegular14,
            ),
          ),

          const SizedBox(height: 32),

          SizeTabs(
            selectedIndex: selectedTab,
            onChanged: (index) {
              setState(() => selectedTab = index);
            },
          ),

          const SizedBox(height: 32),

          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              transitionBuilder: (child, animation) {
                final offsetAnimation = Tween<Offset>(
                  begin: Offset(selectedTab == 0 ? -0.15 : 0.15, 0),
                  end: Offset.zero,
                ).animate(animation);

                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              },
              child: selectedTab == 0
                  ? const QuickSizeTab(key: ValueKey('quick'))
                  : const PreciseSizeTab(key: ValueKey('precise')),
            ),
          ),
        ],
      ),
    );
  }
}
