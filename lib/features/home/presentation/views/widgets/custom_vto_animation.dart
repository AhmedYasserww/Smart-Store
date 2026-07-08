
import 'package:flutter/material.dart';

class VtoHeroAnimation extends StatefulWidget {
  const VtoHeroAnimation({super.key});

  @override
  State<VtoHeroAnimation> createState() => _VtoHeroAnimationState();
}

class _VtoHeroAnimationState extends State<VtoHeroAnimation>
    with TickerProviderStateMixin {
  int _phase = 0;

  // ✅ Timings بالـ milliseconds
  final List<int> _timings = [2000, 1200, 1500, 1500, 2000, 3500];

  late AnimationController _tshirtController;
  late AnimationController _modelController;
  late AnimationController _resultController;
  late AnimationController _titleController;
  late AnimationController _sparklesController;
  late AnimationController _scanController;

  late Animation<Offset> _tshirtSlide;
  late Animation<double> _tshirtOpacity;
  late Animation<Offset> _modelSlide;
  late Animation<double> _modelOpacity;
  late Animation<Offset> _resultSlide;
  late Animation<double> _resultOpacity;
  late Animation<double> _titleOpacity;
  late Animation<double> _titleSlide;
  late Animation<double> _sparklesOpacity;
  late Animation<double> _scanProgress;

  @override
  void initState() {
    super.initState();
    _initControllers();
    _startPhase();
  }

  void _initControllers() {
    _tshirtController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _modelController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _resultController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _titleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _sparklesController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _tshirtSlide = Tween<Offset>(
      begin: const Offset(-3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _tshirtController, curve: Curves.elasticOut));

    _tshirtOpacity = Tween<double>(begin: 0, end: 1).animate(_tshirtController);

    _modelSlide = Tween<Offset>(
      begin: const Offset(3, -2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _modelController, curve: Curves.elasticOut));

    _modelOpacity = Tween<double>(begin: 0, end: 1).animate(_modelController);

    _resultSlide = Tween<Offset>(
      begin: const Offset(0, 3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _resultController, curve: Curves.elasticOut));

    _resultOpacity = Tween<double>(begin: 0, end: 1).animate(_resultController);

    _titleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _titleController, curve: Curves.easeInOut),
    );

    _titleSlide = Tween<double>(begin: 20, end: 0).animate(
      CurvedAnimation(parent: _titleController, curve: Curves.easeInOut),
    );

    _sparklesOpacity = Tween<double>(begin: 0, end: 1).animate(_sparklesController);

    _scanProgress = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _scanController, curve: Curves.easeInOut),
    );
  }

  void _startPhase() async {
    // Phase 0: عرض العنوان
    _titleController.forward();
    await Future.delayed(Duration(milliseconds: _timings[0]));
    if (!mounted) return;

    // Phase 1: T-shirt يدخل
    setState(() => _phase = 1);
    _titleController.reverse();
    _tshirtController.forward();
    await Future.delayed(Duration(milliseconds: _timings[1]));
    if (!mounted) return;

    // Phase 2: Model يدخل
    setState(() => _phase = 2);
    _modelController.forward();
    await Future.delayed(Duration(milliseconds: _timings[2]));
    if (!mounted) return;

    // Phase 3: Sparkles
    setState(() => _phase = 3);
    await Future.delayed(Duration(milliseconds: _timings[3]));
    if (!mounted) return;

    // Phase 4: Scan animation
    setState(() => _phase = 4);
    _scanController.forward();
    await Future.delayed(Duration(milliseconds: _timings[4]));
    if (!mounted) return;

    // Phase 5: Result
    setState(() => _phase = 5);
    _tshirtController.animateTo(0.3, duration: const Duration(milliseconds: 600));
    _modelController.animateTo(0.5, duration: const Duration(milliseconds: 600));
    _resultController.forward();
    await Future.delayed(Duration(milliseconds: _timings[5]));
    if (!mounted) return;

    // Reset
    _resetAll();
  }

  void _resetAll() async {
    _tshirtController.reset();
    _modelController.reset();
    _resultController.reset();
    _scanController.reset();
    setState(() => _phase = 0);
    _startPhase();
  }

  @override
  void dispose() {
    _tshirtController.dispose();
    _modelController.dispose();
    _resultController.dispose();
    _titleController.dispose();
    _sparklesController.dispose();
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF3EEFB),
        borderRadius: BorderRadius.circular(32),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ✅ Phase 0: Title
            AnimatedOpacity(
              opacity: _phase == 0 ? 1 : 0,
              duration: const Duration(milliseconds: 600),
              child: AnimatedBuilder(
                animation: _titleController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _phase == 0 ? _titleSlide.value : -20),
                    child: child,
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Tryha VTO',
                      style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF5D3A82),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'The Future of Fashion',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ✅ T-shirt image
            if (_phase >= 1)
              Positioned(
                left: size.width * 0.05,
                child: SlideTransition(
                  position: _tshirtSlide,
                  child: AnimatedOpacity(
                    opacity: _phase == 5 ? 0.3 : 1,
                    duration: const Duration(milliseconds: 600),
                    child: Container(
                      width: 200,
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white, width: 8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/t_shirt.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // ✅ Model image
            if (_phase >= 2)
              Positioned(
                right: size.width * 0.05,
                top: 80,
                child: SlideTransition(
                  position: _modelSlide,
                  child: AnimatedOpacity(
                    opacity: _phase == 5 ? 0.3 : 1,
                    duration: const Duration(milliseconds: 600),
                    child: Container(
                      width: 140,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white, width: 6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 24,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          'assets/images/user2.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // ✅ Phase 3: Sparkles
            if (_phase == 3)
              ...List.generate(12, (i) {
                final angle = (i / 12) * 2 * 3.14159;
                final radius = 120.0;
                return Positioned(
                  left: size.width / 2 + radius * (i % 3 == 0 ? -1 : 1) * (0.5 + i * 0.05),
                  top: 200 + radius * (i % 2 == 0 ? -1 : 1) * (0.3 + i * 0.04),
                  child: FadeTransition(
                    opacity: _sparklesOpacity,
                    child: AnimatedBuilder(
                      animation: _sparklesController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: 0.5 + _sparklesController.value * 0.8,
                          child: child,
                        );
                      },
                      child: Icon(
                        Icons.auto_awesome,
                        color: const Color(0xFF5D3A82),
                        size: 20 + (i % 3) * 6.0,
                      ),
                    ),
                  ),
                );
              }),

            // ✅ Phase 4: Scan border animation
            if (_phase == 4)
              Positioned(
                left: size.width * 0.05,
                child: SizedBox(
                  width: 200,
                  height: 260,
                  child: AnimatedBuilder(
                    animation: _scanProgress,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: _ScanBorderPainter(
                          progress: _scanProgress.value,
                          color: const Color(0xFF5D3A82),
                        ),
                      );
                    },
                  ),
                ),
              ),

            // ✅ Phase 5: Result
            if (_phase == 5)
              SlideTransition(
                position: _resultSlide,
                child: FadeTransition(
                  opacity: _resultOpacity,
                  child: Container(
                    width: 200,
                    height: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white, width: 8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 24,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/result2.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ✅ Custom Painter للـ scan border
class _ScanBorderPainter extends CustomPainter {
  final double progress;
  final Color color;

  _ScanBorderPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(6, 6, size.width - 12, size.height - 12),
      const Radius.circular(24),
    );

    final path = Path()..addRRect(rect);
    final totalLength = _getPathLength(path);

    final dashPath = _extractPath(path, totalLength * progress);
    canvas.drawPath(dashPath, paint);
  }

  double _getPathLength(Path path) {
    final metrics = path.computeMetrics();
    return metrics.fold(0.0, (sum, m) => sum + m.length);
  }

  Path _extractPath(Path path, double length) {
    final result = Path();
    var remaining = length;
    for (final metric in path.computeMetrics()) {
      if (remaining <= 0) break;
      final extract = metric.extractPath(0, remaining.clamp(0, metric.length));
      result.addPath(extract, Offset.zero);
      remaining -= metric.length;
    }
    return result;
  }

  @override
  bool shouldRepaint(_ScanBorderPainter old) => old.progress != progress;
}


