import 'package:flutter/material.dart';
import 'package:zylu_employees_app/domain/models.dart';
import 'package:zylu_employees_app/utils/colors.dart';
import 'package:zylu_employees_app/utils/constants.dart';

class NameListContainer extends StatelessWidget {
  const NameListContainer({super.key, required this.employee});

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    DateTime start = DateTime.parse(employee.startdate);
    DateTime? end;
    employee.enddate == 'present'
        ? end = DateTime.now()
        : end = DateTime.parse(employee.enddate);
    final differenceYears = (end.difference(start).inDays / 365).floor();
    return Container(
      height: screenHeight / 10,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: lightgreen, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
                radius: 30, backgroundImage: NetworkImage(employee.profilepic)),
            sizedwten(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  employee.jobtitle,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const Spacer(),
            // Text('$differenceYears'),
            differenceYears >= 5 && employee.active == true
                ? const Icon(
                    Icons.flag,
                    color: Color.fromARGB(255, 0, 180, 5),
                  )
                : const Icon(
                    Icons.flag,
                    color: Colors.black,
                  ),
            sizedwten(context)
          ],
        ),
      ),
    );
  }
}
