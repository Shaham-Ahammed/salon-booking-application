part of 'image_bloc.dart';

@immutable
sealed class ImageState {
  final String LicensemagePath;
  final String ProfileImagePath;
  final String ShopImageImagePath;

  ImageState(
      {required this.LicensemagePath,
      required this.ProfileImagePath,
      required this.ShopImageImagePath});
}

final class ImageInitial extends ImageState {
  ImageInitial(
      {required String LicensemagePath,
      required String ProfileImagePath,
      required String ShopImageImagePath})
      : super(
            LicensemagePath: LicensemagePath,
            ProfileImagePath: ProfileImagePath,
            ShopImageImagePath: ShopImageImagePath);
}
