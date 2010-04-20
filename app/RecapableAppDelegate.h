#include <UIKit/UIKit.h>

#define RCLocalize(str) NSLocalizedString(str, str)

@interface RecapableAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *_window;
	UINavigationController *_navigationController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;

@end

