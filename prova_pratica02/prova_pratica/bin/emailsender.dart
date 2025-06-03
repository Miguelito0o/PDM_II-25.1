import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

Future<void> enviarEmail(String conteudoJson) async {
  final smtpServer = gmail('miguel.ribeiro07@aluno.ifce.edu.br', 'epqy hzsd pcvs xqhr');

  final message = Message()
    ..from = Address('miguel.ribeiro07@aluno.ifce.edu.br', 'Miguelito')
    ..recipients.add('taveira@ifce.edu.br')
    ..subject = 'Prova Prática 02'
    ..text = 'JSON:\n\n$conteudoJson';


  try {
    final sendReport = await send(message, smtpServer);

    print('E-mail enviado: ${sendReport}');
  } on MailerException catch (e) {
    print('Erro ao enviar e-mail: ${e.toString()}');
  }
}