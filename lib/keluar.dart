// ignore: file_names
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'blocks/baseBloc.dart';
import 'component/JustHelper.dart';
import 'component/NavDrawer.dart';
import 'component/TextFieldLogin.dart';
import 'component/commonPadding.dart';
import 'component/genButton.dart';
import 'component/genColor.dart';
import 'component/genDimen.dart';
import 'component/genRadioMini.dart';
import 'component/genShadow.dart';
import 'component/genText.dart';
import 'component/request.dart';
import 'component/textAndTitle.dart';

class Keluar extends StatefulWidget {
  @override
  _KeluarState createState() => _KeluarState();
}

class _KeluarState extends State<Keluar> with WidgetsBindingObserver {
  final req = new GenRequest();

//  VARIABEL

  bool loading = false;

  // NotifBloc notifbloc;
  bool isLoaded = false;

//  double currentgurulainValue = 0;
  PageController gurulainController = PageController();
  var stateMetodBelajar = 1;
  var bloc, dataProperty;
  var clientId;
  var stateHari;
  var dariValue, keValue, totalpenumpang;
  dynamic dataUser;
  dynamic dataTransaksi;

  @override
  void initState() {
    // TODO: implement initState
    // analytics.
    getUser();
    getTransaksi();

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  String clienId;

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);

    // notifbloc.dispose();
    // bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: GenColor.primaryColor, // status bar color
    ));

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery
                .of(context)
                .size
                .width,
            maxHeight: MediaQuery
                .of(context)
                .size
                .height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    bloc = Provider.of<BaseBloc>(context);
    // notifbloc = Provider.of<NotifBloc>(context);

    // sendAnalyticsEvent(testLogAnalytic);
    // print("anal itik "+testLogAnalytic);

    if (!isLoaded) {
      isLoaded = true;
    }

    // notifbloc.getTotalNotif();

    // bloc.util.getActiveOnline();
    // bloc.util.getNotifReview();

    // bloc.util.getRekomendasiAll("district", "level", 1, "limit", "offset");

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: GenColor.primaryColor,
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, "notifikasi", arguments: );
                },
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "keranjang");
                      },
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 26.0,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    CommonPadding(
                      child: GenText(
                        "Tanggal: 10 januari 2022",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              // Navigator.pushNamed(context, "inputSyarat", arguments: InputSyarat(
                              //   id: "1",
                              // ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.black12
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextRowBetween(leftText: "Nama Barang", rightText: "20 pcs",),
                                  GenText("Saos ABC"),

                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              // Navigator.pushNamed(context, "inputSyarat", arguments: InputSyarat(
                              //   id: "1",
                              // ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.black12
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextRowBetween(leftText: "Nama Barang", rightText: "20 pcs",),
                                  GenText("Saos ABC"),

                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    )
                    ,
                    SizedBox(
                      height: 30,
                    ),
                    CommonPadding(
                      child: GenText(
                        "Tanggal: 9 januari 2022",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              // Navigator.pushNamed(context, "inputSyarat", arguments: InputSyarat(
                              //   id: "1",
                              // ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.black12
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextRowBetween(leftText: "Nama Barang", rightText: "20 pcs",),
                                  GenText("Saos ABC"),

                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              // Navigator.pushNamed(context, "inputSyarat", arguments: InputSyarat(
                              //   id: "1",
                              // ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.black12
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextRowBetween(leftText: "Nama Barang", rightText: "20 pcs",),
                                  GenText("Saos ABC"),

                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    )
                    ,
                    Container(
                      height: 200,
                      child: dataProperty == null
                          ? Container()
                          : dataProperty.length == 0
                          ? Center(
                        child: GenText("Tidak ada mobil tersedia"),
                      )
                          : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getUser() async {
    print("data usernya :");
    dataUser = await req.postApiuseAuth("user", {});

    print(dataUser);
    setState(() {});
  }

  void getTransaksi() async {
    dataTransaksi = await req.getApi("barang-keluar");

    print("DATA $dataTransaksi");
    print("length" + dataTransaksi.length.toString());

    setState(() {});
  }
}
