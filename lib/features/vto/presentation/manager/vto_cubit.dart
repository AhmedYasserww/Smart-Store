import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/entities/vto_entity.dart';
import '../../data/repos/vto_repo.dart';

part 'vto_state.dart';

class VtoCubit extends Cubit<VtoState> {
  final VtoRepo vtoRepo;
  VtoCubit(this.vtoRepo) : super(VtoInitial());

  Future<void> tryOn({
    required File personImage,
    required String garmentUrl,
    required String category,
  }) async {
    emit(VtoLoading());
    final result = await vtoRepo.tryOn(
      personImage: personImage,
      garmentUrl: garmentUrl,
      category: category,
    );
    result.fold(
          (failure) => emit(VtoFailure(errorMessage: failure.errorMessage)),
          (vto) => emit(VtoSuccess(result: vto)),
    );
  }
}