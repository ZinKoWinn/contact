import 'package:contact/style/app-style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 240.0,
          child: Stack(
            children: [
              Container(
                  height: 165,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://scontent.frgn13-1.fna.fbcdn.net/v/t1.0-9/84696810_493808298225845_1732241566963073024_o.jpg?_nc_cat=103&ccb=2&_nc_sid=e3f864&_nc_ohc=mfWR2tKw_UoAX9CPv-a&_nc_ht=scontent.frgn13-1.fna&oh=15dcba96baf33f2a2ce3d4b50dd0037f&oe=602C21DA"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              
              Positioned(
                top: 125.0,
                left: MediaQuery.of(context).size.width / 2.5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundImage: NetworkImage(
                        "https://scontent.frgn13-1.fna.fbcdn.net/v/t1.0-9/83732684_493792534894088_391212598009266176_o.jpg?_nc_cat=101&ccb=2&_nc_sid=09cbfe&_nc_ohc=FnzxOVvDtXsAX-OvBvr&_nc_ht=scontent.frgn13-1.fna&oh=a9f520464b94b740ef2c7efec5f2e2bf&oe=602E358B",
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: //MediaQuery.of(context).size.height / 4.6,
                    180,
                right: 20,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Feather.edit_2,
                      size: 15,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200.0,
                left: MediaQuery.of(context).size.width / 3.3,
                child: Text(
                  "Zin Ko Winn",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ),
            ],
          ),
        ),
        info(
          context,
          label: "Email",
          data: "zinko.developer@gmail.com",
          icon: Feather.mail,
        ),
        info(
          context,
          label: "Phone",
          data: "09797256920",
          icon: Feather.phone_call,
        ),
        info(
          context,
          label: "Date Of Birth",
          data: "Jan 20,2000",
          icon: Icons.cake,
        ),
      ],
    );
  }

  Widget info(BuildContext context,
      {String label, String data, IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: ListTile(
        visualDensity: VisualDensity(vertical: -4),
        title: Text(
          label,
        ),
        subtitle: Text(
          data,
          style: boldText.copyWith(color: Colors.black),
        ),
        trailing: Icon(
          icon,
          // color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
