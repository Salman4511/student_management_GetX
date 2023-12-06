import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/controller/list_ontroller.dart';
import 'package:student_getx/core/constrains.dart';
import 'package:student_getx/view/add_student.dart';
import 'package:student_getx/view/student_details.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryclr,
        title: TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (query) {
                  controller.filterStudents(query);
                },
                decoration: const InputDecoration(
                  hintText: 'Search student here',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              controller.toggleSearch();
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Obx(() {
        return controller.filteredStudents.isEmpty
            ? const Center(
                child: Text(
                  'No students found.',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 4,
                      wordSpacing: 5),
                ),
              )
            // : GridView.builder(
            //     padding: const EdgeInsets.all(8.0),
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 8.0,
            //       mainAxisSpacing: 8.0,
            //     ),
            //     itemCount: controller.filteredStudents.length,
            //     itemBuilder: (context, index) {
            //       final student = controller.filteredStudents[index];
            //       return GestureDetector(
            //         onTap: () {
            //           Get.to(StudentDetailspage(student: student))
            //               ?.then((value) => controller.refreshStudentList());
            //         },
            //         child: Card(
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               CircleAvatar(
            //                 radius: 55.0,
            //                 backgroundImage:
            //                     FileImage(File(student.profilePicture)),
            //               ),
            //               const SizedBox(height: 8.0),
            //               Text(
            //                 student.name,
            //                 style: const TextStyle(
            //                     fontFamily: 'Comfortaa',
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   );
        : ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: controller.filteredStudents.length,
            itemBuilder: (context, index) {
              final student = controller.filteredStudents[index];
              return GestureDetector(
                onTap: () {
                  Get.to(StudentDetailspage(student: student))
                      ! .then((value) => controller.refreshStudentList());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child:

                    //  ListTile(
                    //   leading: CircleAvatar(
                    //     radius: 27.0,
                    //     backgroundImage:
                    //         FileImage(File(student.profilePicture)),
                    //   ),
                    //   title: Text(
                    //     student.name,
                    //     style: const TextStyle(
                    //       fontFamily: 'Comfortaa',
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   subtitle: Text( 'Age : ${student.age.toString()}',
                    //     style: const TextStyle(
                     
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                     
                    //                  ),
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.blueGrey
                        ),
                        height: 80,
                        child: Row(
                          children: [
                            const SizedBox(width: 20,),
                            CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            FileImage(File(student.profilePicture)),
                      ),
                       const SizedBox(width: 20,),

                       Column(
                         children: [
                          const SizedBox(height: 20,),
                           Text(
                            student.name,
                            style: const TextStyle(
                              overflow: TextOverflow.fade,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              fontSize: 19
                            ),
                      ),
                      const SizedBox(height: 5,),
                       Text( 'Age : ${student.age.toString()}',
                        style: const TextStyle(
                     
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                         ],
                       ),
                          ],
                        ),
                      ),
                    )
                ),
              );
            },
          );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddStudentScreen())!
              .then((value) => controller.refreshStudentList());
        },
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
