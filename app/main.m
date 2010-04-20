#include <UIKit/UIKit.h>

int main(int argc, char **argv, char **envp) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	int ret = UIApplicationMain(argc, argv, nil, @"RecapableAppDelegate");
	[pool release];
	return ret;
}

// vim:ft=objc
