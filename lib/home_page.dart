import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mathgametutorial/const.dart';
import 'package:mathgametutorial/util/my_button.dart';
import 'package:mathgametutorial/util/result_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // number pad list
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
  ];
  // number A, number B
  var numberA = 2;
  int numberB = 1;

  // user answer
  String userAnswer = '';

  // user tapped a button
  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        // calculate if user is correct or incorrect
        if(userAnswer.isNotEmpty){
          checkResult();
        }else{
          showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'G I V E   A N S   F I R S T',
              onTap: goBackToQuestion,
              icon: Icons.arrow_back_ios_new,
            );
          });
        }
      } else if (button == 'C') {
        // clear the input
        userAnswer = '';
      } else if (button == 'DEL') {
        // delete the last number
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        // maximum of 3 numbers can be inputted
        userAnswer += button;
      }
    });
  }

  // check if user is correct or not
  void checkResult() {
    if (numberA * numberB == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'C O R R E C T :)\n     N E X T',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward_ios,
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'S O R R Y :(\n  R E T R Y',
              onTap: goBackToQuestion,
              icon: Icons.arrow_back_ios_new,
            );
          });
    }
  }

  // create random numbers
  var randomNumber = Random();

  // GO TO NEXT QUESTION
  void goToNextQuestion() {
    // dismiss alert dialog
    Navigator.of(context).pop();

    // reset values
    setState(() {
      userAnswer = '';
    });

    // create a new question
    numberA = randomNumber.nextInt(20);
    numberB = randomNumber.nextInt(10);
  }

  // GO BACK TO QUESTION
  void goBackToQuestion() {
    // dismiss alert dialog
    Navigator.of(context).pop();
     setState(() {
      userAnswer = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    width: 300,
                    child: Center(
                      child: Text('P L A Y',style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink.shade800
                                ),),
                    ),
                  ),
                ),
              ),
        
              // question
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    width: 300,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // question
                          Text(
                            '$numberA X $numberB = ',
                             style: TextStyle(
                                  fontSize: 50,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.pink.shade800
                                ),
                          ),
                          Text(
                            userAnswer,
                            style: TextStyle(
                                  fontSize: 50,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.pink.shade800
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        
              // number pad
              Card(
                color: Colors.grey.shade200,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: GridView.builder(
                      itemCount: numberPad.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        return MyButton(
                          child: numberPad[index],
                          onTap: () => buttonTapped(numberPad[index]),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
