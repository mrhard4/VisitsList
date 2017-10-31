//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapUI.h"

@import MapKit;


@interface MapUIImpl : NSObject<MapUI>

- (instancetype)initWithMapView:(MKMapView *)mapView;

@end