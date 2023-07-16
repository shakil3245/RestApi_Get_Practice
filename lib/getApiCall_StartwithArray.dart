import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api/usermodel_startWithArray.dart';
class GetApiCall extends StatelessWidget {
   GetApiCall({Key? key}) : super(key: key);

 List<UserModel> userList =[];

 Future< List<UserModel>> getUserApi() async{
   final response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
   var data = jsonDecode(response.body.toString());

   if(response.statusCode == 200){
     for(Map i in data){
       userList.add(UserModel.fromJson(i));
     }
     return userList;
   }else{
     return userList;
   }
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            Expanded(child: FutureBuilder(
              future: getUserApi(),
              builder: (context,AsyncSnapshot< List<UserModel>> snapshot){
             if(!snapshot.hasData){
               return Center(child: CircularProgressIndicator());
             }else{
               return ListView.builder(
                   itemCount: userList.length,
                   itemBuilder: (context,index){
                     return Card(
                       child: Column(children: [
                            Column(
                              children: [
                                Text("Name : "+snapshot.data![index].name.toString()),
                                Text("Phone : "+snapshot.data![index].phone.toString()),
                                Text("Address : "+snapshot.data![index].address!.city.toString()),
                                Text("lat : "+snapshot.data![index].address!.geo!.lat.toString()),

                              ],
                            )
                       ],),
                     );

                   });
             }
              },))
        ],
      ),
    );
  }
}
