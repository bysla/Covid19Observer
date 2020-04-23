import 'dart:convert';
import '../clases/covid.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../data/data.dart';


void getCovidAllC() async {
  var response =await http.get('https://coronavirus-19-api.herokuapp.com/countries');
  var result = response.body;
  List<dynamic> user = jsonDecode(result);
  Covid cases = new Covid();
  lista_cases.clear();
  lis.clear();
  for (var i = 0; i < user.length; i++) {
    cases = new Covid();
    cases.setCountry(user[i]['country']);
    cases.setCases(user[i]['cases']);
    cases.setTodayCases(user[i]['todayCases']);
    cases.setDeaths(user[i]['deaths']);
    cases.setTodayCases(user[i]['todayDeaths']);
    cases.setRecovered(user[i]['recovered']);
    cases.setActive(user[i]['active']);
    cases.setCritical(user[i]['critical']);
    cases.setCasesPerOneMillion(user[i]['casesPerOneMillion']);
    lista_cases.add(cases);
    lis.add(user[i]['country']);
    
  }
}

Future<Map<String,dynamic>> getCovidAll() async {
  var response =await http.get('https://coronavirus-19-api.herokuapp.com/all');
  var result = response.body;
  Map<String, dynamic> user = jsonDecode(result);
  return user;
}


 void test1() {
    for (var i = 0; i < lista_cases.length; i++) {
      print(lista_cases[i].getCountry());
    }
  }