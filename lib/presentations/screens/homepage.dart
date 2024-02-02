import 'package:flutter/material.dart';
import 'package:zylu_employees_app/data/firebase_functions.dart';
import 'package:zylu_employees_app/domain/models.dart';
import 'package:zylu_employees_app/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var employeeList = await FirebaseFunctions().getEmployeeData();
    return employeeList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                  children: [
            Text('Employee List'),
            sizedten(context),
            FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Employee> employeeList = snapshot.data as List<Employee>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: employeeList.length,
                      itemBuilder: (context, index) {
                        Employee employee = employeeList[index];
                        return Container(
                          height: 100,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.amber
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/images/zylu_logo.jpg')),
                                sizedwten(context),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(employee.name),
                                    Text(employee.jobtitle)
                                  ],
                                ),
                            ],),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            )
                  ],
                ),
          )),
    );
  }
}
