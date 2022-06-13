import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/animal_details/components/animal_card.dart';

/// Takes [List<Animal>] in navigator arguments
class GroupViewScreen extends StatefulWidget {
  static const routeName = '/GroupViewScreen';

  const GroupViewScreen({Key? key}) : super(key: key);

  @override
  State<GroupViewScreen> createState() => _GroupViewScreenState();
}

class _GroupViewScreenState extends State<GroupViewScreen> {
  @override
  Widget build(BuildContext context) {
    final animals = ModalRoute.of(context)?.settings.arguments as List<Animal>?;

    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.navyBlueColor,
        title: const MyText(
          'View Animals',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: animals == null || animals.isEmpty
          ? const Center(child: MyText('No animals found\nAdd animals'))
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  AnimalCard(animals[index], height: 50),
              separatorBuilder: (context, index) =>
                  const VerticalSpacing(of: 10),
              itemCount: animals.length,
            ),
    );
  }
}
