import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class CreatePage extends StatefulWidget {
  const CreatePage({super.key});
  @override
  State<CreatePage> createState() => _CreatePageState();
}
class _CreatePageState extends State<CreatePage> {
  TextEditingController  nameController =TextEditingController();
  TextEditingController  companyController =TextEditingController();
  List princy = [];
  createUser() async {
    try {
      var res = await http.post(Uri.parse("https://reqres.in/api/users"),
          body: {"name":nameController.text , "job":  companyController.text});
      var data = jsonDecode(res.body);
      debugPrint(" data$data");
      princy.add(data);
      debugPrint(" princy$princy");
      setState(() {});
    } catch (e) {
      debugPrint("Error ==$e");
    }
  }
  @override
  void initState() {
    createUser();
    // TODO: implement initState
    super.initState();
  }
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child:TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter the name";
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: " Name"),
                  ),
                ),
              ] ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter the Company name";
                }
                return null;
              },
              controller: companyController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Company Name"),
            ),
          ),
          InkWell(
            onTap: () {
              createUser();
              nameController.clear();
              companyController.clear();
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(64),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Icon(Icons.add, color: Colors.black, size: 20),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: princy.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.cyan),
                    child: Column(
                      children: [
                        Text("${princy[index]['name']}"),
                        Text("${princy[index]['job']}"),
                        Text("${princy[index]['id']}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}