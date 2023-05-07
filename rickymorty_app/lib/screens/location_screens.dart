import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickymorty_app/models/models.dart';
import 'package:rickymorty_app/providers/providers.dart';

class LocationListScreen extends StatelessWidget {
  const LocationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
        final locations = locationProvider.locations;
        return ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            final location = locations[index];
            return Card(
              child: ListTile(
                title: Text(location.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type: ${location.type}'),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/locationDetail',
                    arguments: location,
                  );
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final locationProvider =
              Provider.of<LocationProvider>(context, listen: false);
          locationProvider.fetchLocations();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final location = ModalRoute.of(context)!.settings.arguments as Location;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(location.name)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${location.name}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Type: ${location.type}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Dimension: ${location.dimension}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}


// IMPLEMENTADO CON FUTURE BUILDER (NO NDECESITA PROVIDER)
// class LocationListScreen extends StatelessWidget {
//   const LocationListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final locationProvider = Provider.of<LocationProvider>(context);

//     return Scaffold(
//         body: FutureBuilder<List<Location>>(
//             future: locationProvider.fetchLocations(),
//             builder: (context, snapshot) {
//               print(snapshot.connectionState);
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                     child: CircularProgressIndicator.adaptive());
//               } else if (snapshot.hasError) {
//                 return const Center(child: Text('Failed to load locations'));
//               } else {
//                 final locations = snapshot.data!;
//                 return ListView.builder(
//                   itemCount: locations.length,
//                   itemBuilder: (context, index) {
//                     final location = locations[index];
//                     return Card(
//                       child: ListTile(
//                         title: Text(location.name),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Type: ${location.type}'),
//                           ],
//                         ),
//                         onTap: () {
//                           Navigator.pushNamed(
//                             context,
//                             '/locationDetail',
//                             arguments: location,
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 );
//               }
//             }));
//   }
// }
