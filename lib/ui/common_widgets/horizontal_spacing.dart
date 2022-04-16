import 'package:maveshi/all_utils.dart';

class HorizontalSpacing extends StatelessWidget {
  final double of;

  const HorizontalSpacing({Key? key, this.of = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(width: of);
}
