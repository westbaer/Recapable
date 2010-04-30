#include "RCSelectOptionController.h"

@implementation RCSelectOptionController
@synthesize delegate = _delegate;
@synthesize contentArray = _contentArray;
@synthesize selectedIndex = _selectedIndex;

- (id)initWithArray:(NSArray *)array {
	if((self = [super initWithStyle:UITableViewStyleGrouped])) {
		[array retain];
		self.contentArray = array;
	}

	return self;
}

#pragma mark -
#pragma mark UITableView DataSource & Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.contentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"RCCell";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if(!cell) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}

	cell.textLabel.text = [self.contentArray objectAtIndex:indexPath.row];

	return cell;
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[super dealloc];
	[_contentArray release];
}

@end
