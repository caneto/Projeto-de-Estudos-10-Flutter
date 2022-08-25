import 'dart:convert';

import 'package:http/http.dart' as http;
const API_KEY="AIzaSyAhiBuV6Ay6OJJaFKMcDP-_9xQGalRlAcw";

  //https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
  //https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
  //http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json

class Api {

  search(String search) async {
    var url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10'
    );

    http.Response response = await http.get(url);

    decode(response);

  }

  decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      
    }
  }
}