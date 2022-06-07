import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/animal_details/components/title_value_text.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  final double height;

  const AnimalCard(this.animal, {this.height = 100, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            AnimalImage(animal.imagePath, height: 50),
            const HorizontalSpacing(),
            const TitleValueText(
              title: 'Tag:',
              value: 'Name:',
              titleColor: AppTheme.navyBlueColor,
              titleFontSize: 18,
              valueFontSize: 18,
              titleFontWeight: FontWeight.w600,
              valueFontWeight: FontWeight.w600,
            ),
            const HorizontalSpacing(of: 40),
            TitleValueText(
              title: animal.tag,
              value: animal.name,
              titleColor: AppTheme.navyBlueColor,
              titleFontSize: 18,
              valueFontSize: 18,
              titleFontWeight: FontWeight.w600,
              valueFontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
