import 'dart:async';
import 'package:bloc/bloc.dart';

enum ThemeType { dark, light }

abstract class ConfigEvent {}
class SetThemeEvent extends ConfigEvent { 
  final ThemeType themeType;

  SetThemeEvent(this.themeType);
}

class ConfigBloc extends Bloc<ConfigEvent, ThemeType> {
  ConfigBloc(ThemeType initialState) : super(initialState);

  @override
  ThemeType get initialState => ThemeType.light;

  @override
  Stream<ThemeType> mapEventToState(ConfigEvent event) async* {

    if(event is SetThemeEvent) {
      yield event.themeType;
    }
  }
}
