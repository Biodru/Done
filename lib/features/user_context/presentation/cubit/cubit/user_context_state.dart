part of 'user_context_cubit.dart';

@freezed
class UserContextState with _$UserContextState {
  const UserContextState._();

  const factory UserContextState({
    @Default(null) int? currentContextId,
    @Default([]) List<UserContext> contextList,
    @Default(true) bool isLoading,
  }) = _UserContextState;

  factory UserContextState.loading() {
    return const _UserContextState(isLoading: true);
  }

  factory UserContextState.contextSelected(
      int? newContext, List<UserContext> contextList) {
    return _UserContextState(
        currentContextId: newContext,
        isLoading: false,
        contextList: contextList);
  }

  factory UserContextState.data(List<UserContext> contextList) {
    return _UserContextState(isLoading: false, contextList: contextList);
  }
}
