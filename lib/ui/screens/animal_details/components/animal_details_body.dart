import 'package:intl/intl.dart';
import 'package:maveshi/all_utils.dart';
import 'package:maveshi/ui/screens/animal_details/components/title_value_text.dart';

class AnimalDetailsBody extends StatelessWidget {
  final Animal animal;
  const AnimalDetailsBody(this.animal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TitleValueText(
              title: animal.tag,
              value: animal.name,
              titleColor: AppTheme.maroonColor,
              titleFontSize: 18,
              valueFontSize: 24,
              titleFontWeight: FontWeight.w600,
              valueFontWeight: FontWeight.bold,
            ),
            MyCard(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/icons/${animal.type.value.toLowerCase()}.png',
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        const VerticalSpacing(),
        MyCard(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const MyText('Animal', color: AppTheme.navyBlueColor),
                    const VerticalSpacing(of: 5),
                    MyText(
                      animal.type.value,
                      color: AppTheme.maroonColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    thickness: 1,
                    color: AppTheme.navyBlueColor,
                  ),
                ),
                Column(
                  children: [
                    const MyText('Gender', color: AppTheme.navyBlueColor),
                    const VerticalSpacing(of: 5),
                    MyText(
                      animal.gender.value,
                      color: AppTheme.maroonColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    thickness: 1,
                    color: AppTheme.navyBlueColor,
                  ),
                ),
                Column(
                  children: [
                    const MyText('Age', color: AppTheme.navyBlueColor),
                    const VerticalSpacing(of: 5),
                    MyText(
                      '${animal.age} Years',
                      color: AppTheme.maroonColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const VerticalSpacing(),
        Row(
          children: [
            Expanded(
              child: TitleValueText(
                title: 'Date of Birth',
                value: DateFormat.yMMMd().format(animal.dateOfBirth),
              ),
            ),
            Expanded(
                child: TitleValueText(title: 'Breed', value: animal.breed)),
          ],
        ),
        const VerticalSpacing(),
        TitleValueText(
          title: 'Obtained By',
          value: '${animal.obtainedBy.value} from ${animal.gotFrom}',
        ),
        const VerticalSpacing(),
        TitleValueText(
          title: 'Farm Joining Date',
          value: DateFormat.yMMMd().format(animal.farmJoiningDate),
        ),
        const VerticalSpacing(),
        Row(
          children: [
            Expanded(
              child: TitleValueText(
                title: 'Initial Price',
                value:
                    '${animal.initialPrice.toStringAsFixed(1)} ${prefs.farm?.currency ?? '\$'}',
              ),
            ),
            Expanded(
              child: TitleValueText(
                title: 'Current Price',
                value:
                    '${animal.currentPrice.toStringAsFixed(1)} ${prefs.farm?.currency ?? '\$'}',
              ),
            ),
          ],
        ),
        const VerticalSpacing(),
        Row(
          children: [
            Expanded(
              child: TitleValueText(
                title: 'Father\'s Tag',
                value: animal.fatherId,
              ),
            ),
            Expanded(
              child: TitleValueText(
                title: 'Mother\'s Tag',
                value: animal.motherId,
              ),
            ),
          ],
        ),
        const VerticalSpacing(),
        TitleValueText(
          title: 'Notes',
          value: animal.notes,
          valueFontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
