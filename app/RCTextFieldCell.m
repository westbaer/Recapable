#include "RCTextFieldCell.h"
#include "Categories.h"

@implementation RCTextFieldCell
@synthesize textField = _textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
		self.textField = [[UITextField alloc] initWithFrame:CGRectZero];
		self.textField.delegate = self;
		self.textField.textAlignment = UITextAlignmentRight;
		self.textField.textColor = [UIColor preferenceValueColor];
		[self addSubview:self.textField];

		self.textField.font = [UIFont systemFontOfSize:17];
	}
	
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	CGRect rect = self.textField.frame;
	// TODO: resolution independence
	rect.origin.x = 180;
	rect.origin.y = 13;
	rect.size.width = 120;
	rect.size.height = 23;
	
	[self.textField setFrame:rect];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[self.textField resignFirstResponder];
	
	return YES;
}

- (void)dealloc {
	[_textField release];
	[super dealloc];
}

@end
