import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'utils.dart';
import 'dart:typed_data';

List<Map<String, dynamic>> events = [
  {'id': 0, 'name': 'Hot Events', 'date': ''},
  {'id': 1, 'name': 'Pandawara Clean Day', 'date': '3rd of June'},
  {'id': 2, 'name': 'Starbucks Go Green', 'date': '9th of December'},
  {'id': 3, 'name': 'Annie\'s Clean Suburb', 'date': '1st of January'},
  {'id': 4, 'name': '#TeamTrees FREE JOIN!', 'date': '19th of May'},
  {'id': 5, 'name': 'Events Near You', 'date': ''},
  {'id': 6, 'name': 'Healthy Indonesian', 'date': '4th of July'},
  {'id': 7, 'name': 'Green Environment', 'date': 'Today!'},
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.camera);
    if (img == null) {
      setState(() {
        _image = img;
      });
      // Show a Thank you dialog after the image is captured
      _showThankYouDialog();
    }
  }

  // Function to show the Thank you dialog
  void _showThankYouDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Center(
            child: Text(
              'We Have Marked Your Location!',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 19),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/logo/ourteam.png', // Replace this with your image asset path
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "We're going to send our team and community to clean the area.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontFamily: 'Poppins Light',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Thank you!',
                style: TextStyle(
                  color: const Color.fromARGB(255, 28, 114, 49),
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Mapping of event names to icons
  final Map<String, IconData> eventIcons = {
    'Hot Events': Icons.event_available,
    'Pandawara Clean Day': Icons.cleaning_services,
    'Starbucks Go Green': Icons.eco,
    'Annie\'s Clean Suburb': Icons.home,
    '#TeamTrees FREE JOIN!': Icons.nature,
    'Events Near You': Icons.place,
    'Healthy Indonesian': Icons.favorite,
    'Green Environment': Icons.eco,
  };
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-6.169508793716249, 106.78639719904223),
    zoom: 14,
  );

  final List<Marker> _marker = [];
  final List<Marker> _List = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(-6.169508793716249, 106.78639719904223),
      infoWindow: InfoWindow(
          title: 'Your Capture Location (Trash Area)',
          snippet: 'You Captured This Location'),
    ),
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(-6.170228345589793, 106.78657348603859),
      infoWindow: InfoWindow(
        title: 'Annice\'s Capture Location (Trash Area)',
        snippet: '\"It\'s really smelly! Come clean it up please!\"',
      ),
    ),
    const Marker(
      markerId: MarkerId('3'),
      position: LatLng(-6.166719852463272, 106.77935324410598),
      infoWindow: InfoWindow(
        title: 'Rusdi\'s Capture Location (Trash Area)',
        snippet: '\"Pandawara team, we\'re hoping you for this ^^\"',
      ),
    ),
    const Marker(
      markerId: MarkerId('4'),
      position: LatLng(-6.165147554293477, 106.79291130888893),
      infoWindow: InfoWindow(
        title: 'Ben\'s Capture Location (Trash Area)',
        snippet: '\"This area is covered by trash, let\'s save the earth!\"',
      ),
    ),
    const Marker(
      markerId: MarkerId('5'),
      position: LatLng(-6.17077158719092, 106.79089696992689),
      infoWindow: InfoWindow(
        title: 'Pamela\'s Capture Location',
        snippet: '\"#GOGREEN Let\'s Go Guys!\"',
      ),
    ),
    const Marker(
      markerId: MarkerId('6'),
      position: LatLng(-6.175323570095168, 106.79591538289286),
      infoWindow: InfoWindow(
        title: 'Melani\'s Capture Location',
        snippet: '\"We can do it if we are together :D\"',
      ),
    ),
    const Marker(
      markerId: MarkerId('7'),
      position: LatLng(-6.1754942353896505, 106.78675295696003),
      infoWindow: InfoWindow(
        title: 'Melani\'s Capture Location',
        snippet: '\"I don\'t really like trash everywhere, let\'s clean it!\"',
      ),
    ),
    const Marker(
      markerId: MarkerId('8'),
      position: LatLng(-6.173803580218321, 106.78431214684053),
      infoWindow: InfoWindow(
        title: 'Melani\'s Capture Location',
        snippet: '\"#TEAMTRASH I believe you are on your way :)\"',
      ),
    ),
    const Marker(
      markerId: MarkerId('9'),
      position: LatLng(-6.171846253475241, 106.7902022777615),
      infoWindow: InfoWindow(
        title: 'Melani\'s Capture Location',
        snippet: '\"Sustainability is number 1 ^-^\"',
      ),
    ),
    const Marker(
      markerId: MarkerId('10'),
      position: LatLng(-6.170160919895756, 106.78937079305838),
      infoWindow: InfoWindow(
        title: 'Melani\'s Capture Location',
        snippet: '\"Safe, Clean, and GREEN :O\"',
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_List);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 900,
            color: Colors.white, // First container's background color
            child: Scaffold(
              body: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  markers: Set<Marker>.of(_marker),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  }),
            ),
          ),
          FractionalTranslation(
            translation: const Offset(0, 5),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 100, // Adjust the height of the button
              color: Colors.white,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color.fromARGB(255, 30, 90, 22),
                ),
                onPressed: selectImage,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Capture A Trash",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 170 / MediaQuery.of(context).size.height,
            minChildSize: 170 / MediaQuery.of(context).size.height,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 30, 90, 22),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    // Add the rounded rectangle shape above "Hot Events"
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Container(
                          width: 60,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: events.length,
                        itemBuilder: (BuildContext context, int index) {
                          final eventName = events[index]['name'];
                          final eventDate = events[index]['date'];
                          final isHotEvent = eventName == 'Hot Events' ||
                              eventName == 'Events Near You';
                          final backgroundColor = isHotEvent
                              ? const Color.fromARGB(255, 47, 141, 39)
                              : const Color.fromARGB(255, 19, 102, 11);
                          final textColor = isHotEvent
                              ? Colors.white
                              : const Color.fromARGB(255, 252, 252, 252);
                          final fontSize = isHotEvent ? 19.0 : 16.0;
                          final iconData = eventIcons[eventName] ?? Icons.event;

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ListTile(
                                leading: Icon(
                                  iconData,
                                  color: textColor,
                                  size: 25,
                                ),
                                title: Text(
                                  eventName,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: textColor,
                                    fontSize: fontSize,
                                  ),
                                ),
                                subtitle: isHotEvent
                                    ? null // Hide the subtitle for "Hot Events"
                                    : Text(
                                        eventDate,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color.fromARGB(
                                              255, 185, 185, 185),
                                          fontSize: 12,
                                        ),
                                      ),
                                onTap: () {},
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
