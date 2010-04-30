#include "Categories.h"

@implementation UIDevice (RecapableCategory)

- (BOOL)isK48 {
	if([self respondsToSelector:@selector(isWildcat)]) {
		return [self isWildcat];
	}
	
	return NO;
}

@end

@implementation UIColor (RecapableCategory)

+ (UIColor *)colorFromHexValue:(int)c {
	return [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0];	
}

+ (UIColor *)preferenceValueColor {
	return [UIColor colorFromHexValue:0x385487];
}

@end

// vim:ft=objc