#include <Foundation/Foundation.h>

@class RCSelectOptionController;

@protocol RCSelectOptionController <NSObject>
- (void)selectOptionController:(RCSelectOptionController *) didSelectIndex:(NSInteger)index fromArray:(NSArray *)array;
@end

@interface RCSelectOptionController : UITableViewController {
	id <RCSelectOptionController> _delegate;
	NSArray *_contentArray;
	NSInteger _selectedIndex;
}

@property (nonatomic, assign) id <RCSelectOptionController> delegate;
@property (nonatomic, retain) NSArray *contentArray;
@property (nonatomic, assign) NSInteger selectedIndex;

- (id)initWithArray:(NSArray *)array;

@end

