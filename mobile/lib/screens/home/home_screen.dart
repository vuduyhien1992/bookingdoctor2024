import 'dart:core';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/appointment.dart';
import 'package:mobile/screens/appointment/appointment_screen.dart';
import 'package:mobile/screens/doctor/doctor_screen.dart';
import '../../models/department.dart';
import '../../models/doctor.dart';
import '../../services/Department/department_api.dart';
import '../../utils/color_app.dart';
import '../../utils/ip_app.dart';
import '../../utils/list_service.dart';
import '../../utils/store_current_user.dart';
import 'package:mobile/services/appointment_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final currentUser = CurrentUser.to.user;
  late Future<List<Department>> departments;
  late Future<List<Appointment>> _appointmentFutureWaiting;
  late final Future<Appointment> _appointmentFuture;
  late Future<List<Doctor>>? doctors;
  final TextEditingController _searchController = TextEditingController();
  late int _selectedIndex = 0;

  bool _isSelectedHeart = false;
  late  String status;
  final ipDevice = BaseClient().ip;


  @override
  void initState() {
    super.initState();
    departments = getDepartments();
    doctors = getDoctorByDepartmentId(0);
    _appointmentFuture = AppointmentClient().fetchAppointmentPatient(currentUser['id'], 'waiting') as Future<Appointment>;
  }

  String formatTime(String time) {
    try {

      final DateTime parsedTime = DateFormat('HH:mm').parse(time);
      return DateFormat('HH:mm a').format(parsedTime);
    } catch (e) {
      // Trả về chuỗi giờ gốc nếu có lỗi khi parsing
      return time;
    }
  }

  String formatDate(String date) {
    try {
      final DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(date);
      return DateFormat('MMM dd, yyyy').format(parsedDate);
    } catch (e) {
      return date;
    }
  }

  // Future<Appointment> getAppointmentsWaiting() async {
  //   _appointmentFutureWaiting =
  //       AppointmentClient().fetchAppointmentPatient(currentUser['id'], 'waiting');
  //   final appointments = await _appointmentFutureWaiting;
  //   if (appointments.isNotEmpty) {
  //     return appointments.first;
  //   } else {
  //     return Appointment(
  //       id: 0,
  //       partientId: currentUser['id'],
  //       doctorId: currentUser['id'],
  //       scheduledoctorId: 1,
  //       price: 1,
  //       image: '',
  //       title: '',
  //       fullName: '',
  //       departmentName: '',
  //       status: '',
  //       note: '',
  //       appointmentDate: '',
  //       clinicHours: '',
  //       medicalExaminationDay: '',
  //       payment: '',
  //     );
  //   }
  // }

  void _handleSelected(int index) {
    setState(() {
      _selectedIndex = index;
      doctors = getDoctorByDepartmentId(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              // Làm tròn các góc
                              child: Image.network(
                                'http://$ipDevice:8080/images/patients/${currentUser['image']}',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text('Hello,',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start),
                                Text(
                                  '${currentUser['fullName']}',
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins'),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(
                                Icons.notifications_none,
                                size: 33,
                                color: Colors.black87,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/notifications');
                              },
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.heart,
                                size: 28,
                                color: Colors.black87,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/favorites');
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF2F4F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Color(0xFF98A2B2),
                            size: 28,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                counter: SizedBox.shrink(),
                                // Ẩn counter cho nhập chữ số duy nhất
                                counterText: '',
                                hintStyle: TextStyle(
                                  color: Color(0xFF98A2B2),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              // Chuyển trang tại đây
                              Navigator.pushNamed(context, '/filter');
                            },
                            child: const Icon(
                              Icons.tune,
                              color: Color(0xFF98A2B2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Upcoming xử lý
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Upcoming Appointment ',
                              style: TextStyle(
                                color: AppColor.primaryText,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigate to Create Account screen
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => AppointmentScreen()
                                    ));
                              },
                              child: const Text(
                                'SEE ALL',
                                style: TextStyle(
                                  color: Color(0xFF92A3FD),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.11,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                          FutureBuilder<Appointment>(
                          future: _appointmentFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData || snapshot.hasData == null) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/no_result_default.png'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'No Result Default',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text('There is no cancelled appointment'),
                                    const Text('Book your appointment now.'),
                                  ],
                                ),
                              );
                            } else {
                              Appointment appointment = snapshot.data!;
                              return Center(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, '/appointment/upcoming/detail', arguments: appointment);
                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFF9AC3FF), // Đầu gradient color
                                          Color(0xFF93A6FD), // Cuối gradient color
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(25),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(50),
                                                        // Làm tròn các góc
                                                        color: Colors.white, // Màu nền
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                        BorderRadius.circular(50),
                                                        child: Image.network(
                                                          'http://$ipDevice:8080/images/doctors/${appointment.image}',
                                                          width: 60,
                                                          height: 60,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '${appointment.title} ${appointment.fullName}',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        '${appointment.departmentName} | Medicare Hospital',
                                                        style: const TextStyle(
                                                          color: Colors.white70,
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              IconButton(
                                                  alignment: Alignment.topRight,
                                                  onPressed: () {},
                                                  icon: const FaIcon(
                                                    FontAwesomeIcons.ellipsisVertical,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          ),
                                          const SizedBox(height: 25),
                                          Row(
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(20),
                                                    color: const Color(0xFF8AABE7),
                                                  ),
                                                  child: Padding(
                                                      padding: const EdgeInsets.all(15),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          const Icon(Icons.date_range,
                                                              color: Colors.red),
                                                          const SizedBox(width: 10),
                                                          Text(
                                                            formatDate(appointment.medicalExaminationDay),
                                                            //Sep 10, 2024
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                            ),
                                                          ),
                                                          // Văn bản
                                                        ],
                                                      ))),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(20),
                                                    color: const Color(0xFF8AABE7),
                                                  ),
                                                  child: Padding(
                                                      padding: const EdgeInsets.all(15),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          const Icon(Icons.alarm,
                                                              color: Colors.red),
                                                          const SizedBox(width: 10),
                                                          Text(
                                                            formatTime(appointment.clinicHours),
                                                            style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                            ),
                                                          ),
                                                          // Văn bản
                                                        ],
                                                      ))),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              );
                            }
                          }
                        ),
                        // List
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Doctor Speciality',
                              style: TextStyle(
                                color: AppColor.primaryText,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => DoctorScreen()
                                    ));
                              },
                              child: const Text(
                                'SEE ALL',
                                style: TextStyle(
                                  color: Color(0xFF92A3FD),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.11,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: FutureBuilder<List<Department>>(
                              future: departments,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return const Center(
                                      child: Text('No departments found'));
                                } else {
                                  return SizedBox(
                                    // Đặt chiều cao phù hợp cho GridView
                                    height: 220,
                                    child: GridView.builder(
                                      padding: const EdgeInsets.all(10),
                                      itemCount: snapshot.data!.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 4,
                                        mainAxisSpacing: 20,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) => Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(builder: (context) => DoctorScreen()
                                                    ));
                                              },

                                              child: ClipRRect(
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      begin: Alignment(
                                                          -1.00, 0.08),
                                                      end: Alignment(1, -0.08),
                                                      colors: [
                                                        Color(0xFF92A3FD),
                                                        Color(0xFF9DCEFF)
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  child: Image.network(
                                                    'http://$ipDevice:8080/images/department/${snapshot.data![index].icon}',
                                                    width: 25,
                                                    height: 25,
                                                    //fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              snapshot.data![index].name,
                                              style: TextStyle(
                                                color: AppColor.primaryText,
                                                fontSize: 13,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Top Doctors',
                                    style: TextStyle(
                                      color: AppColor.primaryText,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Navigate to Create Account screen
                                      //Navigator.pushNamed(context, '/sign-in');
                                    },
                                    child: const Text(
                                      'SEE ALL',
                                      style: TextStyle(
                                        color: Color(0xFF92A3FD),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.11,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: FutureBuilder<List<Department>>(
                                  future: departments,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(child: CircularProgressIndicator());
                                    } else if (snapshot.hasError) {
                                      return Center(child: Text('Error: ${snapshot.error}'));
                                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                      return const Center(child: Text('No departments found'));
                                    } else {
                                      // Create a list of widgets from the data
                                      List<Widget> departmentWidgets = [
                                        ListService(
                                          index: 0,
                                          text: 'All',
                                          selectedIndex: _selectedIndex,
                                          onSelected: _handleSelected,
                                        ),
                                        const SizedBox(width: 8),
                                      ];
                                      for (var department in snapshot.data!) {
                                        departmentWidgets.add(
                                          ListService(
                                            index: department.id,
                                            text: department.name,
                                            selectedIndex: _selectedIndex,
                                            onSelected: _handleSelected,
                                          ),
                                        );
                                        departmentWidgets.add(const SizedBox(width: 8));
                                      }
                                      // Return a Row containing the list of widgets
                                      return Row(
                                        children: departmentWidgets,
                                      );
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: FutureBuilder<List<Doctor>>(
                                  future: doctors,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(child: CircularProgressIndicator());
                                    } else if (snapshot.hasError) {
                                      return Center(child: Text('Error: ${snapshot.error}'));
                                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                      return const Center(child: Text('No doctors found'));
                                    } else {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: snapshot.data!.map((doctor) {
                                            return Padding(
                                              padding: const EdgeInsets.only(bottom: 15),
                                              child: Container(
                                                height: 130,
                                                padding: const EdgeInsets.all(20),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black.withOpacity(0.1),
                                                      spreadRadius: 1,
                                                      blurRadius: 1,
                                                      offset: const Offset(0, 1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pushNamed(context, '/doctor', arguments:
                                                        {
                                                          'doctorId': doctor.id,
                                                        });
                                                      },
                                                      child: Row(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.circular(50),
                                                            child: Opacity(
                                                              opacity: 0.8,
                                                              child: Container(
                                                                width: 80,
                                                                height: 80,
                                                                //padding: const EdgeInsets.all(5),
                                                                decoration: BoxDecoration(
                                                                  color: Colors.lightBlueAccent,
                                                                  borderRadius: BorderRadius.circular(50),
                                                                ),
                                                                child: Image.network(
                                                                  'http://$ipDevice:8080/images/doctors/${doctor.image}',
                                                                  // width: 25,
                                                                  // height: 25,
                                                                  fit: BoxFit.contain,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 20),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                '${doctor.title} ' '${doctor.fullName}',
                                                                style: const TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Text(
                                                                doctor.department.name,
                                                                style: const TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              const Text(
                                                                'Medical Hospital',
                                                                style: TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                              const SizedBox(height: 5),
                                                              Row(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  const Icon(Icons.star, size: 18, color: Colors.orange),
                                                                  const SizedBox(width: 10),
                                                                  Text(doctor.rate.toString())
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _isSelectedHeart = !_isSelectedHeart;
                                                        });
                                                      },
                                                      icon: _isSelectedHeart
                                                          ? const Icon(Icons.favorite, color: Color(0xFF92A3FD))
                                                          : const Icon(Icons.favorite_border, color: Color(0xFF92A3FD)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]))));
  }
}
