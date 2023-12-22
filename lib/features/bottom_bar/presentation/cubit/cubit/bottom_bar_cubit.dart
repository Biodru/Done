import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_bar_state.dart';
part 'bottom_bar_cubit.freezed.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarState.taskList());

  void changeScreen(int newScreen) {
    switch (newScreen) {
      case 0:
        emit(BottomBarState.taskList());
        break;
      case 1:
        emit(BottomBarState.notes());
        break;
      default:
        emit(BottomBarState.taskList());
    }
  }

  String getAppBarTitle() {
    switch (state.pageIndex) {
      case 0:
        return 'Lista Zadań';
      case 1:
        return 'Notatki';
      default:
        return '';
    }
  }
}
