import 'package:flutter/foundation.dart';
import '../models/place.dart';
import 'dart:io';
import '../helpers/db_helper.dart';
import '../helpers/location_helper.dart';


 import 'package:location/location.dart';
 import 'package:geocoder/geocoder.dart';
 import 'package:flutter/services.dart';


class GreatPlaces with ChangeNotifier{
  List <Place> _items=[];
  
  List <Place>get items{
    return[..._items];
  }
  Place findById(String id){
    return _items.firstWhere((place) => place.id==id);
  }
  //Future<void>
  void addPlace(String pickedTitle,File pickedImage,PlaceLocation pickedLocation)
  async{
    Address address= await getUserLocation(pickedLocation) ;
    
    
    
    print('hereeee');
    print(pickedLocation.longitude);
    String a =address.addressLine  + ' '+  address.featureName ;
    print(a);  // +' '+ address.adminArea;
    //print(address.locality);
     //String address1=address.locality.toString();   
   //final address=await LocationHelper.getPlaceAddress(pickedLocation.latitude, pickedLocation.longitude);
   
   //print(address);
    final updatedLocation=PlaceLocation(
      latitude:pickedLocation.latitude,
      longitude: pickedLocation.longitude,
      address: a //pickedLocation.address,
      
       );
    final newPlace=Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location: updatedLocation,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id':newPlace.id,
      'title':newPlace.title,
      'image':newPlace.image.path,
      'loc_lat': newPlace.location.latitude,
      'loc_lng':newPlace.location.longitude,
      'address': newPlace.location.address,
      });
  }
  Future <void> fetchAndSetPlaces() async{
    final dataList=await  DBHelper.getData('user_places');
    _items=dataList.map(
      (item)=>Place(
        id: item['id'],
        title: item['title'],
        image:File(item['image']) ,
        location: PlaceLocation(
          latitude: item['loc_lat'],
          longitude: item['loc_lng'],
          address: item['address'],
          
          ),

      ),
    ).toList();
    notifyListeners();

  }


 getUserLocation(PlaceLocation pickedLocation) async {
  //call this async method from whereever you need
    
      LocationData myLocation;
      String error;
      Location location = new Location();
      try {
        myLocation = await location.getLocation();
      } on PlatformException catch (e) {
        if (e.code == 'PERMISSION_DENIED') {
          error = 'please grant permission';
          print(error);
        }
        if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
          error = 'permission denied- please enable it from app settings';
          print(error);
        }
        myLocation = null;
      }
      final currentLocation = myLocation;
      final coordinates = new Coordinates(
          pickedLocation.latitude, pickedLocation.longitude);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(
          coordinates);
      var first = addresses.first;
      //print('here');
      print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
      return first;
    }








}

