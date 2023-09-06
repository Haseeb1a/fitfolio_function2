// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:workouttraker/function/db_functions/db_functions.dart';
// import 'package:workouttraker/model/task_model/workoutmodel1.dart';

// class UpdateScreen extends StatefulWidget {
//   final String typename;
//   final String weight;
//   final String sets;
//   final String reps;
//   final int index;
//   final DateTime date;
//   final String duration;
  
//   // final String img;
//  const  UpdateScreen(
//       {super.key,
//       required this.typename,
//       required this.weight,
//       required this.sets,
//        required this.index,
//        required this.date,
//        required this.duration,
      
//       // required this.img,
//       required this.reps});

//   @override
//   State<UpdateScreen> createState() => _UpdateScreenState();
// }

// class _UpdateScreenState extends State<UpdateScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final _typenameController = TextEditingController(text: widget.typename);
// final _weightController = TextEditingController(text: widget.weight);

//     final _setsController = TextEditingController(text: widget.sets);
//     final _repsController = TextEditingController(text: widget.reps);
//    final _dateController = TextEditingController(
//         text: DateFormat('yyyy-MM-dd').format(widget.date));
//     final _dropdownController = TextEditingController(text: widget.duration);
//     String _selectedValue = 'Day';
//     @override
//   void initState() {
//     super.initState();
//     _dropdownController.text = _selectedValue;
//   }
// Future<void> _selectDate() async {
//   DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(2000),
//     lastDate: DateTime(2100),
//   );
//   if (picked != null) {
//     setState(() {
//       _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
//     });
//   }
// }

//     return Scaffold(
//            appBar: AppBar(backgroundColor: Color.fromARGB(225, 27, 57, 61),),
//           body: AlertDialog(
            
//              backgroundColor: Color.fromARGB(255, 0, 0, 0),
//                             title: Text('kddjh'),
//                             content:
//                              Container(
//                               height: 380,
//                                child: Column(
//                                 children: [
//                                  TextFormField(
//                                   controller: _typenameController,
//                                   keyboardType: TextInputType.name,
//                                    decoration: InputDecoration(
                                    
                                    
//                                     hintText: 'TYPE NAME',
//                                            filled: true,
//                                            fillColor: const Color.fromARGB(255, 255, 255, 255),
//                                            border: OutlineInputBorder(
                                             
//                                              borderSide: BorderSide.none,
//                                              borderRadius: BorderRadius.circular(15)
//                                            ),
//                                          ),
//                                  ),
//                                  SizedBox(
//                                   height: 16,
//                                  ),
//                                  TextFormField(
//                                   controller: _weightController,
//                                    keyboardType: TextInputType.number,
//                                    decoration: InputDecoration(
                                    
//                                     hintText: 'KG',
//                                            filled: true,
//                                            fillColor: const Color.fromARGB(255, 255, 255, 255),
//                                            border: OutlineInputBorder(
                                             
//                                              borderSide: BorderSide.none,
//                                              borderRadius: BorderRadius.circular(15)
//                                            ),
//                                          ),
//                                  ),
//                                  SizedBox(
//                                   height: 16,
//                                  ),
//                                  TextFormField(
//                                   controller: _setsController,
//                                   keyboardType: TextInputType.number,
//                                    decoration: InputDecoration(
//                                     hintText: 'SETS',
//                                            filled: true,
//                                            fillColor: const Color.fromARGB(255, 255, 255, 255),
//                                            border: OutlineInputBorder(
                                             
//                                              borderSide: BorderSide.none,
//                                              borderRadius: BorderRadius.circular(15)
//                                            ),
//                                          ),
//                                  ),
//                                  SizedBox(
//                                   height: 16,
//                                  ),
//                                  TextFormField(
//                                   controller: _repsController,
//                                    keyboardType: TextInputType.number,
//                                    decoration: InputDecoration(
//                                     hintText: 'REPS',
//                                            filled: true,
//                                            fillColor: const Color.fromARGB(255, 255, 255, 255),
//                                            border: OutlineInputBorder(
                                             
//                                              borderSide: BorderSide.none,
//                                              borderRadius: BorderRadius.circular(15)
//                                            ),
//                                          ),
//                                  ),
//                                   SizedBox(
//                                   height: 16,
//                                  ),
//                                   TextFormField(
//                                   controller: _dateController,
//                                    keyboardType: TextInputType.number,
//                                    decoration: InputDecoration(
//                                     labelText: 'Date',
//                                            filled: true,
//                                            prefixIcon: Icon(Icons.calendar_today),
//                                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                                           
//                                            border: OutlineInputBorder(
                                             
//                                              borderSide: BorderSide.none,
//                                              borderRadius: BorderRadius.circular(15)
//                                            ),
//                                          ),
//                                          readOnly: true,
//                                          onTap: (){
//                                           _selectDate();
//                                          },
//                                  ),
//                                  SizedBox(
//                                   height: 16,
//                                  ),
//                                  Container(
//                                   height: 40,
//                                   width: 300,
//                                   // color: Colors.white,
//                                   decoration: BoxDecoration(
                                    
                              
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(15)
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
                                  
//              DropdownButton<String>(
//           alignment: Alignment.bottomCenter,
//           padding: EdgeInsetsDirectional.all(3),
//           borderRadius: BorderRadius.circular(15),
//           value: _dropdownController.text, // Set the current selected value from the controller.
//           items: <String>['Day', 'Week', 'Month']
//             .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(
//                   value,
//                   style: TextStyle(fontSize: 15),
//                 ),
//               );
//             }).toList(),
//           onChanged: (String? newValue) {
//           setState(() {
//             _selectedValue = newValue!; // Update the state variable with the selected value.
//             _dropdownController.text = _selectedValue; // Update the controller's text.
//           });
//           },
//             ),
                              
//                                     ],
//                                   ),
//                                  )
//                                 ],
//                                                ),
//                              ),
                              
//                             actions: [
//                               MaterialButton(
//                                 onPressed: (
                                
//                               ) {
//     Workoutmodel studentmodel = Workoutmodel(
//       id: widget.index,
//       typename: _typenameController.text,
//       weight: _weightController.text,
//       sets: _setsController.text,
//       reps: _repsController.text,
//       date: DateTime.parse(_dateController.text),
//       duration: _dropdownController.text,
//     );

//     updateTask(widget.index, studentmodel);
//     Navigator.pop(context);
//   },
//                               color: Colors.white,
//                               child: Text('ADD'),
//                               )
//                             ],
//           ),
//         );

// }
// }
// -----------------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:workouttraker/function/db_functions/db_functions.dart';
import 'package:workouttraker/model/task_model/workoutmodel1.dart';

class UpdateScreen extends StatefulWidget {
  final String typename;
  final String weight;
  final String sets;
  final String reps;
  final int index;
  final DateTime date;
  final String duration;
  final bool isChecked; 

  const UpdateScreen({
    Key? key,
    required this.typename,
    required this.weight,
    required this.sets,
    required this.index,
    required this.date,
    required this.duration,
    required this.reps,
    required this.isChecked, 
  }) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _typenameController = TextEditingController();
  final _weightController = TextEditingController();
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();
  final _dateController = TextEditingController();
  final _dropdownController = TextEditingController();
  String _selectedValue = 'Day';

  @override
  void initState() {
    super.initState();
    _typenameController.text = widget.typename;
    _weightController.text = widget.weight;
     _repsController.text = widget.reps;
    _setsController.text = widget.sets;
   
    _dateController.text = DateFormat('yyyy-MM-dd').format(widget.date);
    _dropdownController.text = widget.duration;
    // _isChecked = widget.isChecked;
  }
  

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
  String? _validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(225, 27, 57, 61)),
      body: AlertDialog(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Update Workout'),
        content: Container(
          height: 380,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _typenameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'TYPE NAME',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: _validateTextField,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _weightController,
                    maxLength: 3,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'KG',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                      validator: _validateTextField,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _setsController,
                    maxLength: 3,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'SETS',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                      validator: _validateTextField,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _repsController,
                    maxLength: 3,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'REPS',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                      validator: _validateTextField,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      // labelText: 'Date',
                      filled: true,
                      prefixIcon: const Icon(Icons.calendar_today),
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    readOnly: true,
                    onTap: _selectDate,
                      validator: _validateTextField,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsetsDirectional.all(3),
                          borderRadius: BorderRadius.circular(15),
                          value: _dropdownController.text,
                          items: <String>['Day', 'Week', 'Month']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 15),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValue = newValue!;
                              _dropdownController.text = _selectedValue;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
               if (_formKey.currentState!.validate()){
              Workoutmodel studentmodel = Workoutmodel(
                id: widget.index,
                typename: _typenameController.text,
                weight: _weightController.text,
                    reps: _repsController.text,
                sets: _setsController.text,
            
                date: DateTime.parse(_dateController.text),
                duration: _dropdownController.text,
                // isChecked: widget.isChecked,
               // isChecked: isChecked, 
              );

              updateTask(widget.index, studentmodel);
              Navigator.pop(context);
            }},
            color: Colors.white,
            child: const Text('UPDATE'),
          )
        ],
      ),
    );
  }
}