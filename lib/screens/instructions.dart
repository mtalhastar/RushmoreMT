import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rushmore/screens/homeScreen.dart';
import 'package:url_launcher/url_launcher.dart';
class Instructions extends StatelessWidget {
   Instructions({super.key});
   final Uri uri = Uri.parse('https://youtu.be/pLF8bNamkmg?si=e_ELp3qgNJyMsGPV');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 1000,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                width: double.infinity,
                height: 53,
                child: Text(
                  'Instructions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 43,
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF151515),
                      shape: OvalBorder(),
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Ask a question and enter your favourite celebrity names then click ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Submit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 43,
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF151515),
                      shape: OvalBorder(),
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Click on the image which has a clear face. You can also zoom on face if face is small then click on ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Process Image',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'The process will repeat for all 4 images then you will be shown the result',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Important Note',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'If the image has no clear face detected, App will ask you to try again, make sure image has clear face.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 43,
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF151515),
                      shape: OvalBorder(),
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'On result page you will\n find celebrities images super-imposed\n now you can Click on ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Share',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' to share it\n on social media platforms with your friends.',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('To Watch Video Tutorial of using the App Press the icon below',
              textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,)),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () async {
                  
                   if (!await launchUrl(uri)) {
                      // Get.snackbar('Cannot Lauunch','Url changed');
                    }
                  },
                  child: Card(
                    child: Image.asset(
                      'assets/images/youtube.png',
                      width: 80,
                      height: 80,
                                ),
                  )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () =>Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    ),
                child: Container(
                  width: 284,
                  height: 57,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Got it',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
