import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/button_primary.dart';
import 'package:diskusiaza_mobile/widgets/button_tertiary.dart';
import 'package:flutter/material.dart';

class KontributorScreen extends StatelessWidget {
  const KontributorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: infoColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Kontributor',
          style: poppinsRegular(18, Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.all(8.0),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Colors.black38,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Colors.black38,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: infoColor,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              height: 2,
              thickness: 2,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20),
                  child: Image.asset(
                    'assets/images/user2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            dense: true,
            title: Text(
              'Sarah Widiati',
              style: poppinsRegular(
                14,
                Colors.black,
              ),
            ),
            subtitle: Text(
              'Mantan yang tersakiti',
              style: poppinsRegular(
                10,
                Colors.black54,
              ),
            ),
            trailing: SizedBox(
              width: 36,
              child: ButtonTertiary(
                title: '',
                icon: Icons.shield,
                onCreate: () {},
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20),
                  child: Image.asset(
                    'assets/images/user3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            dense: true,
            title: Text(
              'Acul Sudrajat',
              style: poppinsRegular(
                14,
                Colors.black,
              ),
            ),
            subtitle: Text(
              'Sarjana Jomblo',
              style: poppinsRegular(
                10,
                Colors.black54,
              ),
            ),
            trailing: SizedBox(
              width: 36,
              child: ButtonTertiary(
                title: '',
                icon: Icons.shield,
                onCreate: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
