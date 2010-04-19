#include "RecapableAppDelegate.h"

@implementation RecapableAppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[self.window makeKeyAndVisible];

	return YES;
}

- (void)dealloc {
	[_window release];
	[super dealloc];
}

@end
