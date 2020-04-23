import 'package:covid_19_observer/data/data.dart';
import 'package:flutter/material.dart';
import '../http/hattp.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cases = 0;
  int _deaths = 0;
  int _recoverd = 0;
  var _index = TextEditingController();
  var pais = TextEditingController();
  Widget c = Text("Nao existe");
  void _incrementCounter() {
    getCovidAllC();
    test1();
    getCovidAll().then((val) {
      setState(() {
        _cases = val['cases'];
        _deaths = val['deaths'];
        _recoverd = val['recovered'];
      });
    });
  }

  void cd() {
    lista_cases.asMap().forEach((index, value) => {
          if (value.getCountry().toString() == this.pais)
            {this.c = Casos(i: index)}
        });
    setState(() {});
  }

  @override
  void initState() {
    _incrementCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFB1FAFF),
          appBar: AppBar(
            backgroundColor: Color(0xFF000000),
            title: const Text('Covid 19'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  _incrementCounter();
                },
              ),
            ],
          ),
          body: ListView(
            children: <Widget>[
              Container(
                width: width,
                color: Color(0xFFB1FAFF),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: height * 0.1,
                      margin: EdgeInsets.all(10),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.room),
                          Text(
                            "Mundo",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: height * 0.2,
                      color: Colors.black,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            "Infectados",
                            style: TextStyle(color: Colors.yellow),
                          ),
                          Container(
                            width: width,
                            height: height * 0.16,
                            child: Card(
                                color: Colors.yellowAccent[400],
                                child: Center(
                                  child: Text(
                                    "$_cases",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              width: width * 0.45,
                              height: height * 0.2,
                              color: Colors.black,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    "Recuperados",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  Container(
                                    width: width * 0.43,
                                    height: height * 0.16,
                                    child: Card(
                                        color: Colors.teal,
                                        child: Center(
                                          child: Text(
                                            "$_recoverd",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        )),
                                  )
                                ],
                              )),
                          Container(
                              width: width * 0.45,
                              height: height * 0.2,
                              color: Colors.black,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    "Mortos",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Container(
                                    width: width * 0.43,
                                    height: height * 0.16,
                                    child: Card(
                                        color: Colors.red[400],
                                        child: Center(
                                          child: Text(
                                            "$_deaths",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        )),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
                      child: new TextField(
                        textAlign: TextAlign.center,
                      decoration:
                          new InputDecoration(labelText: "Pais(em ingles)",
                          fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),),
                          
                      controller: pais,
                    ),
                    ),
                    FlatButton(
                        onPressed: () => {
                              lista_cases.asMap().forEach((index, value) => {
                                    if (value.getCountry().toString().toLowerCase() ==
                                        pais.text)
                                      {
                                        setState(() {
                                          this.c = Casos(i: index);
                                          print(index);
                                        })
                
                                        
                                        }
                                  })
                            },
                        child: Text("buscar")),
                    c,
                    SizedBox(
                      height: 20,
                    ),
                   /* TextField(
                      keyboardType: TextInputType.number,
                      controller: _index,
                      onChanged: (text) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Pais',
                      ),
                    ),
                    _index.text != "" && int.parse(_index.text) >= 0
                        ? Casos(i: int.parse(_index.text))
                        : Text("data")*/
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class Casos extends StatefulWidget {
  int i;
  _HomePageState parent;
  Casos({Key key, this.i}) : super(key: key);

  @override
  _CasosState createState() => _CasosState();
}

class _CasosState extends State<Casos> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Container(
          height: height * 0.1,
          margin: EdgeInsets.all(10),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.room),
              Text(
                lista_cases[widget.i].getCountry(),
                style: TextStyle(fontSize: 30),
              ),
            ],
          )),
        ),
        Container(
          height: height * 0.2,
          color: Colors.black,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "Infectados",
                style: TextStyle(color: Colors.yellow),
              ),
              Container(
                width: width,
                height: height * 0.16,
                child: Card(
                    color: Colors.yellowAccent[400],
                    child: Center(
                      child: Text(
                        lista_cases[widget.i].getCases().toString(),
                        style: TextStyle(fontSize: 30),
                      ),
                    )),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  width: width * 0.45,
                  height: height * 0.2,
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "Recuperados",
                        style: TextStyle(color: Colors.green),
                      ),
                      Container(
                        width: width * 0.43,
                        height: height * 0.16,
                        child: Card(
                            color: Colors.teal,
                            child: Center(
                              child: Text(
                                lista_cases[widget.i].getRecovered().toString(),
                                style: TextStyle(fontSize: 30),
                              ),
                            )),
                      )
                    ],
                  )),
              Container(
                  width: width * 0.45,
                  height: height * 0.2,
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "Mortos",
                        style: TextStyle(color: Colors.red),
                      ),
                      Container(
                        width: width * 0.43,
                        height: height * 0.16,
                        child: Card(
                            color: Colors.red[400],
                            child: Center(
                              child: Text(
                                lista_cases[widget.i].getDeaths().toString(),
                                style: TextStyle(fontSize: 30),
                              ),
                            )),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
