import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mileazofltr/utils/app_layout.dart';
import 'package:mileazofltr/utils/app_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: appBarTitleStyle,
        ),
        actions: [],
      ),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Column(
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "https://picsum.photos/200",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Manish Sharma",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          ProfileMenuItem(
            icon: Icons.person,
            name: "Personal Details",
            onTap: () {
              GoRouter.of(context).pushNamed('personalDetails');
            },
          ),
          ProfileMenuItem(
            icon: Icons.directions_car,
            name: "My Vehicles",
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.settings,
            name: "Account Settings",
            onTap: () {
              GoRouter.of(context).pushNamed('accountSettings');
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.25,
          ),
          TextButton(
            onPressed: () {
              // Logout functionality
            },
            child: Text(
              "Logout",
              style: TextStyle(
                  color: Colors.red, fontSize: getProportionateScreenWidth(18)),
            ),
          ),
        ],
      )),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final void Function() onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          // Navigate to Personal Details Screen
          onTap();
        },
        child: ListTile(
            leading: Icon(
              icon,
              color: kPrimaryColor,
              size: getProportionateScreenWidth(24),
            ),
            title: Text(
              name,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  // fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            trailing: Icon(
              Icons.navigate_next,
              color: Colors.grey,
            )),
      ),
    );
  }
}

// return Container(
//       // height: getProportionateScreenHeight(54),
//       // width: SizeConfig.screenWidth * 0.9,
//       margin: EdgeInsets.only(bottom: getProportionateScreenHeight(4)),
//       padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
//       child: InkWell(
//         onTap: () {
//           // Navigate to Personal Details Screen
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(
//                   icon,
//                   color: kPrimaryColor,
//                   size: getProportionateScreenWidth(24),
//                 ),
//                 SizedBox(width: getProportionateScreenWidth(10)),
//                 Text(
//                   name,
//                   style: TextStyle(
//                       fontSize: getProportionateScreenWidth(16),
//                       // fontWeight: FontWeight.w500,
//                       color: Colors.black),
//                 ),
//               ],
//             ),
//             Icon(
//               Icons.navigate_next,
//               color: Colors.grey,
//             )
//           ],
//         ),
//       ),
//     );
