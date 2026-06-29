// features/vto/presentation/views/generating_view.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_store/core/widgets/custom_app_bar.dart';
import 'package:smart_store/features/vto/presentation/views/vto_result_view.dart';
import 'package:smart_store/features/vto/presentation/views/widgets/generating_view_body.dart';

import '../../data/models/vto_argument.dart';
import '../manager/vto_cubit.dart';

class GeneratingView extends StatefulWidget {
  const GeneratingView({
    super.key,
    required this.personImage,
    required this.args,
  });
  static const String routeName = 'generating_view';
  final File personImage;
  final VtoArguments args;

  @override
  State<GeneratingView> createState() => _GeneratingViewState();
}

class _GeneratingViewState extends State<GeneratingView> {
  @override
  void initState() {
    super.initState();
    context.read<VtoCubit>().tryOn(
      personImage: widget.personImage,
      garmentUrl: widget.args.garmentUrl,
      category: widget.args.subCategory,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VtoCubit, VtoState>(
      listener: (context, state) {
        if (state is VtoSuccess) {
          Navigator.of(context).pushReplacementNamed(
            VtoResultView.routeName,
            arguments: {
              'resultImageBytes': state.result.resultImageBytes,
              'args': widget.args, // ✅
            },
          );
        }
        if (state is VtoFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: "Generating..."),
        body: const GeneratingViewBody(),
      ),
    );
  }
}