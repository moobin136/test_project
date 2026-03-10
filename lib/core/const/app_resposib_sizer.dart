import 'package:flutter/material.dart';
import 'package:test_project/core/const/app_advance_size.dart';

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Responsive UI', style: TextStyle(fontSize: 20.sp)),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              // breakpoint examples (screen width)
              final isTablet = constraints.maxWidth > 600.w;     // tablet/desktop-like
              final isLarge = constraints.maxWidth > 900.w;

              // orientation + size combine করে layout decide
              if (orientation == Orientation.landscape || isTablet) {
                // Landscape বা tablet → side-by-side / more columns
                return _buildLandscapeOrTabletLayout(isLarge);
              } else {
                // Portrait mobile → stacked / single column
                return _buildPortraitMobileLayout();
              }
            },
          );
        },
      ),
    );
  }

  // Portrait / Mobile layout (stacked)
  Widget _buildPortraitMobileLayout() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200.h,
            color: Colors.blue[100],
            child: Center(child: Text('Header Banner', style: TextStyle(fontSize: 24.sp))),
          ),
          SizedBox(height: 16.h),
          Text(
            'Portrait Mode Content',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // portrait-এ ২ কলাম
              childAspectRatio: 1.2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
            ),
            itemCount: 6,
            itemBuilder: (context, index) => Card(
              child: Center(child: Text('Item $index', style: TextStyle(fontSize: 16.sp))),
            ),
          ),
        ],
      ),
    );
  }

  // Landscape / Tablet layout (side-by-side)
  Widget _buildLandscapeOrTabletLayout(bool isLarge) {
    return Row(
      children: [
        // Sidebar (tablet/landscape-এ দেখাবে)
        if (isLarge)
          Container(
            width: 250.w,
            color: Colors.grey[200],
            child: ListView(
              children: List.generate(
                10,
                (index) => ListTile(
                  title: Text('Menu $index', style: TextStyle(fontSize: 16.sp)),
                ),
              ),
            ),
          ),

        // Main content
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Landscape / Tablet Mode',
                  style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isLarge ? 4 : 3, // large screen-এ আরও কলাম
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) => Card(
                    elevation: 4,
                    child: Center(child: Text('Card $index', style: TextStyle(fontSize: 18.sp))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}