import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

main() async {
  // Configura as credenciais SMTP do Gmail
  final smtpServer = gmail('miguel.ribeiro07@aluno.ifce.edu.br', 'epqy hzsd pcvs xqhr');

  // Cria uma mensagem de e-mail
  final message = Message()
    ..from = Address('miguel.ribeiro07@aluno.ifce.edu.br', 'Miguelito')
    ..recipients.add('joaogtito@gmail.com')
    ..subject = 'Prova Prática 01'
    ..text = '';

  try {
    // Envia o e-mail usando o servidor SMTP do Gmail
    final sendReport = await send(message, smtpServer);

    // Exibe o resultado do envio do e-mail
    print('E-mail enviado: ${sendReport}');
  } on MailerException catch (e) {
    // Exibe informações sobre erros de envio de e-mail
    print('Erro ao enviar e-mail: ${e.toString()}');
  }
}
