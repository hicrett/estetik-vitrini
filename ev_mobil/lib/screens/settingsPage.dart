import 'package:estetikvitrini/settings/consts.dart';
import 'package:estetikvitrini/settings/googleSignInProvider.dart';
import 'package:estetikvitrini/widgets/backgroundContainer.dart';
import 'package:estetikvitrini/widgets/listTileWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
 static const route = "settingsPage";

  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          child: Builder(builder:(context)=>
              BackGroundContainer(
              colors: backGroundColor1,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    Column(
                      children: 
                        [Padding(
                          padding: const EdgeInsets.only(top: defaultPadding),
                          child: Text("Profil",
                          style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(color: white, fontFamily: leadingFont)),
                        ),
                        
                      ],
                    ),
                    
                    Column(
                      children: [ 
                        SizedBox(height: deviceHeight(context)*0.05),
                        CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(user.photoURL),
                  ),
                        Text(user.email),
                        SizedBox(height: maxSpace),
                      ],
                    ),
                  ],
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(cardCurved)),//Yalnızca dikeyde yuvarlatılmış
                        ),
                    child: ListView(
                      children: [
                        SizedBox(height: defaultPadding),
                          ListTileWidget(
                          text: "Lisans Bilgileri",
                          child: FaIcon(FontAwesomeIcons.fileAlt),
                        ), 
                        ListTileWidget(
                          text: "Estetik Vitrini Hakkında",
                          child: LineIcon(LineIcons.infoCircle),
                        ), 
                        ListTileWidget(
                          text: "Uygulamadan çıkış yap",
                          child: Icon(Icons.exit_to_app,color: primaryColor),
                          onTap: (){
                          final progressUHD = ProgressHUD.of(context); 
                          progressUHD.show();
                          final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                          provider.logout();
                          progressUHD.dismiss();
                        }),
                        
                      ],
                    ),
                  ),
                ),
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


