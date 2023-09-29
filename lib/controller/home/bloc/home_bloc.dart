import 'dart:async';
import 'package:bloc/bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeNavigateToAddEvent>(homeNavigateToAddEvent);
    on<HomeNavigateToStudentListEvent>(homeNavigateToStudentListEvent);
  }

  FutureOr<void> homeNavigateToAddEvent(
      HomeNavigateToAddEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToAddingPageActionState());
  }

  FutureOr<void> homeNavigateToStudentListEvent(
      HomeNavigateToStudentListEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToStudentListPageActionState());
  }
}
