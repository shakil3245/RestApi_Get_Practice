import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api/pageModel_withObjectStart.dart';

class UserBookModel extends StatelessWidget {
  const UserBookModel({Key? key}) : super(key: key);

  Future<UserPageModel> getUserBook() async {
    final response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return UserPageModel.fromJson(data);
    } else {
      return UserPageModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: FutureBuilder<UserPageModel>(
            future:getUserBook() ,
            builder:(context, snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }else{
                return ListView.builder(
                    itemCount: snapshot.data?.data?.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Column(children: [
                          Text(snapshot.data!.data![index].id.toString()),
                          Text(snapshot.data!.total.toString()),
                          Text(snapshot.data!.data![index].firstName.toString()),
                          ClipRRect(
                            child: Image.network(snapshot.data!.data![index].avatar.toString(),),
                            borderRadius: BorderRadius.circular(20),
                          )
                          
                        ],),
                      );
                    });
              }
            } ,))
        ],
      ),
    );
  }
}
