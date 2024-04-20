import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_image_bloc/profile_image_bloc.dart';
import 'package:trim_spot_user_side/data/data_provider/user_data.dart';
import 'package:trim_spot_user_side/utils/firebase/collection_references.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddUserDetailsToFirebase {
  addImage(context) async {
    final metadata =
        firebase_storage.SettableMetadata(contentType: 'image/jpeg');

    await userStorageReference(context).putData(
        BlocProvider.of<ProfileImageBloc>(context).state.imageInBytes!,
        metadata);
  }

  addData(String downloadURL) async{
    final data = UserDetailsData().userData(downloadURL);
   await userCollections.add(data);
  }
}
