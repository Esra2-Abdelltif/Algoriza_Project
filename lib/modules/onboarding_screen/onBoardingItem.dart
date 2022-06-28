import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/shared/style/colors.dart';
import 'package:flutter_project_algoriza/shared/style/size_config.dart';
import 'package:hexcolor/hexcolor.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

List<BoardingModel> boarding = [
  BoardingModel(
      image: 'assets/images/onboarding_1.png',
      title: 'Get food delivery to your doorstep asap',
      body:
          'We have young and professional delivery team that will bring your food on soon as possible to your doorstep'),
  BoardingModel(
      image: 'assets/images/onboarding_2.png',
      title: 'Buy Any Food from your favorite restaurant',
      body:
          'We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected'),
  BoardingModel(
      image: 'assets/images/onboarding_2.png',
      title: 'Buy Any Food from your favorite restaurant',
      body:
          'We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected'),
];

Widget BuildBoardingItem(BoardingModel model) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
           Center(child: Text('7',style: TextStyle(color: HexColor('#ce5c4c'),fontSize: 35,fontWeight: FontWeight.w900),)),
           Center(child: Text('Krave',style: TextStyle(color: defultColor,fontSize: 35,fontWeight: FontWeight.w900)))
         ]),
          Expanded(
              child: Image(
            image: AssetImage('${model.image}'),
          )),
          const SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            '${model.title}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          )),
          const SizedBox(
            height: 15,
          ),
          Center(
              child: Text('${model.body}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF8D8E98),
                      fontSize: 16))),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
