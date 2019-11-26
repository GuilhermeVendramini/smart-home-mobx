import 'package:smart_home_mbox/src/repositories/sqflite/places/sqflite_places_repository.dart';
import 'package:smart_home_mbox/src/shared/models/place/place_model.dart';


enum PlacesState { LOADING, SUCCESS, FAIL }

class PlacesBloc {
  final SQFLitePlacesRepository _placesRepository;

  PlacesBloc(this._placesRepository);

  List<PlaceModel> _places = [];
}

class Places extends PlacesBloc {
  Places(SQFLitePlacesRepository placesRepository) : super(placesRepository);

  List<PlaceModel> get getPlaces => _places;
}

class PlacesProvider extends Places {
  PlacesProvider(SQFLitePlacesRepository placesRepository)
      : super(placesRepository);

  Future<PlacesState> loadPlaces({bool cached = true}) async {
    if (cached && _places.isNotEmpty) {
      return PlacesState.SUCCESS;
    }

    try {
      List<PlaceModel> _placesResult = List<PlaceModel>();
      _placesResult = await _placesRepository.getPlaces();
      if (_placesResult.isEmpty) {
        return PlacesState.SUCCESS;
      }

      _places = _placesResult;
      return PlacesState.SUCCESS;
    } catch (e) {
      print('places_bloc:loadPlaces() $e');
      return PlacesState.FAIL;
    }
  }

  bool addPlace(PlaceModel place) {
    try {
      _places.add(place);
      return true;
    } catch (e) {
      print('places_bloc:addPlace() $e');
      return false;
    }
  }
}
