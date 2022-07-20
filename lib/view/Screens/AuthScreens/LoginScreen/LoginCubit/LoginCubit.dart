import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/view/Screens/AuthScreens/LoginScreen/LoginCubit/LoginState.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  bool obscure = true;
  Widget fabIcon = const Icon(Icons.visibility,color: Colors.red,);

  void changeFabIcon() {
    obscure = !obscure;
    (obscure)
        ? fabIcon = const Icon(Icons.visibility,color: Colors.red,)
        : fabIcon = const Icon(Icons.visibility_off,color: Colors.red,);
    emit(ChangeFabIconState());
  }
  userLogin({required String email, required String password}) {

    emit(SocialLoginLoadingState());

  }
}
