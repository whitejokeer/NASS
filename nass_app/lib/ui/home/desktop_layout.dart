import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nass_app/config/colors.dart';
import 'package:nass_app/config/config.dart';
import 'package:nass_app/ui/home/data/folder_options.dart';
import 'package:nass_app/ui/widgets/circular_indicator.dart';
import 'package:nass_app/ui/widgets/content_space_indicator.dart';
import 'package:nass_app/ui/widgets/soft_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/admin_card.dart';

class DesktopHomePage extends StatefulWidget {
  final num storageUsed,
      storageAvailable,
      storageImage,
      storageVideo,
      storageDocs;
  final bool admin;

  const DesktopHomePage(
      {Key key,
      @required this.storageUsed,
      @required this.storageAvailable,
      @required this.storageImage,
      @required this.storageVideo,
      @required this.storageDocs,
      this.admin})
      : super(key: key);
  @override
  _DesktopHomePageState createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", "null");
    Navigator.popAndPushNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NASS",
          style: Theme.of(context).textTheme.headline1.copyWith(
                letterSpacing: 3.0,
              ),
        ),
        actions: [
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: logout,
            child: Image.asset("assets/icons/logout_black_24dp.png"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 1000,
            height: 655,
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SoftCard(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, left: 16.0, right: 16.0),
                            child: Container(
                              height: 150.0,
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Espacion Disponible",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width <
                                                                appSizeConstrain
                                                            ? 18
                                                            : 20.0),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: 43,
                                                child: Image.asset(
                                                    'assets/icons/Cloud Folder.png'),
                                              ),
                                              SizedBox(
                                                width: 8.0,
                                              ),
                                              Text(
                                                "${(widget.storageAvailable - widget.storageUsed).toStringAsFixed(2)} Gb",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Center(
                                      child: CircularIndicator(
                                        storage: widget.storageUsed,
                                        storageAvailable:
                                            widget.storageAvailable,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          ContentSpaceIndicator(
                            storageUsed: widget.storageImage,
                            storageAvailable: widget.storageAvailable,
                            color: colorFire,
                            storageType: "Espacio usado por Imagenes",
                          ),
                          ContentSpaceIndicator(
                            storageUsed: widget.storageVideo,
                            storageAvailable: widget.storageAvailable,
                            color: colorPurple,
                            storageType: "Espacio usado por Videos",
                          ),
                          ContentSpaceIndicator(
                            storageUsed: widget.storageDocs,
                            storageAvailable: widget.storageAvailable,
                            color: colorHookers,
                            storageType: "Espacio usado por Documentos",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Carpetas",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: MediaQuery.of(context).size.width <
                                      appSizeConstrain
                                  ? 20
                                  : 25.0),
                        ),
                      ),
                      Flexible(
                        flex: 6,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 1.0,
                                  crossAxisSpacing: 1.0,
                                  mainAxisExtent: 210.0),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, folderOptions[index]['route']),
                                child: SoftCard(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Image.asset(
                                              folderOptions[index]['logo'])),
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      Text(
                                        folderOptions[index]['name'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(
                                                fontSize: MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        appSizeConstrain
                                                    ? 20
                                                    : 25),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: folderOptions.length,
                        ),
                      ),
                      widget.admin
                          ? Flexible(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: AdminCard(),
                              ),
                            )
                          : Center(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
