
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Screens/search/cubit/state.dart';
import 'package:shop_app/model/search/search_model.dart';
import 'package:shop_app/network/End_Points.dart';
import 'package:shop_app/network/dio_helper.dart';
import 'package:shop_app/shared/componnetns/constants.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;
  var searchController = TextEditingController();
  void getSearch({String? text}) {
    emit(SearchLoadingStates());
    DioHelper.postData(url: search, token: token, data: {
      'search': text,
    }).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessStates());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(SearchErrorStates());
    });
  }

  void clearSearchData() {
    searchController.clear();
    searchModel ;
  }
}
