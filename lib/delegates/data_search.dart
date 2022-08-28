import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query="";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return (
      IconButton(
        onPressed: (){
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.arrow_menu,
          progress: transitionAnimation,
        ),
      )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).then((_)=>close(context, query));

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty)
      return Container();
    else
      return FutureBuilder<List>(
        future: suggestions(query),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(snapshot.data![index]),
                  leading: Icon(Icons.play_arrow),
                  onTap: (){
                    close(context, snapshot.data![index]);
                  },
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
        },
      );
  }

  Future<List> suggestions(String search) async {

    var url = Uri.parse(
        'http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json'
    );

    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      return json.decode(response.body)[1].map((v){
        return v[0];
      }).toList();
    } else {
      throw Exception("Failed to load suggestions");
    }
  }
}
