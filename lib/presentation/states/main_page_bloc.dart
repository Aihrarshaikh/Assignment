import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class MainPageEvent {}
class LoadMainPage extends MainPageEvent {}

// States
abstract class MainPageState {}
class MainPageInitial extends MainPageState {}
class MainPageLoaded extends MainPageState {}

// Bloc
class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitial()) {
    on<LoadMainPage>((event, emit) {
      emit(MainPageLoaded());
    });
  }
} 