import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController imagecontroller = TextEditingController();

  addtasktofirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = await auth.currentUser!;
    String uid = user.uid;
    var time = DateTime.now();
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(uid)
        .collection('mytasks')
        .doc(time.toString())
        .set({
      'title': titleController.text,
      'time': time.toString(),
      'timestamp': time
    });
    Fluttertoast.showToast(msg: 'Data Added');
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Records'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: TextField(

                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'Document Name', border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 10),
               Container(
                child: TextField(
                  controller: imagecontroller,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.add_a_photo),
                      labelText: 'Add Image', border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 10),

                  Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.purple.shade100;
                      return Colors.purple;
                    })),
                    child: Text(
                      'Add',
                    ),
                    onPressed: () async {
                      await addtasktofirebase();
                      titleController.clear();
                    },
                  )),
            ],
          )),
    );
  }
}
