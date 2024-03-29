import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/animal_details/components/animal_children_details.dart';
import 'package:maveshi/ui/screens/animal_details/components/animal_details_body.dart';
import 'package:maveshi/ui/screens/animal_details/components/animal_events_body.dart';

/// Takes [Animal] in navigator arguments
class AnimalDetailsScreen extends StatelessWidget {
  static const routeName = '/AnimalDetailsScreen';

  const AnimalDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animal = ModalRoute.of(context)?.settings.arguments as Animal?;

    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.navyBlueColor,
        title: const MyText(
          'Animal Details',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: animal == null
          ? const Center(child: MyText('No animal details found'))
          : HawkFabMenu(
              openIcon: Icons.edit,
              closeIcon: Icons.close,
              fabColor: AppTheme.orangeColor,
              iconColor: AppTheme.whiteColor,
              items: [
                HawkFabMenuItem(
                  label: 'Edit Animal Details',
                  ontap: () => Navigator.pushNamed(
                      context, AddAnimalScreen.routeName,
                      arguments: animal),
                  icon: const Icon(Icons.edit),
                  color: AppTheme.camelColor,
                  labelColor: AppTheme.navyBlueColor,
                ),
                HawkFabMenuItem(
                  label: 'Delete Animal',
                  ontap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const MyText(
                          'Are you sure?',
                          fontWeight: FontWeight.bold,
                        ),
                        content: MyText(
                            'This will delete ${animal.tag} completely form the database.'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                context
                                    .read<FarmProvider>()
                                    .removeAnimal(animal);
                                EasyLoading.showSuccess(
                                    '${animal.tag} deleted!');
                                Navigator.popUntil(context, (route) => false);
                                Navigator.pushNamed(
                                    context, TabScreen.routeName);
                              },
                              child: const MyText('Delete',
                                  color: AppTheme.maroonColor)),
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const MyText('Cancel')),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete_forever_outlined),
                  color: AppTheme.camelColor,
                  labelColor: AppTheme.navyBlueColor,
                ),
              ],
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnimalImage(animal.imagePath,
                        height: 200,
                        width: double.infinity,
                        roundedCorners: false),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        children: [
                          AnimalDetailsBody(animal),
                          AnimalEventsBody(animal.events),
                          AnimalChildrenDetails(context
                              .read<FarmProvider>()
                              .getChildren(animal.id, animal.type)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
