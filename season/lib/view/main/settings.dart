import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:season/widget/widget_settings.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary, 

        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            LineAwesomeIcons.angle_left,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          )
          // style: Theme.of(context).textTheme.headline6,
        ),
        
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).colorScheme.primary,
                        ),
                      child: const Icon(LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'mackay01@outlook.com',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              // Start Menu
             
              const SizedBox(
                height: 10,
              ),
              ProfileMenu(
                  title: 'About Us',
                  icon: LineAwesomeIcons.address_book,
                  endIcon: false,
                  onPressed: () {
                    showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'About us',
                        style: TextStyle(color: Colors.black),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Ok')),
                      ],
                      content: const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut accumsan ligula molestie blandit vehicula. Mauris ac ante blandit, pulvinar arcu eu, molestie ipsum. In a scelerisque tortor. Sed vehicula bibendum tempus. Morbi dapibus risus quis erat sagittis, eget scelerisque lorem feugiat. Pellentesque auctor lorem et porttitor hendrerit. Curabitur imperdiet vitae ex non lobortis. Morbi in lectus aliquet, euismod ipsum nec, tempor erat. Proin massa tellus, dapibus eget eros quis, vestibulum tempor metus. Maecenas placerat vel felis ac ullamcorper. Suspendisse luctus orci in urna finibus, eu sagittis erat mollis. Curabitur ac magna quis magna viverra euismod. Ut mattis molestie tellus, a bibendum metus commodo sit amet'
                      ),
                    ),
                  );
                  },),
              ProfileMenu(
                  title: 'Logout',
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPressed: () {},),
            ],
          ),
        ),
      ),
    );
  }
}
