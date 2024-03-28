
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboardind_bloc_event.dart';
part 'onboardind_bloc_state.dart';

class OnboardindBloc
    extends Bloc<OnboardindBlocEvent, OnboardindBlocState> {
  OnboardindBloc() : super(OnboardindBlocInitial()) {
    on<NextButtonPressed>(_nextButtonPressed);
  }
  _nextButtonPressed(
      NextButtonPressed event, Emitter<OnboardindBlocState> emit) {
    if (event.page == 0) {
      emit(NavigateToSecondOnBoardingPage());
    } else if (event.page == 1) {
      emit(NavigateToLoginOrSignupPage());
    }
  }
}
