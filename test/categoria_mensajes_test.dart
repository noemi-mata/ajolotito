import 'package:ajolotito/dominio/categoria.dart';
import 'package:ajolotito/dominio/mensajes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('cada categoría tiene su propio canal', () {
    final ids = Categoria.values.map((c) => c.canal.id).toSet();
    expect(ids.length, Categoria.values.length);
  });

  test('hambre es importante y sorpresa es discreta', () {
    expect(Categoria.hambre.canal.importancia, Importancia.alta);
    expect(Categoria.sorpresa.canal.importancia, Importancia.baja);
  });

  test('los mensajes llevan el nombre del ajolote', () {
    expect(Mensajes.hambre('Xólotl', 0).titulo, contains('Xólotl'));
    expect(Mensajes.critico('Xólotl', 0).titulo, contains('Xólotl'));
  });

  test('la misma semilla da el mismo mensaje (determinista)', () {
    final a = Mensajes.sorpresa('X', 13);
    final b = Mensajes.sorpresa('X', 13);
    expect(a.titulo, b.titulo);
    expect(a.cuerpo, b.cuerpo);
  });

  test('una semilla negativa no truena', () {
    expect(() => Mensajes.hambre('X', -7), returnsNormally);
  });
}