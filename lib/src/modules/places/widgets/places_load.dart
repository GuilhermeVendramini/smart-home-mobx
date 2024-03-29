import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/languages/en/strings.dart';
import '../places_controller.dart';
import 'places_list.dart';

class PlacesLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<PlacesProvider>(context);
    return FutureBuilder<PlacesState>(
      future: _bloc.loadPlaces(),
      initialData: PlacesState.LOADING,
      builder: (BuildContext context, AsyncSnapshot<PlacesState> snapshot) {
        switch (snapshot.data) {
          case PlacesState.LOADING:
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            break;
          case PlacesState.FAIL:
            {
              return Center(
                child: Text(Strings.placesLoadingMessageError),
              );
            }
            break;
          case PlacesState.SUCCESS:
            {
              return PlacesList();
            }
            break;
          default:
            {
              return Container();
            }
        }
      },
    );
  }
}
