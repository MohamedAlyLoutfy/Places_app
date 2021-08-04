import 'dart:convert';
import 'package:http/http.dart' as http;
// GOOGLE_API_KEY = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';
const GOOGLE_API_KEY='AIzaSyDfonhiKtNA3UvOgWdtOzv4Y56yMUluWh0';

class LocationHelper {
  static String generateLocationPreviewImage({double latitude, double longitude,}) {
    //return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  
  }
  static Future <String> getPlaceAddress(double lat,double lng)async{
    final url='https://maps.googleapis.com/maps/api/geocode/json?latlng=&key=$lat,$lng$GOOGLE_API_KEY';
    final response=await http.get(Uri.parse(url));
    return json.decode(response.body)['results'][0]['formatted_address'];

  }
}