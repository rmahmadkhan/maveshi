import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:maveshi/all_screens.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/add_animal/components/date_picker.dart';
import 'package:maveshi/ui/screens/add_animal/components/image_uploader.dart';
import 'package:maveshi/ui/screens/add_animal/components/my_radio_button_tile.dart';

class AddAnimalScreen extends StatefulWidget {
  static const routeName = '/AddAnimalScreen';

  const AddAnimalScreen({Key? key}) : super(key: key);

  @override
  State<AddAnimalScreen> createState() => _AddAnimalScreenState();
}

class _AddAnimalScreenState extends State<AddAnimalScreen> {
  File? image;
  void _imageUploaderCallback(File? file) => image = file;
  final tagController = TextEditingController();
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  Gender gender = Gender.female;
  void onGenderChangeCallback(Gender? value) =>
      setState(() => {if (value != null) gender = value});
  final breedController = TextEditingController();
  DateTime dateOfBirth = DateTime.now();
  void onDOBChangeCallback(DateTime date) => setState(() => dateOfBirth = date);
  final obtainedByController = TextEditingController();
  DateTime farmJoiningDate = DateTime.now();
  void onJoiningDateChangeCallback(DateTime date) =>
      setState(() => farmJoiningDate = date);
  final gotFromController = TextEditingController();
  final initialPriceController = TextEditingController();
  final currentPriceController = TextEditingController();
  final fatherIdController = TextEditingController();
  final motherIdController = TextEditingController();
  final notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obtainedByController.text = AnimalObtainedBy.birth.value;
  }

  @override
  void dispose() {
    tagController.dispose();
    nameController.dispose();
    typeController.dispose();
    breedController.dispose();
    gotFromController.dispose();
    initialPriceController.dispose();
    currentPriceController.dispose();
    fatherIdController.dispose();
    motherIdController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// In case of edit Animal
    final animal = ModalRoute.of(context)?.settings.arguments as Animal?;
    if (animal != null) {
      tagController.text = animal.tag;
      nameController.text = animal.name;
      gender = animal.gender;
      typeController.text = animal.type.value;
      breedController.text = animal.breed;
      dateOfBirth = animal.dateOfBirth;
      obtainedByController.text = animal.obtainedBy.value;
      farmJoiningDate = animal.farmJoiningDate;
      gotFromController.text = animal.gotFrom;
      initialPriceController.text = animal.initialPrice.toString();
      currentPriceController.text = animal.currentPrice.toString();
      // fatherIdController.text = animal.fatherId;
      // motherIdController.text = animal.motherId;
      notesController.text = animal.notes;
    }

    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.navyBlueColor,
        title: const MyText(
          'Add Animal',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageUploader(_imageUploaderCallback, imagePath: animal?.imagePath),
            const VerticalSpacing(of: 10),
            MyTextField(
              controller: tagController,
              caption: 'Tag',
              hintText: 'A-101',
            ),
            const VerticalSpacing(of: 10),
            MyTextField(
              controller: nameController,
              caption: 'Name',
              hintText: 'Alpha',
            ),
            const VerticalSpacing(of: 10),
            const MyText(
              'Gender',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.navyBlueColor,
            ),
            const VerticalSpacing(of: 10),
            Row(
              children: [
                Expanded(
                  child: MyRadioButtonTile(
                    value: Gender.male,
                    groupValue: gender,
                    onChanged: onGenderChangeCallback,
                  ),
                ),
                const HorizontalSpacing(),
                Expanded(
                  child: MyRadioButtonTile(
                    value: Gender.female,
                    groupValue: gender,
                    onChanged: onGenderChangeCallback,
                  ),
                ),
              ],
            ),
            const VerticalSpacing(of: 10),
            MyDropdown(
              controller: typeController,
              list: [
                AnimalType.cow.value,
                AnimalType.buffalo.value,
                AnimalType.goat.value,
                AnimalType.sheep.value
              ],
              hint: 'Select',
              caption: 'Animal Type',
            ),
            const VerticalSpacing(of: 10),
            MyTextField(
              controller: breedController,
              caption: 'Breed',
              hintText: 'Australian',
            ),
            const VerticalSpacing(of: 10),
            Row(
              children: [
                Expanded(
                  child: DatePicker(
                    onChanged: onDOBChangeCallback,
                    caption: 'Date of Birth',
                  ),
                ),
                const HorizontalSpacing(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        'Obtained By',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.navyBlueColor,
                      ),
                      const VerticalSpacing(of: 10),
                      MyDropdown(
                        controller: obtainedByController,
                        list: [
                          AnimalObtainedBy.birth.value,
                          AnimalObtainedBy.purchase.value,
                          AnimalObtainedBy.gift.value,
                        ],
                        hint: 'Select',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const VerticalSpacing(of: 10),
            Row(
              children: [
                Expanded(
                  child: DatePicker(
                    caption: 'Joined farm on',
                    onChanged: onJoiningDateChangeCallback,
                  ),
                ),
                const HorizontalSpacing(),
                Expanded(
                  child: MyTextField(
                    controller: gotFromController,
                    caption: 'Got from',
                    hintText: 'John',
                  ),
                ),
              ],
            ),
            const VerticalSpacing(of: 10),
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    controller: initialPriceController,
                    caption: 'Initial Price',
                    keyboardType: TextInputType.number,
                    suffixWidget: MyText(
                      prefs.farm?.currency ?? '\$',
                      color: AppTheme.lightNavyBlueColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                const HorizontalSpacing(),
                Expanded(
                  child: MyTextField(
                    controller: currentPriceController,
                    caption: 'Current Price',
                    keyboardType: TextInputType.number,
                    suffixWidget: MyText(
                      prefs.farm?.currency ?? '\$',
                      color: AppTheme.lightNavyBlueColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpacing(of: 10),
            MyDropdown(
              controller: fatherIdController,
              list: const ['Aplha', 'Beta'],
              hint: 'Select',
              caption: 'Father',
            ),
            const VerticalSpacing(of: 10),
            MyDropdown(
              controller: motherIdController,
              list: const ['Aplha', 'Beta'],
              hint: 'Select',
              caption: 'Mother',
            ),
            const VerticalSpacing(of: 10),
            MyTextField(
              controller: notesController,
              caption: 'Notes',
              maxLines: 4,
            ),
            const VerticalSpacing(),
            MyElevatedButton('${animal == null ? 'Add' : 'Update'} Animal',
                onTap: _onTapAddAnimal),
          ],
        ),
      ),
    );
  }

  void _onTapAddAnimal(BuildContext context) async {
    final animal = ModalRoute.of(context)?.settings.arguments as Animal?;
    final tag = tagController.text;

    if (tag.isEmpty) {
      EasyLoading.showError('Tag is required!');
    } else {
      final farmId = prefs.user?.farmId;
      if (farmId != null) {
        EasyLoading.show();
        final imagePath = image != null ? await _uploadFile(farmId, tag) : null;

        final updatedAnimal = Animal(
          id: tag,
          tag: tag,
          name: nameController.text,
          imagePath: imagePath ?? animal?.imagePath ?? '',
          type: _getType(typeController.text),
          gender: gender,
          breed: breedController.text,
          dateOfBirth: dateOfBirth,
          age: dateOfBirth.difference(DateTime.now()).inDays ~/ 356,
          obtainedBy: _getObtainedBy(obtainedByController.text),
          farmJoiningDate: farmJoiningDate,
          gotFrom: gotFromController.text,
          initialPrice: double.tryParse(initialPriceController.text) ?? 0,
          currentPrice: double.tryParse(currentPriceController.text) ?? 0,
          fatherId: 'fatherId',
          motherId: 'motherId',
          notes: notesController.text,
          events: [],
        );

        if (!mounted) return;
        await context.read<FarmProvider>().addAnimal(updatedAnimal);
        EasyLoading.dismiss();
        EasyLoading.showSuccess(
            'Animal ${animal == null ? 'added' : 'updated'}!');

        if (!mounted) return;
        Navigator.popUntil(context, (route) => false);
        Navigator.pushNamed(context, TabScreen.routeName);
      }
    }
  }

  Future<String> _uploadFile(String farmId, String animalTag) async {
    final imageFile =
        FirebaseStorage.instance.ref().child('farms/$farmId/$animalTag.jpg');

    final snapshot = await imageFile.putFile(image!);
    final url = await snapshot.ref.getDownloadURL();
    return url;
  }

  static AnimalType _getType(String type) {
    switch (type) {
      case 'Cow':
        return AnimalType.cow;
      case 'Buffalo':
        return AnimalType.buffalo;
      case 'Goat':
        return AnimalType.goat;
      case 'Sheep':
        return AnimalType.sheep;
      default:
        return AnimalType.cow;
    }
  }

  static AnimalObtainedBy _getObtainedBy(String by) {
    switch (by) {
      case 'Birth':
        return AnimalObtainedBy.birth;
      case 'Purchase':
        return AnimalObtainedBy.purchase;
      case 'Gift':
        return AnimalObtainedBy.gift;
      default:
        return AnimalObtainedBy.birth;
    }
  }
}
