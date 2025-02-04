import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Espere...'),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          const CircularProgressIndicator(
            color: Colors.white,
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}