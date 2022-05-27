import 'package:maveshi/all_utils.dart';
import 'package:maveshi/models/enums/animal_type.dart';
import 'package:maveshi/ui/common_widgets/my_card.dart';

class AnimalCountCard extends StatelessWidget {
  final AnimalType animal;
  final int count;
  final Function() onTap;

  const AnimalCountCard(
    this.animal, {
    required this.count,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MyCard(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: SizedBox(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                '${animal.value}: $count',
                color: AppTheme.navyBlueColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              Image.asset('assets/images/${animal.value.toLowerCase()}.png'),
            ],
          ),
        ),
      ),
    );
  }
}
