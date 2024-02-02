import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:zylu_employees_app/data/firebase_functions.dart';
import 'package:zylu_employees_app/domain/models.dart';
import 'package:zylu_employees_app/presentations/widgets/loadingwidget.dart';
import 'package:zylu_employees_app/presentations/widgets/namelistcontainer.dart';
import 'package:zylu_employees_app/utils/colors.dart';
import 'package:zylu_employees_app/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  fetchData() async {
    var employeeList = await FirebaseFunctions().getEmployeeData();
    return employeeList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Welcome to Zylu!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    const Text(
                      'Employee List',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    sizedten(context),
                    FutureBuilder(
                      future: fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Expanded(child: LoadingWidget());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          List<Employee> employeeList =
                              snapshot.data as List<Employee>;
                          return Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  sizedten(context),
                              itemCount: employeeList.length,
                              itemBuilder: (context, index) {
                                Employee employee = employeeList[index];
                                return NameListContainer(employee: employee);
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
