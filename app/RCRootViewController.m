#include "RCRootViewController.h"
#include "RecapableAppDelegate.h"
#include "RCCreateViewController.h"

@implementation RCRootViewController

#pragma mark -
#pragma mark Main View

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCapability:)];

	self.title = RCLocalize(@"Capabilities");
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	self.navigationItem.rightBarButtonItem = addButtonItem;

	[addButtonItem release];
}

#pragma mark -
#pragma mark Actions

- (void)addCapability:(id)sender {
	RCCreateViewController *createViewController = [[RCCreateViewController alloc] initWithStyle:UITableViewStyleGrouped];
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:createViewController];
	
	[[self navigationController] presentModalViewController:navigationController animated:YES];
	
	[navigationController release];
	[createViewController release];
}

#pragma mark -
#pragma mark UITableView DataSource & Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"RCCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if(!cell) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	return cell;
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
	[super dealloc];
}

@end
