import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _cidades = [

    "Aracaju",
    "Belém",
    "Belo Horizonte",
    "Boa Vista,",
    "Brasilia",
    "Campo Grande"
    "Cuiaba",
    "Curitiba",
    "Florianopolis",
    "Fortaleza",
    "Goiânia",
    "João Pessoa",
    "Macapá",
    "Maceió",
    "Manaus",
    "Natal",
    "Palmas",
    "Porto Alegre",
    "Porto Velho",
    "Recife",
    "Rio Branco",
    "Rio de Janeiro",
    "Salvador",
    "São Luiz",
    "São Paulo",
    "Teresina"
    "Vitória",

  ];
  String _cidadeSelecionada ="São Paulo";
  carregaCLima () async {

    const String  _appid = "c92c5b87fc513766c06716a7b1912406";//Chave da appi
    const String _lang = "pt-br";
    const String _units = "metric";

    const String _apiURL = "api.openweathermap.org";
    const String _path = "/data/2.5/weather";

    final _parametros = {
      "q" : _cidadeSelecionada,
      "appid" : _appid,
      "lang" : _lang,
      "units" : _units

    };

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(_cidadeSelecionada),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            _buildList(_cidades)


          ],

        ),
      ),

    );
  }
  Widget _buildList(List <String> listData){
    return DropdownSearch <String>(
      mode: Mode.MENU,
      showSelectedItems: true,
      // maxHeight: MediaQuery.of(context).size.height - 100,
      items: _cidades,
      showSearchBox: true,
      onChanged: (value) {
        setState(() {
          if(value == null || value == ""){
            _cidadeSelecionada = "Selecione uma cidade";

          } else {
            _cidadeSelecionada = value;
          }

        });
      },
      validator: (value) => value == null || value.isEmpty
          ? "Selecione uma cidade"
          : null,
      showClearButton: true,
      clearButton: const Icon(Icons.close),
      autoValidateMode: AutovalidateMode.onUserInteraction,


    );

  }
}
