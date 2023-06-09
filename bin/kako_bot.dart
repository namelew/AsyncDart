
import 'dart:io';

import 'questions/good_manners.dart';
import 'questions/time_questions.dart';
import 'timing/waiting_time.dart';

void main() async {
  String kakoBot = 'KakoBOT:\n';
  var a = true;
  String usuario = '';
  
  var myStream = BotClock().botStream(1,10);
  var subscriber = myStream.listen((event) {
    print("                     Kakobot está ativo à $event segundo");
  }, onDone: () {
    print("Kakobot está finalizando, faça a última pergunta!");
    a = false;
  },);

  print('-- Iniciando o KakoBOT, aguarde..--');
  await BotClock(waitTime: Duration(seconds: 2)).clock();
  print('KakoBOT:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await BotClock(waitTime: Duration(seconds: 1)).clock();
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(kakoBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      await BotClock(waitTime: Duration(seconds: 2)).clock();
      TimeQuestions(usuario).timeQuestion();
    } else if (GoodMannners(usuario).isThisManners()) {
      await BotClock(waitTime: Duration(seconds: 2)).clock();
      GoodMannners(usuario).goodMannners();
    } else if (false) {
      //Basta adicionar novas perguntas aqui!
    } else {
      await BotClock(waitTime: Duration(seconds: 2)).clock();
      print(kakoBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(kakoBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando KakoBOT--');
}
