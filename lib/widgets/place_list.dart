import 'package:favorite_place_app/models/place.dart';
import 'package:favorite_place_app/provider/user_place.dart';
import 'package:favorite_place_app/screens/place_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceList extends ConsumerWidget {
  const PlaceList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //delete operation
    void deleteLocation(int index) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(
                'Delete ${places[index].title}?',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.blue[500],
                    ),
              ),
              content: Text(
                'Are you sure want to delete ${places[index].title}?',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )),
                ElevatedButton(
                  onPressed: () async {
                    await ref
                        .read(userPlaceProvider.notifier)
                        .deleteData(places[index].id);
                    if (!context.mounted) {
                      return;
                    }
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            );
          });
    }

    if (places.isEmpty) {
      return Center(
        child: Text(
          'No place added yet!',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) => InkWell(
        onLongPress: () {
          deleteLocation(index);
          // await ref.read(userPlaceProvider.notifier).deleteData(places[index].id);
        },
        child: ListTile(
          leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(
                places[index].image,
              )),
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            places[index].location.address,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => PlaceDetailsScreen(place: places[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
