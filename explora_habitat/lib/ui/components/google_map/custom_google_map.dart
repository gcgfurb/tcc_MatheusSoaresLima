import 'package:explora_habitat/helpers/geolocator_manager.dart';
import 'package:explora_habitat/services/stores/response_theme_store.dart';
import 'package:explora_habitat/ui/widgets/custom_alert_dialog.dart';
import 'package:explora_habitat/ui/widgets/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CustomGoogleMap extends StatefulWidget {
  @override
  State<CustomGoogleMap> createState() => CustomGoogleMapState();
}

class CustomGoogleMapState extends State<CustomGoogleMap> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    final ResponseThemeStore responseThemeStore =
        Provider.of<ResponseThemeStore>(context);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    List<Marker> markers = responseThemeStore.responses
        .map(
          (response) => Marker(
            markerId: const MarkerId("1"),
            position: LatLng(
              response.latitude!,
              response.longitude!,
            ),
            onTap: () => showDialog(
              context: context,
              builder: (_) => CustomAlertDialog(
                title: "Teste",
                body: const Text("Teste"),
                onCancel: () => Navigator.pop(context),
              ),
            ),
          ),
        )
        .toList();

    return FutureBuilder<Position>(
        future: GeolocatorManager().getCurrentPosition(),
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return ErrorIndicator(message: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return Observer(
              builder: (_) => GoogleMap(
                onMapCreated: _onMapCreated,
                markers: markers.toSet(),
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    snapshot.data!.latitude,
                    snapshot.data!.longitude,
                  ),
                  zoom: 10.0,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
