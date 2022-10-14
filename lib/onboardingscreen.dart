import 'package:flutter/material.dart';
class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('M A T H x G A M E',style: TextStyle(
                        fontSize: 20,
                        color: Colors.pink.shade800,
                        fontWeight: FontWeight.bold
                      ),),
            const SizedBox(height: 20,),
            Text('P L A Y',style: TextStyle(
                        fontSize: 60,
                        color: Colors.pink.shade800,
                        fontWeight: FontWeight.bold
                      ),),
            
            const Text('C H O O S E   O P E R A T O R :'),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/mul');
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.pink.shade700,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Center(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('x',style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                    )),
                  ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                   onTap: (){
                    Navigator.pushNamed(context, '/add');
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.pink.shade700,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Center(
                      child: Text('+',style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}