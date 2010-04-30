#include <UIKit/UIKit.h>
#include "RCSelectOptionController.h"

@interface RCCreateViewController : UITableViewController <RCSelectOptionControllerDelegate> {

}

- (void)done:(id)sender;
- (void)cancel:(id)sender;

@end
