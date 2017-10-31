//
//  VisitsListScreenPresenter.m
//  VisitsList
//
//  Created by  mrhard on 29.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import "VisitsListScreenPresenter.h"
#import "VisitsListInteractor.h"
#import "ErrorPresenter.h"
#import "VisitsListScreenUI.h"
#import "VisitListPresenter.h"
#import "MapPresenter.h"
#import "VisitItem.h"

@implementation VisitsListScreenPresenter
{
    id<VisitsListScreenUI> _screenUI;
    id<VisitsListInteractor> _interactor;
    id<ErrorPresenter> _errorPresenter;

    VisitListPresenter *_listPresenter;
    MapPresenter *_mapPresenter;
}

- (instancetype)initWithUI:(id<VisitsListScreenUI>)ui interactor:(id<VisitsListInteractor>)interactor errorPresenter:(id<ErrorPresenter>)errorPresenter
{
    self = [super init];

    _interactor = interactor;
    _screenUI = ui;
    _errorPresenter = errorPresenter;

    _listPresenter = [[VisitListPresenter alloc] initWithUI:_screenUI.listUI];
    _mapPresenter = [[MapPresenter alloc] initWithUI:_screenUI.mapUI];

    __typeof(self) __weak weakSelf = self;
    _mapPresenter.selectOrganizationHandler = ^(Organization *organization)
    {
        [weakSelf didSelectOrganizationFromMap:organization];
    };
    _listPresenter.selectOrganizationHandler = ^(Organization *organization)
    {
        [weakSelf didSelectOrganizationFromList:organization];
    };

    [self hookUI];
    [self prepare];

    return self;
}

- (void)didSelectOrganizationFromMap:(Organization *)organization
{
    _listPresenter.selectedOrganization = organization;
}

- (void)didSelectOrganizationFromList:(Organization *)organization
{
    _mapPresenter.selectedOrganization = organization;
}

- (void)hookUI
{
    __typeof(self) __weak weakSelf = self;

    _screenUI.repeatHandler = ^
    {
        [weakSelf prepare];
    };
}

- (void)prepare
{
    __typeof(self) __weak weakSelf = self;

    [_interactor requestVisitsListWithCompletion:^(NSArray<VisitItem *> *items, NSError *error)
    {
        [weakSelf didReceiveItems:items error:error];
    }];
}

- (void)didReceiveItems:(NSArray<VisitItem *> *)items error:(NSError *)error
{
    if (nil != error)
    {
        __typeof(self) __weak weakSelf = self;

        [_errorPresenter showErrorWithText:[error localizedDescription] okHandler:^
                {
                    [weakSelf setRepeatMode];
                }
                             repeatHandler:^
                             {
                                 [weakSelf prepare];
                             }];
        return;
    }

    [self buildItems:items];
}

- (void)buildItems:(NSArray<VisitItem *> *)items
{
    NSMutableSet *organizations = [[NSMutableSet alloc] init];
    for (VisitItem *item in items)
    {
        [organizations addObject:item.organization];
    }

    _listPresenter.items = items;
    _mapPresenter.organizations = organizations.allObjects;
}

- (void)setRepeatMode
{
    [_screenUI setRepeatState];
}

@end
