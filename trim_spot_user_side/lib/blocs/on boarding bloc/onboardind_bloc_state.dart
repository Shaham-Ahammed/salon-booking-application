part of 'onboardind_bloc_bloc.dart';

@immutable
sealed class OnboardindBlocState {}

final class OnboardindBlocInitial extends OnboardindBlocState {}

final class NavigateToSecondOnBoardingPage extends OnboardindBlocState{}

final class NavigateToLoginOrSignupPage extends OnboardindBlocState{} 