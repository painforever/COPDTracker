//
//  LabTypesTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/22/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewLabResultsFormTableViewController.h"

@class NewLabResultsFormTableViewController;

@interface LabTypesTableViewController : UITableViewController
@property (strong, nonatomic) NSArray *labTypes;
@property (weak, nonatomic) NewLabResultsFormTableViewController *labsForm;
@end
