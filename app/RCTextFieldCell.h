#include <UIKit/UIKit.h>

@interface RCTextFieldCell : UITableViewCell <UITextFieldDelegate> {
	UITextField *_textField;
}

@property (nonatomic, retain) UITextField *textField;

@end