import 'package:ev_mobil/widgets/backgroundContainer.dart';
import 'package:ev_mobil/widgets/headerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/consts.dart';

class LocationPage extends StatefulWidget {
  static const route = "locationPage";
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  //Sayfada gösterilecek konumlar mapi
  //String ile konum adı, bool ile seçili olup olmadığı tutulacak
  Map<String, bool> _location = {
    "Fatih": false,
    "Maltepe": false,
    "Üsküdar": true,
    "Sarıyer": false,
    "Beşiktaş": false,
    "Kartal": false,
  };
  String city = "İstanbul";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child : Scaffold(
        body  : BackGroundContainer(
        colors: backGroundColor1,
        child : Column(
            children: [
              Padding(padding: const EdgeInsets.all(defaultPadding),
                //--------------Scaffold Görünümlü header--------------
                child: HeaderWidget(
                  primaryIcon: Icon( Icons.search,color: primaryColor), // solda yer alan icon: arama
                  onPressedPrimary: () {}, // arama iconu olayı
                  secondaryIcon: SvgPicture.asset("assets/icons/haritanoktası.svg"),
                  onPressedSecondary: () {}, //konum iconu olayı
                ),
                //---------------------------------------------------
              ),
              //------------------Sayfa Başlığı-----------------------
              Padding(padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Align(alignment: Alignment.topLeft,
                      child: Text("Favori\nBölgeler", //Büyük Başlık
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: white, fontFamily: leadingFont),
                        maxLines: 2,
                      ),
                    ),
                    Align(alignment: Alignment.bottomLeft,
                      child: Text("Lütfen en az bir tane bölge seçiniz.", // Alt Başlık
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: white),
                      ),
                    ),
                  ],
                ),
              ),
              //-----------------------------------------------------
              Expanded(
                child: Padding(padding: const EdgeInsets.only(top: defaultPadding),
                child: Container(
                  // arkaplan containerı
                  decoration: BoxDecoration(
                    color: lightWhite,
                    borderRadius: BorderRadius.vertical( top: Radius.circular(maxSpace)),
                      //dikeyde yuvarlatılmış
                  ),
                  //-----------------------Itamların Listelenmesi----------------------------
                  child: ListView(
                    children: [
                    SizedBox(height: deviceHeight(context)*0.05),
                    Center(
                      child: Container(
                        height: deviceHeight(context)*0.16,
                        width: deviceWidth(context)*0.9,
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),color: darkWhite,
                        gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: backGroundColor1
                                ),),
                          child: ListTile(leading: SvgPicture.asset("assets/icons/haritanoktası.svg",color: secondaryColor,height: deviceHeight(context)*0.075),
                          title: Center(
                            child: DropdownButton(
                                  dropdownColor: Colors.transparent,
                                  value: city,
                                  items: [
                                    DropdownMenuItem(child: Text("İstanbul",style: TextStyle(color: white, fontSize: 25)),value: "İstanbul"),
                                    DropdownMenuItem(child: Text("Ankara",style: TextStyle(color: white, fontSize: 25)),value: "Ankara"),
                                  ],
                                  onChanged: (value) {
                                   setState(() {
                                     city = value;
                                   });
                                   },
                                  ),
                          ),
                          trailing: SvgPicture.asset("assets/icons/haritanoktası.svg",color: Colors.transparent,height: deviceHeight(context)*0.08)),
                      ),
                    ),
                    SizedBox(height: deviceHeight(context)*0.05),
                    ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical, //dikeyde kaydırılabilir
                    shrinkWrap: true,
                    itemCount: _location.length, //_location mapi uzunluğu kadar
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 0), // yalnızca sol ve sağdan boşluk
                          //InkWell sarmaladığı widgeta tıklanabilirlik özelliği kazandırdı
                          //InkWell ile liste yapısının tamamı tıklanabilir hale geldi
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                //_location mapinin keyleri listeye çevrildi ve tıklandığında true olarak güncellendi
                                _location.update(_location.keys.toList()[index],
                                    (value) => !value);
                              });
                            },
                            child: Container(
                              //locationların listeleneceği card genişliği
                              height: deviceHeight(context) * 0.16,
                              width: deviceWidth(context) * 0.9,
                              decoration: BoxDecoration(
                                // Container rengi gradient ile verildi
                                borderRadius: BorderRadius.all(Radius.circular(15)),color: darkWhite,
                                gradient: LinearGradient(
                                  //soldan sağa doğru color listteki renkleri yaydı
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  //_location mapinin value(true - false) değerlerinin indexine göre rengi kontrol ediyor
                                  colors: _location.values.toList()[index]
                                      ? backGroundColor1 // true ise(seçili) ise renk koyu
                                      : backGroundColor3, // false ise seçilmemişse açık
                                ),
                              ),
                              child: Center(
                                //Bir seçim radiosu ve text yapısından oluşan listTile
                                child: ListTile(
                                  //İç container yapısı
                                  leading: Container(
                                  width  : deviceWidth(context)*0.07,
                                  height : deviceHeight(context)*0.07,
                                  decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                        //_location mapinin valuelarının index değerine göre renk belirler
                                        colors: _location.values.toList()[index]
                                            ? backGroundColor1 // true ise(seçili) ise renk koyu
                                            : backGroundColor3, // false ise seçilmemişse açık
                                      ),
                                    ),
                                    //Dış container yapısı
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: lightWhite,
                                            width: 4.5 ),// mor dairenin genişliği
                                      ),
                                    ),
                                  ),
                                  //_location isimlerinin gösterildiği text
                                  title: Text(_location.keys.toList()[index], //_location mapinin keylerinin indexine göre ekrana yazar
                                    textAlign: TextAlign.center,
                                    style    : TextStyle(
                                    fontSize : 22, // ilçelerin fontu
                                    color: _location.values.toList()[index]
                                          ? Colors.white // seçili ise açık text
                                          : primaryColor, // seçili değilse koyu
                                    ),
                                  ),
                                  trailing: Icon(Icons.location_city,color: Colors.transparent) //SvgPicture.asset("assets/icons/haritanoktası.svg"),
                                ),
                              ),
                            ),
                          ),
                      );
                    },
                    //separatorBuilder list itemları arasına bir widget koymayı sağlıyor
                    //SizedBox ile itemlar arası boşluk sağlandı
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: minSpace);
                    },
                          ),
                        ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
