// GOOGLE_API_KEY = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';
const GOOGLE_API_KEY='AIzaSyAbx9fzQ32g6NNCfW0DC5D_IKPeBuJ6W4M';

class LocationHelper {
  static String generateLocationPreviewImage({double latitude, double longitude,}) {
    //return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}