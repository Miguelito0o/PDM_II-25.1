import 'dart:convert';
import 'package:prova_pratica/classes.dart';
import 'emailsender.dart';

void main() async{
  var disciplina1 = Disciplina(1, 'PDM2', 60);
  var disciplina2 = Disciplina(2, 'BD', 40);

  var professor1 = Professor(1, '0303', 'Taveira');
  professor1.adicionarDisciplina(disciplina1);
  professor1.adicionarDisciplina(disciplina2);

  var aluno1 = Aluno(1, 'Miguel', '20231011060060');
  var aluno2 = Aluno(2, 'Sara', '20231011060070');

  var curso = Curso(1, 'Técnico Informática');
  curso.adicionarProfessor(professor1);
  curso.adicionarDisciplina(disciplina1);
  curso.adicionarDisciplina(disciplina2);
  curso.adicionarAluno(aluno1);
  curso.adicionarAluno(aluno2);

  final json = const JsonEncoder.withIndent('  ').convert(curso.toJson());


  print(json);

  await enviarEmail(json);
}