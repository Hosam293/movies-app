import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netflixclone/view/Screens/AuthScreens/LoginScreen/LoginCubit/LoginCubit.dart';
import 'package:netflixclone/view/Screens/AuthScreens/LoginScreen/LoginCubit/LoginState.dart';
import 'package:netflixclone/view/Screens/AuthScreens/RegisterScreen/RegisterScreen.dart';
import 'package:netflixclone/view/Screens/HomeScreen/HomeScreen.dart';
import 'package:netflixclone/view/widgets/CustomButton/CustomMaterialButton.dart';
import 'package:netflixclone/view/widgets/CustomFormField/CustomTextFormField.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is SocialLoginErrorState) {
          Fluttertoast.showToast(msg: state.error);
        }
        if (state is SocialLoginSuccessState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>  HomeScreen()));
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<LoginCubit>(context);
        return Container(

          decoration: const BoxDecoration(

              image: DecorationImage(
                  image: NetworkImage(
                      'https://w0.peakpx.com/wallpaper/62/1005/HD-wallpaper-netflix-streaks-abstract-background-blue-colors-colour-colours-dark-neon-netflix.jpg'),
                  fit: BoxFit.cover,
                opacity: .4

              )),
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'NETFLIX',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          height: 1.8,
                          color: Colors.red,
                          fontSize: 70
                        ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 25,

                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,

                          child: Text(
                            'Login For better Movies',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20),

                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomFormField(
                          title: 'Email Address',
                          titleController: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter your Account Correctly';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.email_outlined,color: Colors.red,),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomFormField(
                          title: 'Password',
                          titleController: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter your Account Correctly';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                              icon: cubit.fabIcon
                              ,color: Colors.red,
                              onPressed: () {
                                cubit.changeFabIcon();
                              }),
                          obscureText: cubit.obscure,
                          prefixIcon: const Icon(Icons.lock_outline_rounded,color: Colors.red,),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context) => CustomMaterialButton(
                            text: 'Login',
                            width: double.infinity,
                            height: 50,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t Have Email',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 12, color: Colors.teal),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: Text(
                                  'Register Now',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 15, color: Colors.red),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
