#import <SpringBoard/SBPlatformController.h>

%hook SBPlatformController
- (void)addCapabilities:(id)x removeCapabilities:(id)y {
	%log; %orig;
}
- (id)init {
	self = %orig;
	%log;
	NSLog(@"caps: %@", MSHookIvar<id>(self, "_currentCapabilities"));
	if(self) {
		NSDictionary *screenDimensions = [NSDictionary dictionaryWithObjectsAndKeys:
								    [NSNumber numberWithInt:1024], @"main-screen-height",
								    [NSNumber numberWithInt:768], @"main-screen-width",
								 [NSNumber numberWithDouble:0.5], @"main-screen-scale",
								 [NSNumber numberWithDouble:/*1.570796*/2.5], @"main-screen-orientation",
								    nil];
		[self addCapabilities:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:1], @"data-plan", screenDimensions, @"screen-dimensions", nil] removeCapabilities:[NSArray arrayWithObjects:@"wildcat", nil]];
	}
	NSLog(@"caps: %@", MSHookIvar<id>(self, "_currentCapabilities"));
	return self;
}
%end
