part of 'profile_image_bloc.dart';

@immutable
sealed class ProfileImageState {
  final String imagePath;

  ProfileImageState({required this.imagePath});
}

final class ProfileImageInitial extends ProfileImageState {
  ProfileImageInitial({required super.imagePath});
}
