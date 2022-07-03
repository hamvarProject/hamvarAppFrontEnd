import 'package:flutter/material.dart';
import 'package:hamvar2/bottom_navigator.dart';
import 'package:mapir_raster/mapir_raster.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hamvar2/map_filters.dart';

class MapPage extends StatefulWidget {

  final Position location;
  const MapPage(this.location);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "نقشه",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE4F9FC),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 25, top: 100),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.5),
              child: IconButton(
                icon: const Icon(Icons.near_me_outlined),
                iconSize: 50,
                color: const Color(0xFF3BBDD3),
                onPressed: () async {
                  Position location;
                  location = await displayCurrentLocation();
                  if (!mounted) return;
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MapPage(location)));
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.manage_search_outlined),
              iconSize: 50,
              color: const Color(0xFF3BBDD3),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return FractionallySizedBox(
                        heightFactor: 0.85, child: MapFilterSpage());
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: MapirMap(
        apiKey:
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijc2NDI4NTA2NTViMjA2ZTk3MjQyZWNiNzU1M2VlYzQ4M2E2NzE4NGYxNmNkYWQ2MDJjNzlkZmE1NzAwMjU0MDUzNjI2YWUwMTdkOThlOTE4In0.eyJhdWQiOiIxODM3OSIsImp0aSI6Ijc2NDI4NTA2NTViMjA2ZTk3MjQyZWNiNzU1M2VlYzQ4M2E2NzE4NGYxNmNkYWQ2MDJjNzlkZmE1NzAwMjU0MDUzNjI2YWUwMTdkOThlOTE4IiwiaWF0IjoxNjU1MjAyNDY1LCJuYmYiOjE2NTUyMDI0NjUsImV4cCI6MTY1Nzc5NDQ2NSwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.ZqxcS0uCQLmcVM04Ns-PKYCBEbpjoxDB1Ym-pmQ-65mZgokHf7IiNQyebky3v37R40u0np6qcs0jqixpBnvdJuFhYpjTrqxjGxZ0L1dJeFLRAfQuRkipxNWZ6Ls_hQ6QYrKSu_MQ2RSZEtkZLGi2mhUUZXo3Bs23ocNMbLv7smuVBqMbuxKc3Vzy8PusruImwYrooX2M0Y9gi0KbFUPcZsDyy6UWN7f1ltEIoE5_dqSj01ar5zDPsgEcPUVkgOb9FlhXPMa9Wx1r12Pryni_5BB3MMSUPOmpxr7hUKEhXa0R9wSTpJAXLkbdB54ZIlurW4w-jkznYmEifznKtyWPgg",
        options: MapOptions(
          center: LatLng(widget.location.latitude, widget.location.longitude),
          zoom: 16,
        ),
        layers: [
          MarkerLayerOptions(
            markers: [
              Marker(
                point:
                    LatLng(widget.location.latitude, widget.location.longitude),
                builder: (ctx) => const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Color(0xFF3BBDD3),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigatorPage(false, false, false, true),
    );
  }

  Future<Position> displayCurrentLocation() async {
    Position _location;

    await Geolocator.requestPermission();

    return _location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
