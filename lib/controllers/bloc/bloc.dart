import 'package:bloc/bloc.dart';
import 'package:twende/controllers/bloc/event.dart';
import 'package:twende/controllers/bloc/state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(INITIALSTATE());
  
}
