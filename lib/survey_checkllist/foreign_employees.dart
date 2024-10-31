import 'package:flutter/material.dart';
import 'package:wps_survey/helper/appcolors.dart';

import '../helper/size_config.dart';

class ForeignEmployees extends StatefulWidget {
  @override
  _ForeignEmployeesState createState() => _ForeignEmployeesState();
}

class _ForeignEmployeesState extends State<ForeignEmployees> {
  List<EmployeeForm> employeeForms = [EmployeeForm()];

  void addEmployeeForm() {
    setState(() {
      employeeForms.add(EmployeeForm());
    });
  }

  void deleteLastEmployeeForm() {
    if (employeeForms.length > 1) {
      setState(() {
        employeeForms.removeLast();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('At least one employee form is required')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Foreign Employees Statistics',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: SizeConfig.textMultiplier * 2,
              ),
            ),
            Stack(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: employeeForms.length,
                  itemBuilder: (context, index) {
                    return employeeForms[index];
                  },
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Text(
                    '${employeeForms.length}',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: SizeConfig.textMultiplier * 2,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: SizeConfig.widthMultiplier * 35,
                  height: SizeConfig.heightMultiplier * 5.5,
                  decoration: BoxDecoration(
                    color: const Color(0xFF037971),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF037971)),
                  ),
                  child: TextButton(
                    onPressed: addEmployeeForm,
                    child: Text(
                      'Add Employee',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                ),
                employeeForms.length < 2
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 1),
                        child: Container(
                          width: SizeConfig.widthMultiplier * 35,
                          height: SizeConfig.heightMultiplier * 5.5,
                          decoration: BoxDecoration(
                            color: Colors.red[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: deleteLastEmployeeForm,
                            child: Text(
                              'Remove',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 1.8,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeForm extends StatefulWidget {
  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  String? nationality;
  DateTime? startDate;
  DateTime? endDate;
  String? gender;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                child: Text(
                  'Name of the employee',
                  style: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
                  child: TextFormField(
                    controller: employeeNameController,
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Enter employee name',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                child: Text(
                  'Position',
                  style: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
                  child: TextFormField(
                    controller: positionController,
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Enter employee position',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                child: Text(
                  'Nationality',
                  style: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
                  child: DropdownButtonFormField<String>(
                    value: nationality,
                    decoration: const InputDecoration(
                      hintText: 'Select nationality',
                      border: InputBorder.none,
                    ),
                    items: <String>['American', 'British', 'Chinese', 'Indian', 'Other'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        nationality = newValue;
                      });
                    },
                    validator: (value) => value == null ? 'Please select a nationality' : null,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                child: Text(
                  'Passport Number',
                  style: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
                  child: TextFormField(
                    controller: passportController,
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Enter Passport Number',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                child: Text(
                  'Gender',
                  style: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
                  child: DropdownButtonFormField<String>(
                    value: gender,
                    decoration: const InputDecoration(hintText: 'Select Gender', border: InputBorder.none),
                    items: <String>['Male', 'Female', 'Other'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        gender = newValue;
                      });
                    },
                    validator: (value) => value == null ? 'Please select a gender' : null,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                          child: Text(
                            'Start Date',
                            style: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              fontSize: SizeConfig.textMultiplier * 1.8,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context, true),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: AbsorbPointer(
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: startDate != null ? '${startDate!.year}/${startDate!.month}/${startDate!.day}' : 'Start Date',
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.calendar_today,
                                    size: SizeConfig.heightMultiplier * 2.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                          child: Text(
                            'End Date',
                            style: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              fontSize: SizeConfig.textMultiplier * 1.8,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context, false),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: AbsorbPointer(
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: endDate != null ? endDate.toString().substring(0, 10) : 'End Date',
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.calendar_today,
                                    size: SizeConfig.heightMultiplier * 2.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
