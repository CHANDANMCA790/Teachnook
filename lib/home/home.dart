import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minorproject/helper/dbhelper.dart';

import '../drawer/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Map<String, dynamic>> _allData = [];
  bool _isLoading = true;
  void _refreshData() async{
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState(){
    super.initState();
    _refreshData();
  }

  Future<void> _addData() async{
    await SQLHelper.createData(_titleController.text, _descController.text);
    _refreshData();
  }
  Future<void> _updateData(int id) async{
    await SQLHelper.updateData(id, _titleController.text, _descController.text);
    _refreshData();
  }
  Future _deleteData(int id) async{
    await SQLHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("Contacts Deleted..!")));
    _refreshData();
  }
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void showBottomSheet(int? id) async{
    if(id!=null){
      final existingData = _allData.firstWhere((element) => element['id']==id);
      _titleController.text = existingData['title'];
      _descController.text = existingData['desc'];
    }
    showModalBottomSheet(elevation: 5, isScrollControlled: true, context: context, builder: (_) => Container(
      padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(), label: Text("Enter Name"),
              hintText: "Enter Name"
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _descController,
            maxLines: 1,
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Enter Mobile Number"),
                hintText: "Enter Mobile Number"
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                if(id == null) {
                  await _addData();
                }
                if(id != null) {
                  await _updateData(id);
                }
                _titleController.text = "";
                _descController.text = "";
                Navigator.of(context).pop();
                print("Data Added");
              },
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(id == null ? "New Contacts" : "Update Contacts",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("All Contacts Details"),
        content: Text("Do You want to exit this app..?"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("No")),
          ElevatedButton(onPressed: (){
            SystemNavigator.pop();
          }, child: Text("Yes")),
        ],
      ) );
      return false;
    },child: Scaffold(
      appBar: AppBar(
        title: Text('All Contact Details'),
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: _allData.length,

        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          margin: EdgeInsets.all(10),
          child: ListTile(
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(_allData[index]['title'],
              style: TextStyle(
                fontSize: 20,
              ),),
            ),
            subtitle: Text(_allData[index]['desc'],style: TextStyle(
              fontSize: 20,
            ),),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: (){
                  showBottomSheet(_allData[index]['id']);
                }, icon: Icon(Icons.edit, color: Colors.indigo,)),
                IconButton(onPressed: (){
                  _deleteData(_allData[index]['id']);
                }, icon: Icon(Icons.delete, color: Colors.redAccent,))
              ],
            ),
          ),
        ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(null),
        child: Icon(Icons.add),
      ),
      // drawer: appDrawer(context),
    ));
  }
}
