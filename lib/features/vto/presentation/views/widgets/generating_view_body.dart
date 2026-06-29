// features/vto/presentation/views/widgets/generating_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_store/core/utils/app_color.dart';
import 'package:smart_store/core/utils/app_dimensions.dart';
import 'package:smart_store/core/utils/app_style.dart';
import '../../../../../core/utils/app_images.dart';
import '../../manager/vto_cubit.dart';

class GeneratingViewBody extends StatefulWidget {
  const GeneratingViewBody({super.key});

  @override
  State<GeneratingViewBody> createState() => _GeneratingViewBodyState();
}

class _GeneratingViewBodyState extends State<GeneratingViewBody> {

  double _progress = 0;
  int _elapsed = 0;
  bool _apiDone = false;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;

      // ✅ لو الـ API خلص اكمل للـ 100% بسرعة
      if (_apiDone) {
        setState(() => _progress = (_progress + 0.1).clamp(0.0, 1.0));
        return _progress < 1.0;
      }

      // لو لسه شغال زود ببطء وسيب مساحة
      setState(() {
        _elapsed++;
        _progress = (_progress + 0.008).clamp(0.0, 0.9);
      });

      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VtoCubit, VtoState>(
      listener: (context, state) {
        if (state is VtoSuccess || state is VtoFailure) {
          // ✅ لما الـ API يرجع خلي الـ progress يكمل
          setState(() => _apiDone = true);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.homeScreenPadding,
        ),
        child: Column(
          children: [
            const SizedBox(height: 32),
            SvgPicture.asset(AppImages.generatedAiProgressIcon),
            const SizedBox(height: 24),
            Text('Ai magic in progress', style: AppStyle.styleSemiBold24),
            const SizedBox(height: 8),
            Text(
              'Creating your perfect virtual try-on...',
              style: AppStyle.styleGreyRegular16,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: _progress,
                minHeight: 16,
                backgroundColor: Colors.grey.shade200,
                valueColor:
                AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(_progress * 100).toInt()}%',
                  style: AppStyle.styleBold20
                      .copyWith(color: AppColors.primaryColor),
                ),
                Row(
                  children: [
                    Text('Elapsed: ', style: AppStyle.styleGreyRegular12),
                    Text(
                      '$_elapsed',
                      style: AppStyle.styleBold14
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    Text('s', style: AppStyle.styleGreyRegular12),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE5E5E5)),
                  borderRadius: BorderRadius.circular(24),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Text(
                _apiDone
                    ? '✅ Analysis complete! Preparing your result...'
                    : 'Your AI VT-O System is analyzing your photo',
                style: AppStyle.styleBold14,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}