#include <Foundation/Foundation.h>

@class RCSelectOptionController;

@protocol RCSelectOptionControllerDelegate <NSObject>
- (void)selectOptionController:(RCSelectOptionController *)controller didSelectIndex:(NSInteger)index fromArray:(NSArray *)array;
@end

@interface RCSelectOptionController : UITableViewController {
	id <RCSelectOptionControllerDelegate> _delegate;
	NSArray *_contentArray;
	NSInteger _selectedIndex;
}

@property (nonatomic, assign) id <RCSelectOptionControllerDelegate> delegate;
@property (nonatomic, retain) NSArray *contentArray;
@property (nonatomic, assign) NSInteger selectedIndex;

- (id)initWithArray:(NSArray *)array;

@end

