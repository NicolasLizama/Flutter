import 'package:flutter/material.dart';
import 'package:flutter_application_2/HomeScreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  final TextEditingController _loginController =  TextEditingController();
  final TextEditingController _passController =  TextEditingController();
  static  String TextEstado="";

final messengerKey = GlobalKey<ScaffoldMessengerState>();

  void  validaUser(String login, String password, BuildContext context) {
    
    if (login == "duoc" && password=="duoc2025"){
      //todo ok 
      TextEstado="TODO OK";
     ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("TODO OK")),
              );

      Navigator.push(context, 
      MaterialPageRoute(builder:(context)=>HomeScreen()));

    }else{
        TextEstado="TODO MAL";
      ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('ERROR DE CREDENCIALES')),
            
            
  );

    setState(() {
      
    });
  
    }

  }

  TextField cajaTexto(String text, TextEditingController controller,bool isPass){
    return   TextField(
      obscureText: isPass,
                decoration: InputDecoration(
                  labelText: text,
                  border: OutlineInputBorder()
                ),
                controller: controller,
                
              );
  }


  @override
  Widget build(BuildContext context) {
    print("Pase por el build");
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Login Page"),),
      body:Builder(
        builder: (context) =>  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              child: Column(
                children: [
                  Text("Ingrese sus credenciales", style: TextStyle(fontSize: 24),),
                  SizedBox(height: 20,),
                     Text("Ingrese su Login"),
                  cajaTexto("Ingrese Login", _loginController,false),
                  SizedBox(height: 20,),
                  Text("Ingrese su pass"),
                  cajaTexto("Ingrese Password", _passController,true),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed:()
                  {
                     validaUser(_loginController.text,_passController.text, context);
                  },
                   style: ButtonStyle(
                    backgroundColor:WidgetStateProperty.all(Colors.deepOrangeAccent),
                   ),
                   child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.verified_user,color:  Colors.white,),
                      SizedBox(width: 10,),
                      Text("Ingresar",style :TextStyle(color: Colors.white),)
        
                      ]
                    ),
                   )
                   
                   
                   ),
                    Text("Estado:$TextEstado")
                ],
              ),
          
          ),
        ),
      )
    );
  }
}