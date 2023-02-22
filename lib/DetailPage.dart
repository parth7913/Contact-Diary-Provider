import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    dynamic list = ModalRoute.of(context)!.settings.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Detail",
            style: GoogleFonts.satisfy(fontSize: 20, color: Colors.black),
          ),
          actions: [
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text(
                      "Place on Home screen",
                      style: GoogleFonts.satisfy(color: Colors.black),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: Text(
                      "Voicemail not in use",
                      style: GoogleFonts.satisfy(color: Colors.black),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: Text(
                      "Delete contact",
                      style: GoogleFonts.satisfy(color: Colors.black),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: Text(
                      "Share",
                      style: GoogleFonts.satisfy(color: Colors.black),
                    ),
                    onTap: () {
                      Share.share("Name : ${list[0]}\nMobile : ${list[2]}");
                    },
                  ),
                ];
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Text(
                      "${list[1]}",
                      style: GoogleFonts.satisfy(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "${list[0]}",
                  style: GoogleFonts.satisfy(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "+91-${list[2]}",
                        style: GoogleFonts.satisfy(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 140),
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            String contact1 = "${list[2]}";
                            await launchUrl(Uri.parse("tel:$contact1"));
                          },
                          icon: Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    w(15),
                    Container(
                      alignment: Alignment.centerRight,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          String contact2 = "${list[1]}";
                          await launchUrl(Uri.parse("sms:$contact2"));
                        },
                        icon: Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    w(15),
                    Container(
                      alignment: Alignment.centerRight,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.video_call,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black),
              ),
              h(10),
              Row(
                children: [
                  w(20),
                  Expanded(
                    child: Text(
                      "WhatsApp",
                      style: GoogleFonts.satisfy(
                          fontSize: 20, color: Colors.black),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse(
                            "whatsapp://send?phone=+91" + list[2] + "&text="),
                      );
                    },
                    icon: Icon(
                      Icons.whatsapp_rounded,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              h(25),
              Row(
                children: [
                  w(20),
                  Expanded(
                    child: Text(
                      "Telegram",
                      style: GoogleFonts.satisfy(
                          fontSize: 20, color: Colors.black),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse("https://telegram.me/<telegram>"),
                      );
                    },
                    icon: Icon(
                      Icons.telegram,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              h(25),
              Row(
                children: [
                  w(20),
                  Expanded(
                    child: Text(
                      "Meet",
                      style: GoogleFonts.satisfy(
                          fontSize: 20, color: Colors.black),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/images/Meet.png"),
                    ),
                  ),
                ],
              ),
              h(20),
              Container(
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black),
              ),
              h(20),
              Row(
                children: [
                  w(20),
                  Expanded(
                    child: Text(
                      "More",
                      style: GoogleFonts.satisfy(
                          fontSize: 15, color: Colors.black),
                    ),
                  ),
                ],
              ),
              h(20),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    w(20),
                    Expanded(
                      child: Text(
                        "Default ringtone",
                        style: GoogleFonts.satisfy(
                            fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              h(15),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    w(20),
                    Expanded(
                      child: Text(
                        "QR code",
                        style: GoogleFonts.satisfy(
                            fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              h(15),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    w(20),
                    Expanded(
                      child: Text(
                        "Send money",
                        style: GoogleFonts.satisfy(
                            fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              h(15),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    w(20),
                    Expanded(
                      child: Text(
                        "Request money",
                        style: GoogleFonts.satisfy(
                            fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                    w(25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget h(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget w(double width) {
    return SizedBox(
      width: width,
    );
  }
}
