import 'package:maveshi/all_utils.dart';
import 'package:maveshi/models/animal.dart';
import 'package:maveshi/models/animal_event.dart';
import 'package:maveshi/models/enums/animal_event_type.dart';
import 'package:maveshi/models/enums/animal_obtained_by.dart';
import 'package:maveshi/models/enums/animal_type.dart';
import 'package:maveshi/models/enums/gender.dart';
import 'package:maveshi/ui/screens/animal_details/components/animal_children_details.dart';
import 'package:maveshi/ui/screens/animal_details/components/animal_details_body.dart';
import 'package:maveshi/ui/screens/animal_details/components/animal_events_body.dart';
import 'package:maveshi/ui/screens/animal_details/components/animal_image.dart';

class AnimalDetailsScreen extends StatelessWidget {
  static const routeName = '/AnimalDetailsScreen';

  const AnimalDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animal = Animal(
        id: '123',
        tag: 'A-101',
        name: 'Alpha',
        imagePath: '',
        type: AnimalType.cow,
        gender: Gender.female,
        breed: 'Australian',
        dateOfBirth: DateTime.now(),
        age: 0,
        obtainedBy: AnimalObtainedBy.birth,
        farmJoiningDate: DateTime.now(),
        gotFrom: 'By Birth',
        initialPrice: 50000,
        currentPrice: 50000,
        fatherId: 'fatherId',
        motherId: 'motherId',
        groupId: 'groupId',
        notes: 'notes',
        events: [
          AnimalEvent(
              event: AnimalEventType.milking,
              dateTime: DateTime.now(),
              supervisor: 'John',
              notes: ''),
          AnimalEvent(
              event: AnimalEventType.inseminated,
              dateTime: DateTime.now(),
              supervisor: 'John',
              notes: '')
        ]);

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimalImage(animal.imagePath,
                height: 200, width: double.infinity, roundedCorners: false),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                children: [
                  AnimalDetailsBody(animal),
                  AnimalEventsBody(animal.events),
                  AnimalChildrenDetails([animal, animal]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
