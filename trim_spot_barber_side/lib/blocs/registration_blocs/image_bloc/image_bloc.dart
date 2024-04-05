import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc()
      : super(ImageInitial(
            LicensemagePath: "",
            ProfileImagePath: "",
            ShopImageImagePath: "")) {
    on<PickingShopLicense>(_shopLicesnsePicker);
    on<PickingProfile>(_profilePicker);
    on<PickingShopImage>(_shopImagePicker);
  }
  _shopLicesnsePicker(
      PickingShopLicense event, Emitter<ImageState> emit) async {
    final ImagePicker picker = ImagePicker();
    final licenseImage = await picker.pickImage(source: ImageSource.gallery);
    if (licenseImage != null) {
      emit(ImageInitial(
          LicensemagePath: licenseImage.path,
          ProfileImagePath: (state as ImageInitial).ProfileImagePath,
          ShopImageImagePath: (state as ImageInitial).ShopImageImagePath));
    }
  }
  _profilePicker(
      PickingProfile event, Emitter<ImageState> emit) async {
    final ImagePicker picker = ImagePicker();
    final profileImage = await picker.pickImage(source: ImageSource.gallery);
    if (profileImage != null) {
      emit(ImageInitial(
          LicensemagePath: (state as ImageInitial).LicensemagePath,
          ProfileImagePath: profileImage.path,
          ShopImageImagePath: (state as ImageInitial).ShopImageImagePath));
    }
  }
  _shopImagePicker(
      PickingShopImage event, Emitter<ImageState> emit) async {
    final ImagePicker picker = ImagePicker();
    final shopImage = await picker.pickImage(source: ImageSource.gallery);
    if (shopImage != null) {
      emit(ImageInitial(
          LicensemagePath: (state as ImageInitial).LicensemagePath,
          ProfileImagePath: (state as ImageInitial).ProfileImagePath,
          ShopImageImagePath: shopImage.path));
    }
  }
}
