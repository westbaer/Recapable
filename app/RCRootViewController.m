#include "RCRootViewController.h"
#include "RecapableAppDelegate.h"

@implementation RCRootViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.title = @"Recapable";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"RCCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if(!cell) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	return cell;
}

- (void)dealloc {
	[super dealloc];
}

@end