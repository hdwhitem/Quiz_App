import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 1,
          actions: [
            TextButton(onPressed: () {}, child: const Text("E X I T"))
          ]),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Stack(
                  children: [
                    LayoutBuilder(
                        builder: (context, constraints) => Container(
                              width: constraints.maxWidth * 0.5,
                              decoration: BoxDecoration(
                                  gradient: kPrimaryGradient,
                                  borderRadius: BorderRadius.circular(50)),
                            ))
                  ],
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
