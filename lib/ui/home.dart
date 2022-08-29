import 'package:animacoesvetoriaiscomflare/blocs/videos_bloc.dart';
import 'package:animacoesvetoriaiscomflare/delegates/data_search.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import '../model/video.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset("images/yt_logo_rgb_dark.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Align(alignment: Alignment.center, child: Text("0")),
          IconButton(icon: Icon(Icons.star), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String? result = await showSearch(
                  context: context,
                  delegate: DataSearch(),
                  query: "videos de flutter",
                );
                if(result != null) {
                  BlocProvider.getBloc<VideosBloc>().inSearch.add(result);
                }
              }),
        ],
      ),
      body:  StreamBuilder(
          stream: BlocProvider.getBloc<VideosBloc>().outVideos,
          initialData: [],
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.hasData)
              return ListView.builder(
                itemBuilder: (context, index){
                  if(index < snapshot.data.length){
                    return Container(); //VideoTile(snapshot.data[index]);
                  } else if (index > 1){
                    BlocProvider.getBloc<VideosBloc>().inSearch.add(null);
                    return Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),
                    );
                  } else {
                    return Container();
                  }
                },
                itemCount: snapshot.data.length + 1,
              );
            else
              return Container();
          }
      ),
    );
  }
}
