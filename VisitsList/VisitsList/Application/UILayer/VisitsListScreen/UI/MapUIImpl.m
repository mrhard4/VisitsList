//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import "MapUIImpl.h"

@interface OrganizationPoint : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *organizationId;
@property (nonatomic, copy) void (^selectionHandler)(void);
@property (nonatomic, copy) void (^deselectionHandler)(void);

@end

@implementation OrganizationPoint

@end

@interface MapUIImpl ()<MKMapViewDelegate>

@end

@implementation MapUIImpl
{
    MKMapView *_mapView;

    NSMutableArray<OrganizationPoint *> *_annotations;

    BOOL _ignoreSelectionEvent;
}

@synthesize selectedOrganizationId = _selectedOrganizationId;

- (instancetype)initWithMapView:(MKMapView *)mapView
{
    self = [super init];

    _mapView = mapView;
    _mapView.delegate = self;
    _annotations = [NSMutableArray new];

    return self;
}

- (void)beginConstruction
{
    [_mapView removeAnnotations:_annotations];
    [_annotations removeAllObjects];
}

- (void)addPointWithLatitude:(double)latitude
                   longitude:(double)longitude
              organizationId:(NSString *)organizationId
          deselectionHandler:(void (^)(void))deselectionHandler
            selectionHandler:(void (^)(void))selectionHandler
{
    OrganizationPoint *annotation = [[OrganizationPoint alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    annotation.organizationId = organizationId;
    annotation.selectionHandler = selectionHandler;
    annotation.deselectionHandler = deselectionHandler;
    [_annotations addObject:annotation];
}

- (void)endConstruction
{
    [_mapView addAnnotations:_annotations];
    [_mapView showAnnotations:_annotations animated:YES];
}

- (void)setSelectedOrganizationId:(NSString *)selectedOrganizationId
{
    _ignoreSelectionEvent = YES;
    _selectedOrganizationId = [selectedOrganizationId copy];

    for (id<MKAnnotation> annotation in _mapView.selectedAnnotations)
    {
        [_mapView deselectAnnotation:annotation animated:YES];
    }

    if (nil == selectedOrganizationId)
    {
        return;
    }

    for (OrganizationPoint *point in _annotations)
    {
        if ([point.organizationId isEqualToString:_selectedOrganizationId])
        {
            [_mapView selectAnnotation:point animated:YES];

        }
    }
    [_mapView showAnnotations:_mapView.selectedAnnotations animated:YES];
    _ignoreSelectionEvent = NO;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if (_ignoreSelectionEvent)
    {
        return;
    }
    if (![view.annotation isMemberOfClass:[OrganizationPoint class]])
    {
        return;
    }

    OrganizationPoint *annotation = view.annotation;
    annotation.selectionHandler();
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    if (_ignoreSelectionEvent)
    {
        return;
    }
    if (![view.annotation isMemberOfClass:[OrganizationPoint class]])
    {
        return;
    }

    OrganizationPoint *annotation = view.annotation;
    annotation.deselectionHandler();
}

@end