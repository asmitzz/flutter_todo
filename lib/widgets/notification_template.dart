import 'package:flutter/material.dart';

class NotificationsTemplate extends StatefulWidget {
  const NotificationsTemplate({Key? key}) : super(key: key);

  @override
  _NotificationsTemplateState createState() => _NotificationsTemplateState();
}

class _NotificationsTemplateState extends State<NotificationsTemplate> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: double.infinity),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 238, 238, 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Alerts &",
                    style: TextStyle(
                        color: Color.fromRGBO(37, 59, 107, 1.0),
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "updates ",
                        style: TextStyle(
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 3.0),
                          width: 25.0,
                          height: 3.0,
                          color: const Color.fromRGBO(37, 59, 107, 1.0))
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Tomorrow",
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            child: const Center(
                                child: Text(
                              "i",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(37, 59, 107, 1.0)),
                            )),
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.greenAccent)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Complete responsive design",
                          style: TextStyle(
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Container(
                            child: const Center(
                                child: Text(
                              "i",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(37, 59, 107, 1.0)),
                            )),
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.greenAccent)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Complete responsive design",
                          style: TextStyle(
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Tomorrow",
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            child: const Center(
                                child: Text(
                              "i",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(37, 59, 107, 1.0)),
                            )),
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.greenAccent)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Read Type Guidelines",
                          style: TextStyle(
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Container(
                            child: const Center(
                                child: Text(
                              "i",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(37, 59, 107, 1.0)),
                            )),
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.greenAccent)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Complete responsive design",
                          style: TextStyle(
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Sat, Nov 30, 2021",
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            child: const Center(
                                child: Text(
                              "i",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(37, 59, 107, 1.0)),
                            )),
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.greenAccent)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Complete responsive design",
                          style: TextStyle(
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Container(
                            child: const Center(
                                child: Text(
                              "i",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(37, 59, 107, 1.0)),
                            )),
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.greenAccent)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Complete responsive design",
                          style: TextStyle(
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
