import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workouttraker/sub_screens_wtd/settings_sub/about.dart';
import 'package:workouttraker/sub_screens_wtd/settings_sub/profile.dart';
import 'package:workouttraker/utility/reset_function.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void clossAPP(){
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(225, 27, 57, 61),

        title: const Center(child: Text('Settings')),

      ),
      backgroundColor: const Color.fromARGB(225, 27, 57, 61),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap:(){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>const Profile(),));
                },
                child: Container(
                                  width: 360,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    border: Border.all(
                                        color: const Color.fromARGB(255, 255, 255, 255)),
                                  ),
      
                                  child: const Row(
      
      
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:[  Icon(Icons.person_pin,size: 50,),
                                      Text(
                                      'PROFILE',
                                      style: TextStyle(fontSize: 27),
              
                                    ),]
                                  )),
              ),
              
            ),
            const SizedBox(
              height: 27,
            ),
            GestureDetector(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const About(),));
              },
              child: Container(
                                 width: 360,
                                  height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  border: Border.all(
                                      color: const Color.fromARGB(255, 255, 255, 255)),
                                ),
      
                                child:const  Center(
      
                                  child: Text(
                                    'ABOUT',
                                    style: TextStyle(fontSize: 27),
                                  ),
                                )),
            ),
             const SizedBox(
              height: 27,
            ),
                              GestureDetector(
                               onTap: () {
                                 resetDB(context);
                               },
                                child: Container(
                                 width: 360,
                                  height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  border: Border.all(
                                      color: const Color.fromARGB(255, 255, 255, 255)),
                                ),
                                    
                                    
                                  child: const Center(
                                    child: Text(
                                      'RESET',
                                      style: TextStyle(fontSize: 27),
                                    ),
                                  ),
                                ),
                              ),
                               const SizedBox(
              height: 27,
            ),
                              GestureDetector(
                                onTap: () =>exit(0),
                                child: Container(
                                  width: 360,
                                  height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  border: Border.all(
                                      color: const Color.fromARGB(255, 255, 255, 255)),
                                ),
                                    
                                child: const Center(
                                    
                                    
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('EXIT',style: TextStyle(fontSize: 27),),
                                      Icon(
                                        Icons.exit_to_app,size: 30,
                                        // style: TextStyle(fontSize: 30),
                                      ),
                                    ],
                                  ),
                                ),
                                ),
                              ),
          ]
                              
                              ),
      ),
    ); 
  }
}