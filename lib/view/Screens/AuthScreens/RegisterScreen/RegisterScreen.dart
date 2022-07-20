import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/view/Screens/AuthScreens/LoginScreen/LoginScreen.dart';
import 'package:netflixclone/view/Screens/AuthScreens/RegisterScreen/RegisterCubit/RegisterStates.dart';
import 'package:netflixclone/view/Screens/HomeScreen/HomeScreen.dart';
import 'package:netflixclone/view/widgets/CustomButton/CustomMaterialButton.dart';
import 'package:netflixclone/view/widgets/CustomFormField/CustomTextFormField.dart';

import 'RegisterCubit/RegisterCubit.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is SocialCreateSuccessState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<RegisterCubit>(context);
        return Container(
          decoration: const BoxDecoration(

              image: DecorationImage(
                  image: NetworkImage(
                      'https://w0.peakpx.com/wallpaper/62/1005/HD-wallpaper-netflix-streaks-abstract-background-blue-colors-colour-colours-dark-neon-netflix.jpg'),
                  fit: BoxFit.cover,
                  opacity: .4

              )),

          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'NETFLIX',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            height: 1.8,
                            color: Colors.red,
                            fontSize: 50
                        ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,

                          child: Text(
                            'Sign up',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 25),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,

                          child: Text(
                            'Sign up For better Movies',
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
                          title: 'name',
                          titleController: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter your Account Correctly';
                            }
                            return null;
                          },
                          type: TextInputType.text,
                          // suffixIcon: IconButton
                          //   (icon: cubit.fabIcon,onPressed: ()
                          // {
                          //   cubit.changeFabIcon();
                          // }),
                          // obscureText: cubit.obscure,
                          prefixIcon: const Icon(
                              Icons.drive_file_rename_outline_outlined,color: Colors.red,),
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
                              icon: cubit.fabIcon,color: Colors.red,
                              onPressed: () {
                                cubit.changeFabIcon();
                              }),
                          obscureText: cubit.obscure,
                          prefixIcon: const Icon(Icons.lock_outline_rounded,color: Colors.red,),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomFormField(
                          title: 'Phone',
                          titleController: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter your Account Correctly';
                            }
                            return null;
                          },
                          type: TextInputType.text,
                          prefixIcon: const Icon(Icons.phone,color: Colors.red,),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                            condition: state is! SocialRegisterLoadingState,
                            fallback: (context) =>
                                const Center(child: CircularProgressIndicator()),
                            builder: (context) => CustomMaterialButton(
                                  text: 'Sign up',
                                  width: double.infinity,
                                  height: 50,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.userRegister(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: nameController.text,
                                          phone: phoneController.text);
                                    }
                                  },
                                )),
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                'Login now',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 15, color: Colors.teal),
                              )),
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
