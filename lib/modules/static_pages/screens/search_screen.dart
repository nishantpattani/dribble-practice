import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _scaleAnimation;
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(21.0000, 78.0000),
    zoom: 5,
  );

  final List<PopUpData> popUpList = [
    const PopUpData(title: 'Cosy areas', icon: Icons.area_chart),
    const PopUpData(title: 'Price', icon: Icons.price_change),
    const PopUpData(title: 'Infrastructure', icon: Icons.donut_small),
    const PopUpData(title: 'Without any layer', icon: Icons.layers),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _scaleAnimation = Tween<double>(begin: 0.2, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leadingWidth: 0,
        automaticallyImplyLeading: true,
        leading: const SizedBox.shrink(),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) => Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 120, 120, 120),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Saint Petersburg',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 120, 120, 120),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) => Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.menu,
                    size: 15,
                    color: Color.fromARGB(255, 120, 120, 120),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: FutureBuilder(
        future: rootBundle.loadString('assets/maps/dark_mode.json'),
        builder: (context, snapshot) => GoogleMap(
          markers: {
            const Marker(
              markerId: MarkerId('Surat'),
              position: LatLng(21.1702, 72.8311),
            ),
            const Marker(
              markerId: MarkerId('Pune'),
              position: LatLng(18.5204, 73.8567),
            ),
            const Marker(
              markerId: MarkerId('Rajkot'),
              position: LatLng(22.3039, 70.8022),
            ),
            const Marker(
              markerId: MarkerId('Telagana'),
              position: LatLng(18.1124, 79.0193),
            ),
          },
          zoomControlsEnabled: false,
          style: snapshot.data,
          mapType: MapType.hybrid,
          initialCameraPosition: initialCameraPosition,
          onMapCreated: (controller) {
            _animationController.forward();
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: PopupMenuButton<PopUpData>(
                    offset: Offset(
                        0,
                        -(((IconTheme.of(context).size ?? 0) + 24) *
                            (popUpList.length - 1))),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.wallet,
                        color: Colors.white,
                      ),
                    ),
                    itemBuilder: (context) => popUpList
                        .map(
                          (e) => PopupMenuItem<PopUpData>(
                            child: Row(
                              children: [
                                Icon(e.icon),
                                const SizedBox(width: 10),
                                Text(e.title),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              }),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) => Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.outbond,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) => Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    constraints: const BoxConstraints(minHeight: 45),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          size: 25,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'List of variants',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 100,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}

class PopUpData {
  final String title;
  final IconData icon;

  const PopUpData({required this.title, required this.icon});
}
