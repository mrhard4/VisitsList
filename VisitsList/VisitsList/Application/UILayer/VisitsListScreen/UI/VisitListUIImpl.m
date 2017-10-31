//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import "VisitListUIImpl.h"

@interface VisitListUIItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *organizationId;
@property (nonatomic, copy) void (^selectionHandler)(void);
@property (nonatomic, copy) void (^deselectionHandler)(void);

@end

@implementation VisitListUIItem

@end

@interface VisitListUIImpl ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation VisitListUIImpl
{
    UITableView *_tableView;

    NSMutableArray<VisitListUIItem *> *_items;
}

@synthesize selectedOrganizationId = _selectedOrganizationId;

- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];

    _tableView = tableView;
    _tableView.allowsMultipleSelection = YES;
    _tableView.dataSource = self;
    _tableView.delegate = self;

    return self;
}

- (void)setSelectedOrganizationId:(NSString *)selectedOrganizationId
{
    _selectedOrganizationId = [selectedOrganizationId copy];

    [self clearSelectionExcept:nil];

    if (nil == selectedOrganizationId)
    {
        return;
    }

    [_items enumerateObjectsUsingBlock:^(VisitListUIItem *item, NSUInteger idx, BOOL *stop)
    {
        if ([item.organizationId isEqualToString:_selectedOrganizationId])
        {
            NSIndexPath *newSelectedIndexPath = [NSIndexPath indexPathForRow:idx inSection:0];
            [_tableView selectRowAtIndexPath:newSelectedIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        }
    }];
}

- (void)beginConstruction
{
    _items = [NSMutableArray new];
}

- (void)addItemWithTitle:(NSString *)title
                subtitle:(NSString *)subtitle
          organizationId:(NSString *)organizationId
      deselectionHandler:(void (^)(void))deselectionHandler
        selectionHandler:(void (^)(void))selectionHandler
{
    assert( nil != _items );

    VisitListUIItem *item = [[VisitListUIItem alloc] init];
    item.title = title;
    item.subtitle = subtitle;
    item.organizationId = organizationId;
    item.deselectionHandler = deselectionHandler;
    item.selectionHandler = selectionHandler;

    [_items addObject:item];
}

- (void)endConstruction
{
    [_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    assert(section == 0);

    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VisitListUIItem *item = _items[(NSUInteger)indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"item"];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"item"];
    }

    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.subtitle;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self clearSelectionExcept:indexPath];
    VisitListUIItem *item = _items[(NSUInteger)indexPath.row];
    item.selectionHandler();
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VisitListUIItem *item = _items[(NSUInteger)indexPath.row];
    item.deselectionHandler();
}

- (void)clearSelectionExcept:(NSIndexPath *)indexPath
{
    for (NSIndexPath *selectedIndexPath in _tableView.indexPathsForSelectedRows)
    {
        if (![selectedIndexPath isEqual:indexPath])
        {
            [_tableView deselectRowAtIndexPath:selectedIndexPath animated:YES];
        }
    }
}

@end