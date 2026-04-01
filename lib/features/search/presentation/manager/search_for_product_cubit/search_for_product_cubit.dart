import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../products/data/models/product_model.dart';
import '../../../data/repos/search_repo.dart';

part 'search_for_product_state.dart';


class SearchForProductCubit extends Cubit<SearchForProductState> {
  final SearchRepo searchRepo;

  Timer? _debounce;
  String lastQuery = '';
  CancelToken? _cancelToken;

  SearchForProductCubit(this.searchRepo)
      : super(SearchForProductInitial());

  void searchForProduct(String query) {
    final trimmedQuery = query.trim();

    if (trimmedQuery == lastQuery) return;
    lastQuery = trimmedQuery;

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (trimmedQuery.isEmpty) {
        emit(SearchForProductInitial());
        return;
      }
      _cancelToken?.cancel("Cancelled due to new search");

      _cancelToken = CancelToken();

      emit(SearchForProductLoading());

      try {
        final result = await searchRepo.searchForProduct(
          product: trimmedQuery,
          cancelToken: _cancelToken,
        );

        result.fold(
              (failure) => emit(
            SearchForProductFailure(errorMessage: failure.errorMessage),
          ),
              (products) => emit(
            SearchForProductSuccess(product: products),
          ),
        );
      } on DioException catch (e) {

        if (CancelToken.isCancel(e)) {
          print("Request cancelled");
        } else {
          emit(
            SearchForProductFailure(
              errorMessage: e.message ?? "Error",
            ),
          );
        }
      }
    });
  }
  String get currentQuery => lastQuery;

  @override
  Future<void> close() {
    _debounce?.cancel();
    _cancelToken?.cancel();
    return super.close();
  }
}
