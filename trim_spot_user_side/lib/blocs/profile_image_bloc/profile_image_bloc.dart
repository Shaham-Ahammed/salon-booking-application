import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'profile_image_event.dart';
part 'profile_image_state.dart';

class ProfileImageBloc extends Bloc<ProfileImageEvent, ProfileImageState> {
  ProfileImageBloc() : super(ProfileImageInitial(imagePath: '')) {
    on<SelectedProfile>(_selectedProfile);
  }
  _selectedProfile(
      SelectedProfile event, Emitter<ProfileImageState> emit) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imagePath = image.path;
      emit(ProfileImageInitial(imagePath: imagePath));
    }
  }
}
