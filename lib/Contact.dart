import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    List name = [
      "PARTH",
      "BHAI",
      "Ronak Kanani",
      "Tushar Radadiya",
      "Vidit Sir",
      "Jayraj Kalsariya",
      "Dairy",
      "Kaushik Undhad",
      "Utkarsh Korat"
    ];
    List cont = [
      "7201061197",
      "9737589382",
      "9313076796",
      "7984511007",
      "7046632531",
      "9104497779",
      "8320806387",
      "7046519884",
      "9712020743"
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SelectableText(
            "Contact Diary",
            style: GoogleFonts.satisfy(fontSize: 20, color: Colors.black),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: name
              .asMap()
              .entries
              .map((e) =>
                  info("${name[e.key]}", "${name[e.key][0]}", "${cont[e.key]}"))
              .toList(),
        ),
      ),
    );
  }

  Widget info(String name1, logo, cont1) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          w(5),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                'D',
                arguments: [
                  name1,
                  logo,
                  cont1,
                ],
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "$logo",
                style: GoogleFonts.satisfy(color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  h(5),
                  SelectableText(
                    "$name1",
                    style: GoogleFonts.satisfy(color: Colors.white),
                  ),
                  h(5),
                  SelectableText(
                    "$cont1",
                    style: GoogleFonts.satisfy(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: () {
                launchUrl(
                  Uri.parse("tel:$cont1"),
                );
              },
              icon: Icon(
                Icons.call,
                color: Colors.white,
              ),
            ),
          ),
          w(5),
          Container(
            alignment: Alignment.centerRight,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: () {
                launchUrl(
                  Uri.parse("sms:$cont1"),
                );
              },
              icon: Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
          ),
          w(5),
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
          w(5),
        ],
      ),
    );
  }

  Widget h(double height) {
    return SizedBox(height: height);
  }

  Widget w(double width) {
    return SizedBox(width: width);
  }
}
