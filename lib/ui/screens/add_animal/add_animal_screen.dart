import 'dart:io';

import 'package:maveshi/all_utils.dart';
import 'package:maveshi/models/enums/animal_obtained_by.dart';
import 'package:maveshi/models/enums/gender.dart';
import 'package:maveshi/ui/common_widgets/my_dropdown.dart';
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
  Gender gender = Gender.female;
  void onGenderChangeCallback(Gender? value) =>
      setState(() => {if (value != null) gender = value});
  final breedController = TextEditingController();
  DateTime dateOfBirth = DateTime.now();
  void onDOBChangeCallback(DateTime date) => setState(() => dateOfBirth = date);
  final ageController = TextEditingController();
  final obtainedByController = TextEditingController();
  DateTime farmJoiningDate = DateTime.now();
  void onJoiningDateChangeCallback(DateTime date) =>
      setState(() => farmJoiningDate = date);
  final gotFromController = TextEditingController();
  final initialPriceController = TextEditingController();
  final currentPriceController = TextEditingController();
  final fatherIdController = TextEditingController();
  final motherIdController = TextEditingController();
  final groupIdController = TextEditingController();
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
    breedController.dispose();
    ageController.dispose();
    gotFromController.dispose();
    initialPriceController.dispose();
    currentPriceController.dispose();
    fatherIdController.dispose();
    motherIdController.dispose();
    groupIdController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseScaffold(
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
              ImageUploader(_imageUploaderCallback),
              const VerticalSpacing(of: 10),
              MyTextField(
                controller: tagController,
                caption: 'Tag*',
                hintText: 'A-101',
              ),
              const VerticalSpacing(of: 10),
              MyTextField(
                controller: nameController,
                caption: 'Name*',
                hintText: 'Alpha',
              ),
              const VerticalSpacing(of: 10),
              const MyText(
                'Gender*',
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
                      caption: 'Date of Birth*',
                    ),
                  ),
                  const HorizontalSpacing(),
                  Expanded(
                    child: MyTextField(
                      controller: ageController,
                      caption: 'Age',
                      hintText: '0',
                      keyboardType: TextInputType.number,
                      suffixWidget: const MyText(
                        'years',
                        color: AppTheme.lightNavyBlueColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpacing(of: 10),
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
                      suffixWidget: const MyText(
                        'PKR',
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
                      suffixWidget: const MyText(
                        'PKR',
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
              MyDropdown(
                controller: groupIdController,
                list: const ['Aplha', 'Beta'],
                hint: 'Select',
                caption: 'Group',
              ),
              const VerticalSpacing(of: 10),
              MyTextField(
                controller: notesController,
                caption: 'Notes',
                maxLines: 4,
              ),
              const VerticalSpacing(),
              MyElevatedButton('Add Animal', onTap: (_) {}),
            ],
          ),
        ),
      ),
    );
  }
}
