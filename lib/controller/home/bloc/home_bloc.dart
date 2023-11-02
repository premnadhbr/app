import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeNavigateToAddEvent>(homeNavigateToAddEvent);
    on<HomeNavigateToStudentListEvent>(homeNavigateToStudentListEvent);
    on<HomeLocationEvent>(homeLocationEvent);
    on<Homeinitialevent>(homeinitialevent);
  }

  FutureOr<void> homeNavigateToAddEvent(
      HomeNavigateToAddEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToAddingPageActionState());
  }

  FutureOr<void> homeNavigateToStudentListEvent(
      HomeNavigateToStudentListEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToStudentListPageActionState());
  }

  FutureOr<void> homeLocationEvent(
      HomeLocationEvent event, Emitter<HomeState> emit) async {
    var servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print("Service disabled");
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    var current = await Geolocator.getCurrentPosition();

    List<Placemark> placesMarks =
        await placemarkFromCoordinates(current!.latitude, current!.longitude);
    Placemark place = placesMarks[0];

    var currentAdress = "${place.locality}, ${place.country}";
    log(currentAdress);

    emit(HomeLocationGetstate(current: currentAdress));
  }

  FutureOr<void> homeinitialevent(
      Homeinitialevent event, Emitter<HomeState> emit) {
    emit(HomeLoaddedstate());
  }
}
