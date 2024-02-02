import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zylu_employees_app/domain/models.dart';

class FirebaseFunctions{

  Future getEmployeeData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('employees').get();

    List<Employee> employeeList = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      return Employee(
        name: data['name'],
        jobtitle: data['jobtitle'],
        startdate: data['startdate'],
        enddate: data['enddate'],
        active: data['active'],
      );
    }).toList();

    return employeeList;
  }
  
}