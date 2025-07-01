import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Comman/widget/image_widget.dart';

import '../../../Controller/auth_controller.dart';
import 'signUp_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _authController = Get.put(AuthController());
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 169, 115, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Column(
            children: [
              ImageWidget(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Form(
                    key: _authController.LoginformKey,
                    child: Column(
                  children: [
                    Text(
                      "Welcome !",
                      style: GoogleFonts.poppins(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(243, 120, 29, 1),
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 44,
                              child: TextFormField(
                                controller: _authController.emailController,
                                validator: _authController.validateEmail,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    hintText: 'Enter your email',
                                    hintStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        color: Color.fromRGBO(171, 171, 171, 1)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(243, 120, 29, 1),
                                      ),
                                    )),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "User name",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 44,
                          child: TextFormField(
                            controller: _authController.userNameController,
                            validator: _authController.validateUsername,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: 'Enter your user name',
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: Color.fromRGBO(171, 171, 171, 1)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(243, 120, 29, 1),
                                  ),
                                )),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 44,
                          child: TextFormField(
                            obscureText: _obscurePassword,
                            controller: _authController.PasswordController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: _authController.validatePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              hintText: 'Enter your Password',
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Color.fromRGBO(171, 171, 171, 1)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(243, 120, 29, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                }),
                            Text(
                              "Rememebr me",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),

                          ],
                        ),
                        TextButton(onPressed: (){}, child:  Text(
                          "Forgot Password ?",
                          style: GoogleFonts.poppins(
                            color: Color.fromRGBO(77, 77, 77, 1),
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Obx(() => SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Color.fromRGBO(243, 120, 29, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: _authController.isLoading.value
                            ? null
                            : () {
                          _authController
                              .submitLoginForm(context);
                        },
                        child: _authController.isLoading.value
                            ? const CircularProgressIndicator(
                            color: Colors.white)
                            : Text(
                          "Login",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => Get.to(SignupScreen()),
                      child: Text(
                        "Don’t have an Account ?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(125, 125, 125, 1),
                        ),
                      ),
                    )

                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
