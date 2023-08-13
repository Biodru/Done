import 'package:bloc/bloc.dart';
import 'package:done/features/user_context/data/models/user_context.dart';
import 'package:done/features/user_context/data/repositories/user_context_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_context_state.dart';
part 'user_context_cubit.freezed.dart';

class UserContextCubit extends Cubit<UserContextState> {
  UserContextCubit() : super(UserContextState.loading()) {
    fetchData();
  }

  final _repo = UserContextRepository();
  List<UserContext> list = [];

  void fetchData() async {
    emit(UserContextState.loading());
    list = await _repo.getTasks();
    final contextId = await _repo.getSelectedContext();
    if (contextId != null) {
      emit(UserContextState.contextSelected(contextId, list));
    } else {
      emit(
        UserContextState.data(list),
      );
    }
  }

  void addNewContext(UserContext newContext) {
    _repo.addContext(newContext);
    fetchData();
  }

  void changeContext(int? newContext) async {
    await _repo.selectContext(newContext);
    emit(UserContextState.contextSelected(newContext, list));
  }

  UserContext? findContext(int contextId) {
    return state.contextList
        .where((element) => element.id == contextId)
        .firstOrNull;
  }

  int getMaxId() {
    return state.contextList
            .reduce((curr, next) => curr.id > next.id ? curr : next)
            .id +
        1;
  }
}
