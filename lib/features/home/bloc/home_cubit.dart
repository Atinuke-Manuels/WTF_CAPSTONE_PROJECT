import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState());

  void updateTabIndex(int newIndex) async {
    emit(state.copyWith(tabIndex: newIndex));
  }


}