import 'package:maveshi/all_utils.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: const [
          MyText('Hi, Harry!'),
        ],
      ),
    );
  }
}
