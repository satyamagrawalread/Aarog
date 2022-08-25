import 'package:flutter/material.dart';
import 'package:contra_care/features/reminders/models/medicine_type.dart';

class MedicineTypeCard extends StatelessWidget {
  final MedicineType pillType;
  final Function handler;
  MedicineTypeCard(this.pillType,this.handler);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        GestureDetector(
          onTap: () => handler(pillType),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            color: pillType.isChoose ? Color(0xffF5637F) :Colors.white,
            ),
            width: screenSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 2.0,),
                Container(width:50,height: 50.0,child: pillType.image),
                SizedBox(height: 7.0,),
                Container(child: Text(pillType.name,style: TextStyle(
                  color:pillType.isChoose ? Colors.white : Colors.black,fontWeight: FontWeight.w500
                ),)),
              ],
            ),

          ),
        ),
        SizedBox(width: 12.0,)
      ],
    );
  }
}
