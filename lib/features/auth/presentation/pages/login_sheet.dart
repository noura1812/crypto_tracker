import 'package:crypto_tracker/app/di.dart';
import 'package:crypto_tracker/core/common/presentation/widgets/customButtons/custom_elevated_buttons.dart';
import 'package:crypto_tracker/core/common/presentation/widgets/custom_text_form_field.dart';
import 'package:crypto_tracker/core/config/text_form_validations.dart';
import 'package:crypto_tracker/core/config/text_styles.dart';
import 'package:crypto_tracker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:crypto_tracker/features/crypto/presentation/pages/crypto_wishlist/bloc/crypto_wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSheet extends StatefulWidget {
  const LoginSheet({super.key});

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Login', style: CustomTextStyle.styleW700S18Black),
            SizedBox(height: 20.h),
            CustomTextFormField(
              hintText: 'Email',
              controller: emailController,
              validator: (input) {
                if (!TextFormValidations.isValidEmail(input)) {
                  return 'Invalid email';
                }
                return null;
              },
            ),
            CustomTextFormField(
              hintText: 'Password',
              password: true,
              controller: passwordController,
              validator: (input) {
                if (TextFormValidations.emptyField(input)) {
                  return 'Invalid password';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: getIt<CryptoWishlistBloc>()),
                BlocProvider.value(value: getIt<AuthBloc>()),
              ],
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    context.read<CryptoWishlistBloc>().add(GetCryptoWishList());
                    Navigator.pop(context);
                  }
                },
                builder:
                    (BuildContext context, AuthState state) => CustomMainButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                            LoginEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
                      },
                      text: 'Login',
                      child:
                          state is LoginLoading
                              ? const CircularProgressIndicator()
                              : null,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
