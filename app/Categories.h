#include <UIKit/UIKit.h>

@interface UIDevice (PadCategory)
- (BOOL)isWildcat;
@end

@interface UIDevice (RecapableCategory)
- (BOOL)isK48;
@end

@interface UIColor (RecapableCategory)
+ (UIColor *)colorFromHexValue:(int)c;
+ (UIColor *)preferenceValueColor;
@end