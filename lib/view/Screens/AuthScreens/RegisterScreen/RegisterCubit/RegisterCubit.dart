import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/view/Screens/AuthScreens/RegisterScreen/RegisterCubit/RegisterStates.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);

  bool obscure = true;
  Widget fabIcon = Icon(Icons.visibility,color: Colors.red,);

  void changeFabIcon() {
    obscure = !obscure;
    (obscure)
        ? fabIcon = Icon(Icons.visibility,color: Colors.red,)
        : fabIcon = Icon(Icons.visibility_off,color: Colors.red,);
    emit(ChangeFabIconState());
  }

  userRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(SocialRegisterLoadingState());

  }

  // userCreate(
  //     {required dynamic email,
  //     required String uId,
  //     required dynamic name,
  //     required dynamic phone}) {
  //   emit(SocialCreateLoadingState());
  //   UserModel model = UserModel(
  //     email: email,
  //     name: name,
  //     phone: phone,
  //     uId: uId,
  //     bio: 'bio',
  //     image:
  //         'https://as2.ftcdn.net/v2/jpg/02/80/14/97/1000_F_280149761_lRNVPQFBh8f3n6yaptGB0jCyeZd56ZTi.jpg',
  //     cover:
  //         'https://as2.ftcdn.net/v2/jpg/02/80/14/97/1000_F_280149761_lRNVPQFBh8f3n6yaptGB0jCyeZd56ZTi.jpg',
  //   );
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uId)
  //       .set(model.toMap())
  //       .then((value) {
  //     print('value data created');
  //     emit(SocialCreateSuccessState());
  //   }).catchError((error) {
  //     print('${error.toString()} there is error in regi');
  //
  //     emit(SocialCreateErrorState());
  //   });
  // }
}
