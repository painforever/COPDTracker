//
//  ExcerbationTypesTable.h
//  COPDTracker
//
//  Created by Yu Song on 11/5/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewExacerbationTableViewController.h"

@class NewExacerbationTableViewController;

@interface ExcerbationTypesTable : UITableViewController
@property (weak, nonatomic) NewExacerbationTableViewController *parent;
@end
