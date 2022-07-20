abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangeFabIconState extends LoginStates {}

class SocialLoginLoadingState extends LoginStates {}

class SocialLoginSuccessState extends LoginStates
{
  String uId;

  SocialLoginSuccessState(this.uId);
}

class SocialLoginErrorState extends LoginStates {
  String error;

  SocialLoginErrorState(this.error);
}
