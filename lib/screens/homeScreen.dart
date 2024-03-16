import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rushmore/controllers/homeController.dart';
import 'package:rushmore/screens/instructions.dart';
import 'package:rushmore/screens/webview.dart';
import 'package:rushmore/widgets/cardwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> celebrities = [];
  TextEditingController questionController = TextEditingController();
  final controller = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    HomeController.instance.celebrities.clear();
    HomeController.instance.imagesList.clear();
    HomeController.instance.questions = '';
  }

  void submitTheForm() {
    final validation = _formKey.currentState!.validate();

    if (!validation || questionController.text.isEmpty) {
      // Get.snackbar('Invalid Data', 'Your Fields might be empty');
      return;
    } else {
      _formKey.currentState!.save();
      HomeController.instance.addCeleberities(celebrities);
      HomeController.instance.questions = questionController.text;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Choose The Platform'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebScreenShots(
                              url: 'https://www.shutterstock.com/search/',
                              params: '?image_type=photo&category=People',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/stock.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebScreenShots(
                              url: 'https://www.google.com/search?q=',
                              params: '&tbm=isch&source=lnms',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/google.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          color: Colors.white,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CardWidget(
                  image1: 'assets/images/marvinGaye.jpg',
                  image2: 'assets/images/georgeWashington.png',
                  image3: 'assets/images/AbrahimLincolen.png',
                  image4: 'assets/images/thoedoreroswelt.png',
                  question: 'Who`s on your mount rushmore?',
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(children: [
                  Container(
                    width: double.infinity,
                    height: 40,
                    alignment: Alignment.center,
                    child: const Text(
                      'Ask Question',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Instructions(),
                        ),
                      ),
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF151515),
                          shape: OvalBorder(),
                        ),
                        child: const Icon(
                          Icons.question_mark,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.center,
                  height: 49,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 250, 250, 250),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextFormField(
                    controller: questionController,
                    validator: (value) {
                      if (value == null ||
                          value.trim().length <= 0 ||
                          value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      String celebrity1 = value!;
                      celebrities.add(celebrity1);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(88, 0, 0, 0),
                      ),
                      hintText: 'Ask Your Question here',
                      hintStyle: TextStyle(color: Color.fromARGB(82, 0, 0, 0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Type Celebrity Names',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      alignment: Alignment.center,
                      height: 49,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 250, 250, 250),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null ||
                              value.trim().length <= 0 ||
                              value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          String celebrity1 = value!;
                          celebrities.add(celebrity1);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(88, 0, 0, 0),
                          ),
                          hintText: 'Enter first celebrity name',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(82, 0, 0, 0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      height: 49,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 250, 250, 250),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null ||
                              value.trim().length <= 0 ||
                              value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          String celebrity2 = value!;
                          celebrities.add(celebrity2);
                        },
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(height: 0),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(88, 0, 0, 0),
                          ),
                          hintText: 'Enter second celebrity name',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(82, 0, 0, 0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      height: 49,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 250, 250, 250),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          String celebrity3 = value!;
                          celebrities.add(celebrity3);
                        },
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(height: 0),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(88, 0, 0, 0),
                          ),
                          hintText: 'Enter third celebrity name',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(82, 0, 0, 0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      height: 49,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 250, 250, 250),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          String celebrity4 = value!;
                          celebrities.add(celebrity4);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          errorStyle: TextStyle(height: 0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(88, 0, 0, 0),
                          ),
                          hintText: 'Enter fourth celebrity name',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(82, 0, 0, 0)),
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    submitTheForm();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    height: 57,
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
