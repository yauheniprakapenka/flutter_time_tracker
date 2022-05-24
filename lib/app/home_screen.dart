import 'package:flutter/material.dart';
import 'package:time_tracking_board_feature/time_tracking_board_feature.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TimeTrackingBoardScreen(),
    );
  }
}
