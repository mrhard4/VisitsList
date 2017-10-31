//
// Created by  mrhard on 30.10.2017.
// Copyright (c) 2017 dirsha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VisitListUI.h"

@import UIKit;


@interface VisitListUIImpl : NSObject<VisitListUI>

- (instancetype)initWithTableView:(UITableView *)tableView;

@end