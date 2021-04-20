import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nass_app/config/config.dart';
import 'package:nass_app/ui/home/widgets/admin_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/circular_indicator.dart';
import '../widgets/soft_card.dart';
import 'data/folder_options.dart';

class DesktopAppHomePage extends StatefulWidget {
  final num storageUsed, storageAvailable;
  final bool admin;

  const DesktopAppHomePage(
      {Key key,
      @required this.storageUsed,
      @required this.storageAvailable,
      this.admin})
      : super(key: key);
  @override
  _DesktopAppHomePageState createState() => _DesktopAppHomePageState();
}

class _DesktopAppHomePageState extends State<DesktopAppHomePage> {
  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", "null");
    Navigator.pushReplacementNamed(context, "/login");
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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            sliver: SliverToBoxAdapter(
              child: SoftCard(
                height: 200,
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MediaQuery.of(context).size.width <
                                                  appSizeConstrain
                                              ? 18
                                              : 20.0),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 51,
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
                                      .copyWith(fontWeight: FontWeight.bold),
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
                      child: CircularIndicator(
                        storage: widget.storageUsed,
                        storageAvailable: widget.storageAvailable,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            sliver: SliverToBoxAdapter(
              child: widget.admin
                  ? Container(
                      height: 160, width: double.infinity, child: AdminCard())
                  : Center(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Carpetas",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize:
                        MediaQuery.of(context).size.width < appSizeConstrain
                            ? 20
                            : 25.0),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 180,
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, folderOptions[index]['route']),
                  child: SoftCard(
                    height: 192,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Image.asset(folderOptions[index]['logo'])),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          folderOptions[index]['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: MediaQuery.of(context).size.width <
                                      appSizeConstrain
                                  ? 20
                                  : 25),
                        ),
                      ],
                    ),
                  ),
                );
              }, childCount: folderOptions.length),
            ),
          )
        ],
      ),
    );
  }
}
