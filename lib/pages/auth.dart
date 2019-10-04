import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop))),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: 'Email', filled: true, fillColor: Colors.white),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  setState(() {
                    _emailValue = value;
                  });
                },
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _passwordValue = value;
                  });
                },
              ),
              SizedBox(height: 10.0),
              DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white10, Colors.orangeAccent, Colors.orangeAccent, Colors.white10])),
                child: SwitchListTile(
                  value: _acceptTerms,
                  onChanged: (bool value) {
                    setState(() {
                      _acceptTerms = value;
                    });
                  },
                  title: Text('Accept terms'),
                ),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text('LOGIN'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
