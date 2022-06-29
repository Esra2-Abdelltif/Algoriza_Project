import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/modules/login_screen/loginScreen.dart';
import 'package:flutter_project_algoriza/shared/components/components.dart';
import 'package:flutter_project_algoriza/shared/components/widgets/customButton.dart';
import 'package:flutter_project_algoriza/shared/components/widgets/custromTextForm.dart';
import 'package:flutter_project_algoriza/shared/constant/constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController PhoneController = new TextEditingController();
  bool _secirty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //image
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/background.png",
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    height: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          NavigateTo(context: context, router: LoginScreen());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          width: 35,
                          height: 35,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              //Sign In Body
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text('Welcome To Fashion Daily',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.grey[600])),
                    SizedBox(
                      height: 15,
                    ),
                    //Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Register',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 40,
                                color: Colors.black)),
                        Row(
                          children: [
                            Text(
                              'Help',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 17),
                            ),
                            Icon(
                              Icons.help,
                              color: Colors.blue,
                              size: 25,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //phone
                    Form(
                        key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextField(
                              FieldName: 'Email',
                              controller: emailController,
                              hintText: 'Eg.example@gmail.com',
                              textInputType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomTextField(
                              FieldName: 'Phone Number',
                              controller: PhoneController,
                              hintText: 'Eg. 812345678',
                              isphone: true,
                              textInputType: TextInputType.phone,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomTextField(
                              FieldName: 'Password',
                              controller: passController,
                              hintText: 'Password',
                              secirty: _secirty,
                              textInputType: TextInputType.phone,
                              isPass: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _secirty = !_secirty;
                                  });
                                },
                                icon: Icon(
                                    _secirty
                                        ? Icons.visibility
                                        : (Icons.visibility_off),
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    //Signin
                    CustomButton(
                      text: 'Sign in',
                      color: Colors.blue,
                      borderRadius: 5,
                      onTap: () {
                        if (formkey.currentState!.validate()) {}
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //OR
                    Row(
                      children: [
                        Expanded(
                          child: MyDivider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text('OR'),
                        ),
                        Expanded(child: MyDivider()),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //Sign With Google
                    CustomButton(
                        text: ' Sign with by google',
                        borderColor: Colors.blue,
                        onTap: () {},
                        color: Colors.white,
                        Fontcolor: Colors.blue,
                        IsSocialMediaLoginButton: true,
                        borderRadius: 10),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Has any account ?',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            )),
                        CustomTextButton(
                          text: 'Sign in here',
                          textcolor: Colors.blue,
                          onPressed: () {
                            NavigateTo(router: LoginScreen(), context: context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'By registering your account, you are agree to our',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'terms and conditions',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    // SizedBox(height: 25,),
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
