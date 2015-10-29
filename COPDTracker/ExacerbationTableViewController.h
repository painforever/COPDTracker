//
//  ExacerbationTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/29/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewExacerbationTableViewController.h"
@interface ExacerbationTableViewController : UITableViewController
@property (strong, nonatomic) NewExacerbationTableViewController *neoExacerbationForm;

- (IBAction)addExacerbationButtonAction:(id)sender;

@end
