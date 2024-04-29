import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final bool isPast;
  final child;
  const ProgressCard({super.key, required this.isPast, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color:isPast ? Colors.deepPurple.shade300 : Colors.deepPurple.shade100,
          borderRadius: BorderRadius.circular(14)),
      height: 100,
      child: Center(
        child: child,
      ),
    );
  }
}
