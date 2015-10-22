//
//  LabResultsTableViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/22/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewLabResultsFormTableViewController.h"

@interface LabResultsTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addNewLabButton;

- (IBAction)addNewLabButtonAction:(id)sender;
@end
