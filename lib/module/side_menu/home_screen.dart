import 'package:flutter/material.dart';
import 'package:rs_ui/widget/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Aplikasi Prediksi Biaya dan Lama Rawat",
              style: TextStyle(
                fontSize: 52,
                color: Colors.blue,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 18),
            Image(
              image: AssetImage("assets/hospital.jpg"),
              width: 700,
            ),
          ],
        ),
      ),
    );
  }
}
