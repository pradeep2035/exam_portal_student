import 'package:flutter/material.dart';
import 'package:sat_exam_portal/components/progress_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StudentRegisterTimeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;
  const StudentRegisterTimeline({super.key, required this.isFirst, required this.isLast, required this.isPast, this.eventCard});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle:LineStyle(color: isPast? Colors.deepPurple:Colors.deepPurple.shade100) ,
      indicatorStyle: IndicatorStyle(
        width: 35,
        color:isPast? Colors.deepPurple:Colors.deepPurple.shade100,
        iconStyle: IconStyle(iconData:Icons.done_rounded,color: isPast?Colors.white:Colors.deepPurple.shade100)
      ),
      endChild:ProgressCard(isPast: isPast,
      child:eventCard ,),
    );
  }
}