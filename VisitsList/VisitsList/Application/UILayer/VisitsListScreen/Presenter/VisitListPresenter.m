//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import "VisitListPresenter.h"
#import "VisitListUI.h"
#import "VisitItem.h"
#import "Visit.h"
#import "Organization.h"


@implementation VisitListPresenter
{
    id<VisitListUI> _listUI;
}

- (instancetype)initWithUI:(id<VisitListUI>)ui
{
    self = [super init];

    _listUI = ui;

    return self;
}

- (void)setSelectedOrganization:(Organization *)selectedOrganization
{
    _selectedOrganization = selectedOrganization;

    _listUI.selectedOrganizationId = _selectedOrganization.organizationId;
}

- (void)setItems:(NSArray<VisitItem *> *)items
{
    _items = [items copy];

    [self refresh];
}

- (void)refresh
{
    [_listUI beginConstruction];

    __typeof(self) __weak weakSelf = self;

    for (VisitItem *item in self.items)
    {
        [_listUI addItemWithTitle:item.visit.title
                         subtitle:item.organization.title
                   organizationId:item.organization.organizationId
               deselectionHandler:^
               {
                   weakSelf.selectOrganizationHandler(nil);
               }
                 selectionHandler:^
                 {
                     weakSelf.selectOrganizationHandler(item.organization);
                 }];
    }

    [_listUI endConstruction];
}

@end