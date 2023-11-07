import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_practice/Models/post_models.dart';




class HomeScreen extends GetView{
   HomeScreen({super.key});
  List<PostModel> postList = [];
  Future<List<PostModel>> getPostApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200){
      for(Map<String,dynamic> i in data){
        postList.add(PostModel.fromJson(i));
      }
      return postList;

    }else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f1f4),
      appBar: AppBar(
        title: const Text('Api Integration',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getPostApi(), builder: (context,snapshot){
              if(!snapshot.hasData){
                return const Center(child:  CircularProgressIndicator());
              }else{
                return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context,index){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Title',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(postList[index].title.toString()),
                        const SizedBox(height: 15,),
                        const Text('Description',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(postList[index].body.toString()),
                      ],
                    ),
                  );
                });
              }
            }),
          )
        ],
      ),
    );
  }
}