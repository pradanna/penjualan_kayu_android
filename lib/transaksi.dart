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

class Transaksi extends StatefulWidget {
  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> with WidgetsBindingObserver {
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

  @override
  void initState() {
    // TODO: implement initState
    // analytics.
    getUser();
    getProperty();

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
                        "Transaksi",
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
                                  TextRowBetween(leftText: "Nomor Transaksi", rightText: "Status",),
                                  GenText("Rp 5.000.000"),

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
                            // children: dataProperty.map<Widget>((e) {
                            //   return CommonPadding(
                            //     child: InkWell(
                            //       onTap: (){
                            //         Navigator.pushNamed(context, "detailKos", arguments: DetailKos(id: e["id"],));
                            //       },
                            //       child: Container(
                            //         height: 150,
                            //         child: Column(
                            //           crossAxisAlignment:
                            //           CrossAxisAlignment.start,
                            //           children: [
                            //             Image.network(
                            //               ip + e["foto"],
                            //               height: 75,
                            //               width: 200,
                            //               fit: BoxFit.cover,
                            //             ),
                            //             Container(
                            //               padding: EdgeInsets.all(5),
                            //               child: Column(
                            //                 crossAxisAlignment:
                            //                 CrossAxisAlignment
                            //                     .start,
                            //                 children: [
                            //                   SizedBox(
                            //                     height: 5,
                            //                   ),
                            //                   Row(
                            //                     mainAxisAlignment:
                            //                     MainAxisAlignment
                            //                         .start,
                            //                     children: [
                            //                       GenText(
                            //                         e["nama"],
                            //                         style: TextStyle(
                            //                             fontSize: 12),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 10,
                            //                       ),
                            //                       GenText(
                            //                         ". "+e['peruntukan']+" .",
                            //                         style: TextStyle(
                            //                             fontSize: 12),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 10,
                            //                       ),
                            //                       // Icon(
                            //                       //   Icons.star,
                            //                       //   size: 12,
                            //                       // ),
                            //                       // GenText(
                            //                       //   "4.1",
                            //                       //   style: TextStyle(
                            //                       //       fontSize: 12),
                            //                       // ),
                            //                     ],
                            //                   ),
                            //                   SizedBox(
                            //                     height: 5,
                            //                   ),
                            //                   // Row(
                            //                   //   mainAxisAlignment:
                            //                   //   MainAxisAlignment
                            //                   //       .start,
                            //                   //   children: [
                            //                   //     Icon(
                            //                   //       Icons.location_pin,
                            //                   //       size: 11,
                            //                   //     ),
                            //                   //     SizedBox(
                            //                   //       width: 5,
                            //                   //     ),
                            //                   //     GenText(
                            //                   //       e["alamat"],
                            //                   //       style: TextStyle(
                            //                   //           fontSize: 12),
                            //                   //     ),
                            //                   //   ],
                            //                   // ),
                            //                   SizedBox(
                            //                     height: 5,
                            //                   ),
                            //                   GenText(
                            //                     formatRupiah(e["harga"].toString()),
                            //                     style: TextStyle(
                            //                         fontSize: 12,
                            //                         fontWeight:
                            //                         FontWeight
                            //                             .bold),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   );
                            //
                            // }).toList()
                        ),
                      ),
                    ),


                    // dataProperty == null
                    //     ? Container()
                    //     : dataProperty.length == 0
                    //     ? Center(
                    //   child: GenText("Tidak ada mobil tersedia"),
                    // )
                    //     : Column(children: dataProperty.map<Widget>((e) {
                    //   return CommonPadding(
                    //     child: InkWell(
                    //       onTap: (){
                    //         Navigator.pushNamed(context, "detailKos", arguments: DetailKos(id: e["id"],));
                    //       },
                    //       child: Container(
                    //         width: double.infinity,
                    //         margin: EdgeInsets.only(bottom: 20),
                    //         decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(5),
                    //             boxShadow: GenShadow().genShadow(
                    //                 radius: 3.w, offset: Offset(0, 2.w))),
                    //         child: Row(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Image.network(
                    //              ip + e["foto"],
                    //               height: 120,
                    //               width: 120,
                    //               fit: BoxFit.cover,
                    //             ),
                    //             SizedBox(
                    //               width: 10,
                    //             ),
                    //             Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 SizedBox(
                    //                   height: 5,
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment:
                    //                   MainAxisAlignment.start,
                    //                   children: [
                    //                     GenText(
                    //                      e["nama"],
                    //                       style: TextStyle(
                    //                           fontSize: GenDimen.fontSizeBawah),
                    //                     ),
                    //                     SizedBox(
                    //                       width: 10,
                    //                     ),
                    //                     GenText(
                    //                       ". "+e["peruntukan"]+" .",
                    //                       style: TextStyle(
                    //                           fontSize: GenDimen.fontSizeBawah),
                    //                     ),
                    //                     SizedBox(
                    //                       width: 10,
                    //                     ),
                    //                     Icon(
                    //                       Icons.star,
                    //                       size: GenDimen.fontSizeBawah,
                    //                     ),
                    //
                    //                   ],
                    //                 ),
                    //                 SizedBox(
                    //                   height: 5,
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment:
                    //                   MainAxisAlignment.start,
                    //                   children: [
                    //                     Icon(
                    //                       Icons.location_pin,
                    //                       size: GenDimen.fontSizeBawah,
                    //                     ),
                    //                     SizedBox(
                    //                       width: 5,
                    //                     ),
                    //                     GenText(
                    //                       e["alamat"],
                    //                       style: TextStyle(
                    //                           fontSize: GenDimen.fontSizeBawah),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 SizedBox(
                    //                   height: 5,
                    //                 ),
                    //                 GenText(
                    //                   formatRupiah(e["harga"].toString()),
                    //                   style: TextStyle(
                    //                       fontSize: GenDimen.fontSizeBawah,
                    //                       fontWeight: FontWeight.bold),
                    //                 ),
                    //                 SizedBox(
                    //                   height: 10,
                    //                 ),
                    //                 Row(
                    //                   children: [
                    //                     Container(
                    //                       width: 100,
                    //                       child: GenButton(
                    //                         text: "Pesan Kos",
                    //                         padding: EdgeInsets.all(3),
                    //                         radius: 10,
                    //                         textSize: 16,
                    //                       ),
                    //                     )
                    //                   ],
                    //                 )
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // }).toList()),
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
    dataUser = await req.getApi("user");

    print(dataUser);
    setState(() {});
  }

  void getProperty() async {
    dataProperty = await req.getApi("user/kos");

    print("DATA $dataProperty");
    print("length" + dataProperty.length.toString());

    setState(() {});
  }
}
