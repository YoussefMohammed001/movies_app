part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class BackHomeState extends MainState {}

class SwitchToAppointmentScreen extends MainState{}
class SwitchToProfileScreen extends MainState{}

