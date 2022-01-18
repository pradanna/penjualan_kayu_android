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

class Masuk extends StatefulWidget {
  @override
  _MasukState createState() => _MasukState();
}

class _MasukState extends State<Masuk> with WidgetsBindingObserver {
  final req = new GenRequest();

//  VARIABEL

  bool loading = false;

  // NotifBloc notifbloc;
  bool isLoaded = false;

//  double currentgurulainValue = 0;
  PageController gurulainController = PageController();
  var stateMetodBelajar = 1;
  var bloc, dataBarang;
  var clientId;
  var stateHari;
  var dariValue, keValue, totalpenumpang;
  dynamic dataUser;

  @override
  void initState() {
    // TODO: implement initState
    // analytics.
    getBarangMasuk();

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
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    bloc = Provider.of<BaseBloc>(context);

    if (!isLoaded) {
      isLoaded = true;
    }

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: GenColor.primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: dataBarang == null
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: dataBarang.map<Widget>((e) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    CommonPadding(
                                      child: GenText(
                                        "Tanggal:" + e["tanggal"],
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: e["data"]
                                                .map<Widget>((i) {
                                              return InkWell(
                                                onTap: () {
                                                  // Navigator.pushNamed(context, "inputSyarat", arguments: InputSyarat(
                                                  //   id: "1",
                                                  // ));
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  width: double.infinity,
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 2,
                                                            color:
                                                                Colors.black12)
                                                      ]),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextRowBetween(
                                                        leftText: "nama Barang",
                                                        rightText: "qty : " + i["qty"].toString(),
                                                      ),
                                                      GenText(i["barang"]["nama"]),
                                                      SizedBox(height: 10,),
                                                      TextRowBetween(
                                                        leftText: "Keterangan",
                                                        rightText: "",
                                                      ),
                                                      GenText(i["keterangan"]),
                                                    ],

                                                  ),
                                                ),
                                              );
                                            }).toList())),
                                  ],
                                );
                              }).toList()),

                          Container(
                            height: 200,
                            child: dataBarang == null
                                ? Container()
                                : dataBarang.length == 0
                                    ? Center(
                                        child:
                                            GenText("Tidak ada barang tersedia"),
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
    dataUser = await req.getApi("user");

    print(dataUser);
    setState(() {});
  }

  void getBarangMasuk() async {
    dataBarang = await req.getApi("barang-masuk");

    dataBarang = dataBarang["payload"];
    print("DATA $dataBarang");
    print("length" + dataBarang.length.toString());

    setState(() {});
  }
}
