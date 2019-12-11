import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "App Bolão",
    home: Home()));
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
    List<String> placar=["0","1","2","3","4","5",];
    List<String> clubes = ["Clubes","Flamengo","Palmeiras","Corinthians","Vasco","São Paulo","Santos","Cruzeiro","Botafogo","Fluminense","Atletico","Chape","Athletico","Grêmio","Inter","Csa","Avaí","Fortaleza","Ceará","goiás","Bahia",];

    //List<String> placar2=["1","2","3",];

    String _placar = "0";
    String _placar2 = "0";
    String _clube1 = "Clubes";
    String _clube2 = "Clubes";

    

  TextEditingController nome_clienteController = TextEditingController();
  TextEditingController valor_apostaController = TextEditingController();

  GlobalKey <FormState> _formKey = GlobalKey<FormState>();
  
  String _cliente = "";
  String _placarTot = "";
  String _valor = "";
  //String _valor= "";


  void placarHome (String value){
  setState((){
    _placar = value;
  });

}
 void placarAway (String value){
  setState((){
    _placar2 = value;
  });

}

void clubHome (String value){
  setState((){
    _clube1 = value;
  });

}
void clubAway (String value){
  setState((){
    _clube2 = value;
  });

}

void _deletarJogo(){
  setState((){
    nome_clienteController.text = "";
    valor_apostaController.text = "";
    _clube1 = "Clubes";
    _clube2 = "Clubes";
    _placar = "0";
    _placar2 = "0";
    _placarTot = "";
    _cliente = "";
    _valor=  "";


  });

}

void validarAposta(){
  setState((){
    _cliente = ("Nome do Cliente:\n ${nome_clienteController.text}");
    _placarTot = ("Seu Palpite:\n ${_clube1}  ${_placar}  x  ${_placar2} ${_clube2}");
    _valor = ("Valor:\n ${valor_apostaController.text} R\$");
    //saveData;

  });
}

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bolão da Sorte"),
        centerTitle: true,
        style: TextStyle(color: Colors.black),

        backgroundColor: Colors.lightGreen[200],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
        onPressed: _deletarJogo,
        )
        ], 
      ),

      body:Stack(
        children: <Widget>[
          Image.asset("imagens/campo2.jpeg",
          fit: BoxFit.cover,
          height: 700.0,
          width: 600.0, 
          ),
          SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,

          child: Column(
            children: <Widget>[
              Text("    Bem vindo ao nosso bolão \n      Cadastre-se e boa sorte",
              style: TextStyle(fontSize: 18.0),),
                
              Padding(padding: EdgeInsets.only(top: 20.0),),

              TextFormField(
                validator: (String){
                  if (String.isEmpty){
                    return "Insira seu nome para continuar com o cadastro";
                  }
                },
                
                controller: nome_clienteController,
                decoration: InputDecoration(
                  hintText: "NOME DO CLIENTE",
                  labelText: "NOME DO CLIENTE",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0),),


              Row(
                children: <Widget>[
                  
                  DropdownButton(
                  onChanged: (String value){
                    clubHome(value);
                  },
                  value: _clube1         ,
                  items: clubes.map((String value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text("   "), 
                    DropdownButton(
                    
                  onChanged: (String value){
                    placarHome(value);
                  },
                  
                  value: _placar,
                  items: placar.map((String value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text("  X   "),
                DropdownButton(
                    
                  onChanged: (String value){
                    placarAway(value);
                  },
                  value: _placar2,
                  items: placar.map((String value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text("   "),
                DropdownButton(
                    
                  onChanged: (String value){
                    clubAway(value);
                  },
                  value: _clube2,
                  items: clubes.map((String value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ]
              ),
              
                Padding(padding: EdgeInsets.only(top: 20.0),),
              
              TextFormField(
                keyboardType: TextInputType.number,

                validator: (String){
                  if (String.isEmpty){
                    return "Insira o valor da aposta";
                  }
                },
                controller: valor_apostaController,
                

                decoration: InputDecoration(

                  
                  hintText: "Valor (R\$)",
                  labelText: "Valor (R\$)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
              ),
                Padding(padding: EdgeInsets.only(top: 20.0),),

              RaisedButton(
                  child: Text("Validar aposta"),
                  color: Colors.green,
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                    validarAposta();
                    }
                  },
                ),

              Text(
                _cliente,
                textAlign: TextAlign.center,
                                  
                style: TextStyle(color: Colors.black,fontSize: 20.0,),
              
              ),
              Text("---------------------------------------------------------------------------------------"),
              Text(
                _placarTot,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),
              Text("---------------------------------------------------------------------------------------"),
              Text(
                _valor,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),

            ]
          )
        )

      ),
        ]
      ) 
        
    );
  }
} 

