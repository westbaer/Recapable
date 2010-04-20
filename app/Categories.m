#include "Categories.h"

@implementation UIDevice (RecapableCategory)

- (BOOL)isK48 {
	if([self respondsToSelector:@selector(isWildcat)]) {
		return [self isWildcat];
	}
	
	return NO;
}

@end

// vim:ft=objc