import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_project_algoriza/core/util/widgets/CustomRowText.dart';
import 'package:flutter_project_algoriza/core/util/widgets/CustomTextButton.dart';
import 'package:flutter_project_algoriza/features/onboarding_screen/presentation/widget/onBoardingItem.dart';
import 'package:flutter_project_algoriza/features/singUpScreen/presentation/pages/signupScreen.dart';
import 'package:flutter_project_algoriza/core/util/constant/constant.dart';
import 'package:flutter_project_algoriza/core/util/widgets/customButton.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../login_screen/presentation/pages/loginScreen.dart';


class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key? key}) : super(key: key);

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  var boardController =PageController();
  bool isLast=true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(height: 40,),
          isLast ? Row(
            children: [
              Spacer(),
              CustomButton(text: 'Skip',width: 80,borderRadius: 50,color: HexColor("#faf2e7"),borderColor:HexColor("#faf2e7"),Fontcolor: Colors.black, onTap:(){
                boardController.jumpToPage(2);
              } ,)
            ],
          )
              :SizedBox(height: 40,),
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: boardController,
              onPageChanged: (int index){
                if(index == boarding.length-1){
                  setState(() {
                    isLast=false;
                  });
                }
                else {
                  setState(() {
                    isLast=true;
                  });
                }
              },
              // physics: BouncingScrollPhysics(), //بتشيل اللون الي بيظهر في جنب لما بوصل للنهايه
              itemBuilder: ((context, index) => BuildBoardingItem(boarding[index])),
              itemCount: boarding.length,
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            flex: 1,
            child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        SmoothPageIndicator(
                          controller: boardController,
                          count: boarding.length,
                          effect:   SlideEffect(
                            spacing:  5.0,
                            radius:  8.0,
                            dotWidth:  20.0,
                            dotHeight:  7.0,
                            dotColor: HexColor('#dadada'),
                            activeDotColor:  HexColor('#ce5c4c'),
                          ),
                        ),
                      ]
                  ),
                  const SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CustomButton(text: 'Get Started', borderRadius: 15,onTap:(){
                      NavigateTo(context: context,router: LoginScreen());

                    } ,),
                  ),
                  CustomRowText(Text1: 'Don\'t have an account ?', Text2:'Sign Up' ,  onPressed: (){ NavigateTo(router: SignUpScreen(),context: context);}),





                ]
            ),
          ),
        ],),
    );
  }
}
