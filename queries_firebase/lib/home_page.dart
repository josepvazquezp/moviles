import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queries_firebase/bloc/queries_bloc.dart';
import 'package:queries_firebase/chats_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Login/Register'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<QueriesBloc, QueriesState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return CircularProgressIndicator();
              } else if (state is ChangeViewRegisterState) {
                return _registerWidget(context);
              }

              return _loginWidget(context);
            },
          ),
          BlocListener<QueriesBloc, QueriesState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatsPage(),
                  ),
                );
              }
            },
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget _loginWidget(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  label: Text(
                    "Email",
                  ),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  label: Text(
                    "Password",
                  ),
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<QueriesBloc>(context).add(
                          ChangeViewEvent(),
                        );
                      },
                      child: Text("Sign in")),
                  MaterialButton(
                    color: Colors.white,
                    onPressed: () {
                      BlocProvider.of<QueriesBloc>(context).add(
                        LoginEvent(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    child: Text("Login", style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerWidget(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  label: Text(
                    "Name",
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  label: Text(
                    "Email",
                  ),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  label: Text(
                    "Password",
                  ),
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    color: Colors.white,
                    onPressed: () {
                      BlocProvider.of<QueriesBloc>(context).add(
                        RegisterEvent(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                        ),
                      );
                    },
                    child:
                        Text("Sign in", style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
