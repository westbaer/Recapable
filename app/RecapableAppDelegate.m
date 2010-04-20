#include "RecapableAppDelegate.h"
#include "RCRootViewController.h"
#include "Categories.h"

@implementation RecapableAppDelegate
@synthesize window = _window;
@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	RCRootViewController *rootViewController = [[RCRootViewController alloc] initWithStyle:UITableViewStylePlain];
	BOOL isWildcat = [[UIDevice currentDevice] isK48];
	
	if(isWildcat) {
		// TODO: iPad UI
	} else {
		self.navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
		[self.window addSubview:[self.navigationController view]];
	}
	
	[self.window makeKeyAndVisible];
	[rootViewController release];

	return YES;
}

- (void)dealloc {
	[_navigationController release];
	[_window release];
	[super dealloc];
}

@end

// vim:ft=objc