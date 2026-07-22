import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../themes/colors.dart';

class FeaturedProjectSection extends StatefulWidget {
  const FeaturedProjectSection({
    super.key,
    required this.screenWidth,
    required this.constraints,
    this.preloadCarousel = true,
  });

  final double screenWidth;
  final BoxConstraints constraints;
  final bool preloadCarousel;

  @override
  State<FeaturedProjectSection> createState() => _FeaturedProjectSectionState();
}

class _FeaturedProjectSectionState extends State<FeaturedProjectSection> {
  static final Uri _googlePlayUri = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.waranitech.finanziapp&hl=es',
  );

  static const List<_FinanziSlide> _slides = [
    _FinanziSlide(
      asset: 'assets/imgs/projects/finanzi/01-portada-produccion.jpg',
      semanticLabel: 'Finanzi ya está en producción',
    ),
    _FinanziSlide(
      asset: 'assets/imgs/projects/finanzi/02-resumen-financiero.jpg',
      semanticLabel: 'Resumen financiero de Finanzi',
    ),
    _FinanziSlide(
      asset: 'assets/imgs/projects/finanzi/03-reportes-categorias.jpg',
      semanticLabel: 'Reportes y categorías de gastos en Finanzi',
    ),
    _FinanziSlide(
      asset: 'assets/imgs/projects/finanzi/04-registro-facturas.jpg',
      semanticLabel: 'Registro flexible de facturas en Finanzi',
    ),
    _FinanziSlide(
      asset: 'assets/imgs/projects/finanzi/05-perfil-planes.jpg',
      semanticLabel: 'Perfil y planes disponibles en Finanzi',
    ),
    _FinanziSlide(
      asset: 'assets/imgs/projects/finanzi/06-cierre-produccion.jpg',
      semanticLabel: 'Control financiero simple con Finanzi',
    ),
  ];

  late final PageController _carouselController;
  int _currentSlide = 0;
  bool _isHovered = false;
  bool _imagesPrecached = false;
  bool _carouselReady = false;
  int _loadedImageCount = 0;

  bool get _isMobile => widget.constraints.maxWidth < 600;
  bool get _useWideLayout => widget.constraints.maxWidth >= 1100;

  @override
  void initState() {
    super.initState();
    _carouselController = PageController();
    _carouselReady = !widget.preloadCarousel;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!widget.preloadCarousel || _imagesPrecached) return;
    _imagesPrecached = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _preloadCarouselImages();
    });
  }

  Future<void> _preloadCarouselImages() async {
    final imagePreloads = _slides.map((slide) async {
      try {
        await precacheImage(AssetImage(slide.asset), context);
      } catch (_) {
        // Image.asset mostrará su estado de error si un recurso falla.
      } finally {
        if (mounted) {
          setState(() => _loadedImageCount++);
        }
      }
    });

    await Future.wait([
      Future.wait(imagePreloads),
      Future<void>.delayed(const Duration(milliseconds: 800)),
    ]);

    if (mounted) {
      setState(() => _carouselReady = true);
    }
  }

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = _useWideLayout ? 80.0 : 20.0;

    return Container(
      width: widget.screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: _isMobile ? 48 : 64,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(),
          SizedBox(height: _isMobile ? 28 : 40),
          _useWideLayout ? _buildWideLayout() : _buildStackedLayout(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: _isMobile ? 12 : 16,
            vertical: _isMobile ? 6 : 8,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CustomColor.accentPrimary.withValues(alpha: 0.2),
                CustomColor.accentSecondary.withValues(alpha: 0.2),
              ],
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: CustomColor.accentSecondary.withValues(alpha: 0.45),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_rounded,
                color: CustomColor.accentSecondary,
                size: _isMobile ? 16 : 20,
              ),
              const SizedBox(width: 8),
              Text(
                _isMobile ? 'DESTACADO' : 'PROYECTO DESTACADO',
                style: GoogleFonts.inter(
                  fontSize: _isMobile ? 11 : 13,
                  fontWeight: FontWeight.w700,
                  color: CustomColor.accentSecondary,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomColor.accentSecondary.withValues(alpha: 0.8),
                  CustomColor.accentPrimary.withValues(alpha: 0.25),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWideLayout() {
    return _buildProjectPanel(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 11, child: _buildCarousel()),
          const SizedBox(width: 48),
          Expanded(flex: 10, child: _buildProjectInfo()),
        ],
      ),
    );
  }

  Widget _buildStackedLayout() {
    return _buildProjectPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: _buildCarousel(),
            ),
          ),
          SizedBox(height: _isMobile ? 28 : 40),
          _buildProjectInfo(),
        ],
      ),
    );
  }

  Widget _buildProjectPanel({required Widget child}) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()
          ..translate(0.0, _useWideLayout && _isHovered ? -6.0 : 0.0),
        padding: EdgeInsets.all(_isMobile ? 16 : 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_isMobile ? 20 : 28),
          gradient: LinearGradient(
            colors: [
              CustomColor.panelBg.withValues(alpha: 0.92),
              CustomColor.scaffoldBg.withValues(alpha: 0.72),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: _isHovered
                ? CustomColor.accentSecondary.withValues(alpha: 0.6)
                : CustomColor.panelBorder.withValues(alpha: 0.8),
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? CustomColor.accentSecondary.withValues(alpha: 0.12)
                  : Colors.black.withValues(alpha: 0.28),
              blurRadius: _isHovered ? 36 : 22,
              spreadRadius: 2,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: child,
      ),
    );
  }

  Widget _buildCarousel() {
    if (!_carouselReady) {
      return Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_isMobile ? 16 : 22),
              child: _buildCarouselPreloader(),
            ),
          ),
          const SizedBox(height: 24),
        ],
      );
    }

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(_isMobile ? 16 : 22),
                child: PageView.builder(
                  controller: _carouselController,
                  itemCount: _slides.length,
                  onPageChanged: (index) {
                    setState(() => _currentSlide = index);
                  },
                  itemBuilder: (context, index) {
                    final slide = _slides[index];
                    return Image.asset(
                      slide.asset,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                      semanticLabel: slide.semanticLabel,
                      frameBuilder: (
                        context,
                        child,
                        frame,
                        wasSynchronouslyLoaded,
                      ) {
                        if (wasSynchronouslyLoaded) return child;

                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            _buildImageLoadingPlaceholder(),
                            AnimatedOpacity(
                              opacity: frame == null ? 0 : 1,
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeOut,
                              child: child,
                            ),
                          ],
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return _buildImageErrorPlaceholder();
                      },
                    );
                  },
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.68),
                    borderRadius: BorderRadius.circular(18),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.16)),
                  ),
                  child: Text(
                    '${_currentSlide + 1} / ${_slides.length}',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCarouselButton(
                      icon: Icons.chevron_left_rounded,
                      tooltip: 'Imagen anterior',
                      onPressed: () => _showSlide(_currentSlide - 1),
                    ),
                    _buildCarouselButton(
                      icon: Icons.chevron_right_rounded,
                      tooltip: 'Imagen siguiente',
                      onPressed: () => _showSlide(_currentSlide + 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Semantics(
          label: 'Seleccionar imagen del carrusel',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _slides.length,
              (index) => InkWell(
                onTap: () => _showSlide(index),
                borderRadius: BorderRadius.circular(12),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: index == _currentSlide ? 28 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: index == _currentSlide
                        ? CustomColor.accentSecondary
                        : CustomColor.textSecondary.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselPreloader() {
    final progress = _loadedImageCount / _slides.length;

    return ColoredBox(
      color: CustomColor.panelBorder.withValues(alpha: 0.45),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 220),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: CustomColor.accentSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Preparando carrusel Finanzi',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: CustomColor.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 4,
                  backgroundColor:
                      CustomColor.textSecondary.withValues(alpha: 0.18),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    CustomColor.accentSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$_loadedImageCount de ${_slides.length} imágenes',
                style: GoogleFonts.inter(
                  color: CustomColor.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageLoadingPlaceholder() {
    return ColoredBox(
      color: CustomColor.panelBorder.withValues(alpha: 0.45),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 26,
              height: 26,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: CustomColor.accentSecondary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Cargando experiencia Finanzi',
              style: GoogleFonts.inter(
                color: CustomColor.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageErrorPlaceholder() {
    return ColoredBox(
      color: CustomColor.panelBorder.withValues(alpha: 0.45),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.broken_image_outlined,
              color: CustomColor.textSecondary,
              size: 30,
            ),
            const SizedBox(height: 10),
            Text(
              'No se pudo cargar la imagen',
              style: GoogleFonts.inter(
                color: CustomColor.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        color: Colors.black.withValues(alpha: 0.64),
        shape: const CircleBorder(),
        child: IconButton(
          onPressed: onPressed,
          tooltip: tooltip,
          icon: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }

  void _showSlide(int requestedIndex) {
    final targetIndex = (requestedIndex + _slides.length) % _slides.length;
    _carouselController.animateToPage(
      targetIndex,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
    );
  }

  Widget _buildProjectInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStatusBadge(),
        const SizedBox(height: 16),
        Text(
          'Finanzi',
          style: GoogleFonts.outfit(
            fontSize: _isMobile ? 36 : 50,
            fontWeight: FontWeight.w800,
            color: CustomColor.whitePrimary,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Control financiero simple',
          style: GoogleFonts.inter(
            fontSize: _isMobile ? 16 : 20,
            fontWeight: FontWeight.w600,
            color: CustomColor.accentSecondary,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Una aplicación para organizar ingresos, gastos, facturas y '
          'reportes en Paraguay. Finanzi combina una experiencia clara con '
          'registro flexible de movimientos y una lectura rápida de tu '
          'situación financiera.',
          style: GoogleFonts.inter(
            fontSize: _isMobile ? 14 : 16,
            color: CustomColor.textSecondary,
            height: 1.65,
          ),
        ),
        const SizedBox(height: 28),
        _buildHighlights(),
        const SizedBox(height: 28),
        _buildGooglePlayButton(),
      ],
    );
  }

  Widget _buildGooglePlayButton() {
    final borderRadius = BorderRadius.circular(12);
    final label = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DESCARGAR EN',
          style: GoogleFonts.inter(
            color: Colors.white.withValues(alpha: 0.72),
            fontSize: 8,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        Text(
          'Google Play',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 210,
        maxWidth: 225,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                CustomColor.accentPrimary,
                CustomColor.accentSecondary,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: borderRadius,
            border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
            boxShadow: [
              BoxShadow(
                color: CustomColor.accentPrimary.withValues(alpha: 0.18),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: InkWell(
            onTap: _openGooglePlay,
            borderRadius: borderRadius,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  label,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openGooglePlay() async {
    final launched = await launchUrl(
      _googlePlayUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se pudo abrir Google Play.'),
        ),
      );
    }
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xff2e7d32).withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: const Color(0xff4caf50).withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xff4caf50),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'EN PRODUCCIÓN',
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: const Color(0xff81c784),
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlights() {
    const highlights = [
      (Icons.account_balance_wallet_outlined, 'Balance en segundos'),
      (Icons.receipt_long_outlined, 'Registro de facturas'),
      (Icons.donut_large_rounded, 'Reportes por categoría'),
      (Icons.workspace_premium_outlined, 'Planes flexibles'),
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: highlights
          .map(
            (highlight) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              decoration: BoxDecoration(
                color: CustomColor.panelBorder.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: CustomColor.panelBorder),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    highlight.$1,
                    size: 17,
                    color: const Color(0xff81c784),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    highlight.$2,
                    style: GoogleFonts.inter(
                      fontSize: _isMobile ? 11 : 12,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _FinanziSlide {
  const _FinanziSlide({
    required this.asset,
    required this.semanticLabel,
  });

  final String asset;
  final String semanticLabel;
}
