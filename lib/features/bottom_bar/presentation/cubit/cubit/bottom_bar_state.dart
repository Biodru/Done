part of 'bottom_bar_cubit.dart';

@freezed
class BottomBarState with _$BottomBarState {
  const BottomBarState._();

  const factory BottomBarState({
    @Default(0) int pageIndex,
  }) = _BottomBarState;

  factory BottomBarState.taskList() {
    return const _BottomBarState(pageIndex: 0);
  }

    factory BottomBarState.notes() {
    return const _BottomBarState(pageIndex: 1);
  }
}
