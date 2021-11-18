import 'package:flutter/material.dart';

class SchedularTemplate extends StatefulWidget {
  const SchedularTemplate({Key? key}) : super(key: key);

  @override
  _SchedularTemplateState createState() => _SchedularTemplateState();
}

class _SchedularTemplateState extends State<SchedularTemplate> {
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
                    "Upcoming",
                    style: TextStyle(
                        color: Color.fromRGBO(37, 59, 107, 1.0),
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "tasks ",
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
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              side: const BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              value: false,
                              onChanged: (value) {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Read Type Guidelines",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              side: const BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              value: false,
                              onChanged: (value) {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Complete responsive design",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              checkColor:
                                  const Color.fromRGBO(37, 59, 107, 1.0),
                              activeColor: Colors.greenAccent,
                              side: const BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              value: true,
                              onChanged: (value) {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Bring Groceries",
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        )
                      ],
                    ),
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
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              side: const BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              value: false,
                              onChanged: (value) {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Read Type Guidelines",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              side: const BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              value: false,
                              onChanged: (value) {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Complete responsive design",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              checkColor:
                                  const Color.fromRGBO(37, 59, 107, 1.0),
                              activeColor: Colors.greenAccent,
                              side: const BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              value: true,
                              onChanged: (value) {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Bring Groceries",
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        )
                      ],
                    ),
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
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              side: const BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              value: false,
                              onChanged: (value) {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Read Type Guidelines",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              side: const BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              value: false,
                              onChanged: (value) {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Complete responsive design",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 59, 107, 1.0),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              checkColor:
                                  const Color.fromRGBO(37, 59, 107, 1.0),
                              activeColor: Colors.greenAccent,
                              side: const BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              value: true,
                              onChanged: (value) {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0))),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Bring Groceries",
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        )
                      ],
                    ),
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
