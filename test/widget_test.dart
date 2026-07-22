import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redisenho_portfolio/src/widgets/featured_project.dart';

void main() {
  testWidgets('Finanzi carousel renders and advances', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: FeaturedProjectSection(
                  screenWidth: constraints.maxWidth,
                  constraints: constraints,
                  preloadCarousel: false,
                ),
              );
            },
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Finanzi'), findsOneWidget);
    expect(find.text('EN PRODUCCIÓN'), findsOneWidget);
    expect(find.text('1 / 6'), findsOneWidget);
    expect(find.text('DESCARGAR EN'), findsOneWidget);
    expect(find.text('Google Play'), findsOneWidget);
    expect(find.text('Flutter'), findsNothing);
    expect(find.text('Dart'), findsNothing);

    await tester.drag(find.byType(PageView), const Offset(-500, 0));
    await tester.pump(const Duration(milliseconds: 600));

    expect(find.text('2 / 6'), findsOneWidget);
  });

  testWidgets('Finanzi shows its carousel preload state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: FeaturedProjectSection(
                  screenWidth: constraints.maxWidth,
                  constraints: constraints,
                ),
              );
            },
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Preparando carrusel Finanzi'), findsOneWidget);
    expect(find.textContaining('de 6 imágenes'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 800));
  });
}
