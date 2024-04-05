part of 'image_bloc.dart';

@immutable
sealed class ImageState {}

final class ImageInitial extends ImageState {
  final String LicensemagePath;
  final String ProfileImagePath;
  final String ShopImageImagePath;
  ImageInitial(
      {required this.LicensemagePath,
      required this.ProfileImagePath,
      required this.ShopImageImagePath});
}
