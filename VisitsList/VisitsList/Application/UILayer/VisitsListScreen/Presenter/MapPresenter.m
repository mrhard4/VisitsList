//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import "MapPresenter.h"
#import "MapUI.h"
#import "Organization.h"


@implementation MapPresenter
{
    id<MapUI> _mapUI;
}

- (instancetype)initWithUI:(id<MapUI>)ui
{
    self = [super init];

    _mapUI = ui;

    return self;
}

- (void)setSelectedOrganization:(Organization *)selectedOrganization
{
    if( nil == selectedOrganization || ![self.organizations containsObject:selectedOrganization] )
    {
        [_mapUI setSelectedOrganizationId:nil];
        return;
    }
    [_mapUI setSelectedOrganizationId:selectedOrganization.organizationId];
}

- (void)setOrganizations:(NSArray<Organization *> *)organizations
{
    _organizations = organizations;

    [self refresh];
}

- (void)refresh
{
    [_mapUI beginConstruction];

    __typeof(self) __weak weakSelf = self;

    for (Organization *organization in self.organizations)
    {
        [_mapUI addPointWithLatitude:organization.latitude longitude:organization.longitude organizationId:organization.organizationId deselectionHandler:^
        {
            weakSelf.selectOrganizationHandler(nil);
        }
                    selectionHandler:^
        {
            weakSelf.selectOrganizationHandler(organization);
        }];
    }

    [_mapUI endConstruction];
}

@end