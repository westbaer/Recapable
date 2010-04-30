#include "RCCreateViewController.h"
#include "RecapableAppDelegate.h"
#include "RCTextFieldCell.h"

@implementation RCCreateViewController

#pragma mark -
#pragma mark Main View

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
	UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];

	self.title = RCLocalize(@"Add Capability");
	self.navigationItem.rightBarButtonItem = doneButtonItem;
	self.navigationItem.leftBarButtonItem = cancelButtonItem;

	[doneButtonItem release];
	[cancelButtonItem release];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];

	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	RCTextFieldCell *cell = (RCTextFieldCell *)[self.tableView cellForRowAtIndexPath:indexPath];
	if(cell != nil) {
		[[cell textField] becomeFirstResponder];
	}
}

#pragma mark -
#pragma mark Actions

- (void)done:(id)sender {

	[self cancel:sender];
}

- (void)cancel:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark UITableView DataSource & Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RCCell"];
	if(cell == nil) {
		if(indexPath.row == 0) {
			cell = [[[RCTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RCCell"] autorelease];
			cell.textLabel.text = RCLocalize(@"Key");
			[[(RCTextFieldCell *)cell textField] setAutocorrectionType:UITextAutocorrectionTypeNo];
			[[(RCTextFieldCell *)cell textField] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
		
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
		} else if(indexPath.row == 1) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"RCCell"] autorelease];
			cell.textLabel.text = RCLocalize(@"Type");
			cell.detailTextLabel.text = RCLocalize(@"Boolean");
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		}
	}
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if(indexPath.section == 0) {
		if(indexPath.row == 1) {	
			RCSelectOptionController *viewController = [[RCSelectOptionController alloc] initWithArray:[NSArray arrayWithObjects:RCLocalize(@"Boolean"), RCLocalize(@"String"), RCLocalize(@"Number"), RCLocalize(@"Array"), RCLocalize(@"Dictionary"), nil]];
			viewController.delegate = self;
			viewController.title = RCLocalize(@"Type");
			viewController.selectedIndex = 0;
			[[self navigationController] pushViewController:viewController animated:YES];
			[viewController release];
		}
	}
}

#pragma mark -
#pragma mark RCSelectOptionController Delegate 

- (void)selectOptionController:(RCSelectOptionController *)controller didSelectIndex:(NSInteger)index fromArray:(NSArray *)array {
	[[self navigationController] popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
	[super dealloc];
}

@end
