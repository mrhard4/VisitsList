//
//  VisitsListView.m
//  VisitsList
//
//  Created by  mrhard on 29.10.2017.
//  Copyright © 2017 dirsha. All rights reserved.
//

#import "VisitsListView.h"
#import "VisitListUIImpl.h"
#import "MapUIImpl.h"

@import MapKit;

@implementation VisitsListView
{
    UITableView *_tableView;
    MKMapView *_mapView;
}

@synthesize listUI = _listUI;
@synthesize mapUI = _mapUI;
@synthesize repeatHandler = _repeatHandler;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    [self setupView];

    //TODO: add activity indicator while data loading

    _listUI = [[VisitListUIImpl alloc] initWithTableView:_tableView];
    _mapUI = [[MapUIImpl alloc] initWithMapView:_mapView];
    
    return self;
}

- (void)setupView
{
    _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    [self addSubview:_tableView];
    
    _mapView = [[MKMapView alloc] initWithFrame:self.bounds];
    [self addSubview:_mapView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = self.bounds;
    frame.size.width /= 3.0f;
    _tableView.frame = frame;
    
    frame = self.bounds;
    frame.origin.x = _tableView.frame.size.width;
    frame.size.width -= _tableView.frame.size.width;
    _mapView.frame = frame;
}

- (void)setRepeatState
{
    //TODO: Add repeat button to table view first cell after dab request result.
}

@end
