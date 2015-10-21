//
//  HomeViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/21/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setUpControls{
    self.lab_result = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
}

-(int)getXSpacing{
    return (self.view.frame.size.width-240)/3;
}

@end
