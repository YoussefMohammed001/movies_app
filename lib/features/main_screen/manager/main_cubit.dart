
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/TV/presentation/screens/tv_screen.dart';
import 'package:movie_app/features/movies/presentation/screens/movies_screen.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int index = 0;

  List<Widget> screens = [
    MainMoviesScreen(),
    TvScreen(),

  ];

  void backToHome() {
    index = 0;
    emit(BackHomeState());
  }

  void switchToAppointmentScreen() {
    index = 4;
    emit(SwitchToAppointmentScreen());
  }


  void switchToProfileScreen() {
    index = 3;
    emit(SwitchToProfileScreen());
  }

}
