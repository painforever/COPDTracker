//
//  RespirationTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/28/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "RespirationTableViewController.h"

@interface RespirationTableViewController ()

@end

@implementation RespirationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpControls];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 4;
}

-(void)setUpControls{
    
}

- (IBAction)submitAction:(id)sender {
    self.parent.respiration_hash = [[NSMutableDictionary alloc] init];
    self.parent.respiration_hash = @{@"smoke_roday": [self convertBOOL:self.smoke_today_switcher], @"smoke_how_much": self.smoke_today_howmuch.text, @"secondhand_smoker": [self convertBOOL:self.secondhand_smoke_switcher], @"secondhand_howlong": self.secondhand_smoke_howlong.text, @"stayin_bad_air": [self convertBOOL: self.stayin_bad_air_switcher], @"bad_air_list": self.bad_air_list.text};
    self.parent.respiration_label.text = @"Done";
    [self.navigationController popViewControllerAnimated:YES];
}
@end
