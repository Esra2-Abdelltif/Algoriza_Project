import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/features/login_screen/presentation/pages/loginScreen.dart';
import 'package:flutter_project_algoriza/core/util/widgets/customButton.dart';
import 'package:flutter_project_algoriza/core/util/widgets/custromTextForm.dart';
import 'package:flutter_project_algoriza/core/util/constant/constant.dart';
import '../../../../core/util/widgets/CustomRowText.dart';
import '../../../../core/util/widgets/CustomTextButton.dart';
import '../../../../core/util/widgets/myDivider.dart';


class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  var formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController PhoneController = new TextEditingController();
  bool _secirty = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                            textInputType: TextInputType.visiblePassword,
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
                  CustomRowText(Text1: 'Has any account ?', Text2:'Sign in here' , textcolor:  Colors.blue, onPressed:  () {
                    NavigateTo(router: LoginScreen(), context: context);
                  },),

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
        ));
  }
}
