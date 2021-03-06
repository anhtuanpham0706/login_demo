import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_demo/api/api.dart';
import 'package:login_demo/model/User.dart';
import 'dart:async';
import 'dart:core';

import 'package:permission_handler/permission_handler.dart';


abstract class ProfileEvent {

  const ProfileEvent();
}
class TakePhotoEvent extends ProfileEvent {
  final ImageSource source;
  final String user;
const TakePhotoEvent(this.source, this.user);
}

class ProfileState {
const ProfileState();
}


class TakePhotoState extends ProfileState {
  final PickedFile imageFile;

  const TakePhotoState(this.imageFile);
}


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({ProfileState init = const ProfileState()}):super(init);

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    switch(event.runtimeType) {
      case TakePhotoEvent:
        yield* _takephoto(event);
        break;

    }
  }
  Stream<ProfileState> _takephoto(TakePhotoEvent event) async* {
      final ImageSource source = event.source;
      final String user = event.user;

      PickedFile imageFile;
      final ImagePicker _picker = ImagePicker();
      final pickedFile = await _picker.getImage(
          source: source);
      imageFile = pickedFile;
      File file = File(pickedFile.path);
      List<int> bytes = file.readAsBytesSync();
      String base64 = base64Encode(bytes);
      update_avatar(user, base64);


      yield TakePhotoState(imageFile);

  }

}











