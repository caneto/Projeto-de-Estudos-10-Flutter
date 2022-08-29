
import 'dart:ui';

import 'package:animacoesvetoriaiscomflare/api.dart';
import 'package:animacoesvetoriaiscomflare/model/video.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'dart:async';

class VideosBloc implements BlocBase {

  Api api;

  List<Video> videos;

  final StreamController _videosController = StreamController();
  Stream get outVideos => _videosController.stream;

  final StreamController _searchController = StreamController();
  Sink get inSearch => _searchController.sink;

  VideosBloc(){
    api = Api();

    _searchController.stream.listen(_search);
  }

  Future<void> _search(String? search) async {
    videos = await api.search(search!);
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    _videosController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();


  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
  
}