import 'dart:async';
import 'package:bloc/bloc.dart';

enum ShowHide {showhide}

class SearchbarBloc extends Bloc<ShowHide, bool> {
  @override
  bool get initialState => true;

  @override
  Stream<bool> mapEventToState(ShowHide event) async* {
    switch (event) {
      case ShowHide.showhide:
        yield !state;
        break;
    }
  }
}