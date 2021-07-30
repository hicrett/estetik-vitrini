import 'package:ev_mobil/settings/consts.dart';
import 'package:ev_mobil/widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  static const route = "/registerPage";
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ProgressHUD(
        child: Builder(builder: (context)=>
            Stack(children:[
              Container(
                decoration: BoxDecoration(gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [secondaryColor,primaryColor],
                  )),
                child: null,
            ),
            SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(children: [
                  SizedBox(height: deviceHeight(context) * 0.3), // giriş ikonu - cihaz üstü boşluk          
                       //--------------------------giriş ikonu----------------------------------
                        Center(child: SvgPicture.asset("assets/images/logobeyaz.svg")),  
                       //------------------------------------------------------------------
                        SizedBox(height: deviceHeight(context) * 0.1),
                        SingleChildScrollView(
                          reverse: true,
                          child: Column(children: [
                                //--------------------Email textField'ı---------------------
                                Padding(padding: const EdgeInsets.only(top: defaultPadding,right: defaultPadding,left: defaultPadding),
                                  child       : TextFieldWidget(textEditingController: txtUsername,
                                  keyboardType: TextInputType.name,
                                  hintText    : "E-Posta", //ipucu metni
                                  obscureText : false, // yazılanlar gizlenmesin
                                ),
                            ),
                            //--------------------Telefon textField'ı---------------------
                                Padding(padding: const EdgeInsets.only(top: defaultPadding,right: defaultPadding,left: defaultPadding),
                                  child       : TextFieldWidget(textEditingController: txtUsername,
                                  keyboardType: TextInputType.name,
                                  hintText    : "Telefon", //ipucu metni
                                  obscureText : false, // yazılanlar gizlenmesin
                                ),
                            ),
                            //-------------------------Şifre textField'ı------------------------
                          Padding(padding: const EdgeInsets.only(top: defaultPadding,right: defaultPadding,left: defaultPadding),
                              child: TextFieldWidget(
                              textEditingController: txtPassword,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText : true, // yazılanlar gizlensin
                              hintText    : "Şifre", //ipucu metni
                            ),
                          ),
                            //-------------------------Şifre tekrar textField'ı------------------------
                          Padding(padding: const EdgeInsets.only(top: defaultPadding,right: defaultPadding,left: defaultPadding),
                              child: TextFieldWidget(
                              textEditingController: txtPassword,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText : true, // yazılanlar gizlensin
                              hintText    : "Şifre tekrar", //ipucu metni
                            ),
                          ),
                          //------------------------------------------------------------------
                          SizedBox(height: deviceHeight(context)*0.1),
                          Material(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(30.0),
                            child: MaterialButton(
                              minWidth: deviceWidth(context) * 0.4, //Buton minimum genişliği
                              child: Text("Kayıt Ol",style: Theme.of(context).textTheme.button.copyWith(color: white,fontFamily: contentFont,fontSize: 20)),
                              onPressed: (){
                                final progressUHD = ProgressHUD.of(context);
                                progressUHD.show(); 
                                //Navigator.pushAndRemoveUntil(context,
                                //MaterialPageRoute(builder: (context) => Root()), (route) => false);    
                                progressUHD.dismiss(); 
                            }),
                          ),
                         
                            
                          ],),
                        )
                ],),
              ),
            ),
          ],
            ),
        ),
      ),
    );
  }
}