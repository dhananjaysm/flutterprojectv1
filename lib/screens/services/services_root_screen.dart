import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mileazofltr/screens/services/components/card/service_provider_card.dart';
import 'package:mileazofltr/utils/app_layout.dart';
import 'package:mileazofltr/utils/app_style.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceRootScreen extends StatefulWidget {
  const ServiceRootScreen({super.key});
  static String routeName = '/booking_screen';

  @override
  State<ServiceRootScreen> createState() => _ServiceRootScreenState();
}

class _ServiceRootScreenState extends State<ServiceRootScreen> {
  late bool _isLoading;

  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text("Alert Dialog Title"),
          content: Text("Call +91989898XXX"),
          actions: [
            ElevatedButton(
              child: Text("Call"),
              onPressed: () {
                // Navigator.of(context).pop();
                _makePhoneCall('9999');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            // backgroundColor: Colors.grey[100],
            title: Container(
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.black)),
                color: Colors.white,
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push('/services/selectLocation');
                      },
                      splashFactory: NoSplash.splashFactory,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.near_me,
                            color: kPrimaryColor,
                          ),
                          Text(
                            "Location: 302017",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.expand_more)
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(50.0)),
                        child: InkWell(
                          onTap: () {
                            GoRouter.of(context).push('/services/profile');
                          },
                          splashFactory: NoSplash.splashFactory,
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ))
                  ],
                )),
          ),
          SliverAppBar(
            pinned: true,
            collapsedHeight: 70,
            scrolledUnderElevation: 4,
            backgroundColor: Colors.white,
            title: Row(
              children: <Widget>[SearchInput()],
            ),
          ),
          const ServiceProviderList(),
        ],
      ),
    );
  }
}

class SearchInput extends StatefulWidget {
  // final TextEditingController controller;

  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  // const SearchInput({Key key, this.controller}) : controller = controller ?? TextEditingController(), super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.9,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8)),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  // focusNode: focusNode,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                  decoration: InputDecoration(
                    hintText: "Search for service providers",
                    hintStyle:
                        TextStyle(fontSize: getProportionateScreenWidth(14)),

                    // labelText: "Phone",
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    // suffixIcon: Icon(Icons.mic),
                    // prefixIcon: Icon(Icons.search),
                    prefixIcon: Icon(
                      Icons.search,
                      color:
                          focusNode.hasFocus ? kPrimaryColor : Colors.grey[400],
                    ),
                  ),
                ),
              ),
              VerticalDivider(
                width: getProportionateScreenWidth(4),
                thickness: 1,
                indent: getProportionateScreenWidth(8),
                endIndent: getProportionateScreenWidth(8),
                color: Colors.grey.shade400,
              ),
              InkWell(
                  onTap: () {},
                  splashFactory: NoSplash.splashFactory,
                  child: const Icon(Icons.mic))
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCardSkeleton extends StatelessWidget {
  const NewsCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          const Skeleton(height: 100, width: 100),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Skeleton(width: 80),
                const SizedBox(height: 16 / 2),
                const Skeleton(),
                const SizedBox(height: 16 / 2),
                const Skeleton(),
                const SizedBox(height: 16 / 2),
                Row(
                  children: const [
                    Expanded(
                      child: Skeleton(),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Skeleton(),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16 / 2),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}

class ServiceProviderList extends StatelessWidget {
  const ServiceProviderList({super.key});

  @override
  Widget build(BuildContext context) {
    // final TextTheme textTheme = Theme.of(context).textTheme;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final DailyForecast dailyForecast =
              Server.getDailyForecastByID(index);
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Image.asset(
                    // dailyForecast.imageId,
                    "assets/images/splash-logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ABC Service Center",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(16),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10.0),
                        Text(dailyForecast.description),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: kSecondaryColor),
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    child: InkWell(
                                      onTap: () {
                                        GoRouter.of(context).pushNamed('test');
                                      },
                                      splashFactory: NoSplash.splashFactory,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            size:
                                                getProportionateScreenWidth(16),
                                            color: kSecondaryColor,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "Call",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          12)),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                SizedBox(
                                  // width: SizeConfig.screenWidth * 0.2,
                                  height: getProportionateScreenHeight(42),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: kPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    // onPressed: () {
                                    // Navigator.pushNamed(context, SignInScreen.routeName);
                                    // },
                                    onPressed: () {
                                      GoRouter.of(context)
                                          .push('/services/bookService');
                                    },
                                    child: Text(
                                      "Book",
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(12),
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: 7,
      ),
    );
  }
}

class WeeklyForecastList extends StatelessWidget {
  const WeeklyForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final DailyForecast dailyForecast =
              Server.getDailyForecastByID(index);
          return Card(
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      DecoratedBox(
                        position: DecorationPosition.foreground,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: <Color>[
                              Colors.grey[800]!,
                              Colors.transparent
                            ],
                          ),
                        ),
                        child: Image.network(
                          dailyForecast.imageId,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Text(
                          dailyForecast.getDate(currentDate.day).toString(),
                          style: textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          dailyForecast.getWeekday(currentDate.weekday),
                          style: textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 10.0),
                        Text(dailyForecast.description),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '${dailyForecast.highTemp} | ${dailyForecast.lowTemp} F',
                    style: textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          );
        },
        childCount: 7,
      ),
    );
  }
}

// --------------------------------------------
// Below this line are helper classes and data.

const String baseAssetURL =
    'https://dartpad-workshops-io2021.web.app/getting_started_with_slivers/';
const String headerImage = '${baseAssetURL}assets/header.jpeg';

const Map<int, DailyForecast> _kDummyData = {
  0: DailyForecast(
    id: 0,
    imageId: '${baseAssetURL}assets/day_0.jpeg',
    highTemp: 73,
    lowTemp: 52,
    description: 'Jagatpura',
  ),
  1: DailyForecast(
    id: 1,
    imageId: '${baseAssetURL}assets/day_1.jpeg',
    highTemp: 70,
    lowTemp: 50,
    description: 'Partly sunny.',
  ),
  2: DailyForecast(
    id: 2,
    imageId: '${baseAssetURL}assets/day_2.jpeg',
    highTemp: 71,
    lowTemp: 55,
    description: 'Party cloudy.',
  ),
  3: DailyForecast(
    id: 3,
    imageId: '${baseAssetURL}assets/day_3.jpeg',
    highTemp: 74,
    lowTemp: 60,
    description: 'Thunderstorms in the evening.',
  ),
  4: DailyForecast(
    id: 4,
    imageId: '${baseAssetURL}assets/day_4.jpeg',
    highTemp: 67,
    lowTemp: 60,
    description: 'Severe thunderstorm warning.',
  ),
  5: DailyForecast(
    id: 5,
    imageId: '${baseAssetURL}assets/day_5.jpeg',
    highTemp: 73,
    lowTemp: 57,
    description: 'Cloudy with showers in the morning. are these out of bound',
  ),
  6: DailyForecast(
    id: 6,
    imageId: '${baseAssetURL}assets/day_6.jpeg',
    highTemp: 75,
    lowTemp: 58,
    description: 'Sun throughout the day.',
  ),
};

class Server {
  static List<DailyForecast> getDailyForecastList() =>
      _kDummyData.values.toList();

  static DailyForecast getDailyForecastByID(int id) {
    assert(id >= 0 && id <= 6);
    return _kDummyData[id]!;
  }
}

class DailyForecast {
  const DailyForecast({
    required this.id,
    required this.imageId,
    required this.highTemp,
    required this.lowTemp,
    required this.description,
  });

  final int id;
  final String imageId;
  final int highTemp;
  final int lowTemp;
  final String description;

  static const List<String> _weekdays = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  String getWeekday(int today) {
    final int offset = today + id;
    final int day = offset >= 7 ? offset - 7 : offset;
    return _weekdays[day];
  }

  int getDate(int today) => today + id;
}

class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();

  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
