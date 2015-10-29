//
//  HomeViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/21/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
{
    NSMutableArray *gestures;
    NSMutableArray *imageViews;
    NSMutableArray *selectors;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGestures];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setUpGestures{
    self.tapLabResult = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labIconTaped)];
    
    self.tapMedicalHistory = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(medicalHistoryIconTaped)];
    
    //self.tapSideEffects = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sideEffectsIconTaped)];
    
    self.tapPatientEducation = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(patientEducationIconTaped)];
    
    self.tapConditionReport = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(conditionReportIconTaped)];
    
    self.tapExacerbation = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exacerbationTaped)];
    
    self.tapCharts = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chartsTaped)];
    
    gestures = [[NSMutableArray alloc] initWithArray: @[self.tapLabResult, self.tapMedicalHistory, self.tapCharts, self.tapPatientEducation, self.tapConditionReport, self.tapExacerbation]];
    imageViews = [[NSMutableArray alloc] initWithArray:@[self.labResultsImageView, self.medicalHistoryImageView, self.chartsImageView, self.patientEducationImageView, self.conditionReportIimageView, self.exacerbationImageView]];
    for (int i=0; i < gestures.count; i++) {
        @autoreleasepool {
            UIImageView *imageView = (UIImageView *)imageViews[i];
            UITapGestureRecognizer *gesture = (UITapGestureRecognizer *)gestures[i];
            [imageView setUserInteractionEnabled:YES];
            [imageView addGestureRecognizer:gesture];
        }
    }
}

-(void)labIconTaped{
    self.labViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LabResultsTableViewController"];
    [self.navigationController pushViewController:self.labViewController animated:YES];
}

-(void)medicalHistoryIconTaped{
    self.medicalHistoryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MedHistorySelectionViewController"];
    [self.navigationController pushViewController:self.medicalHistoryViewController animated:YES];
}

//-(void)sideEffectsIconTaped{
//    self.sideEffectsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SideEffectsTableViewController"];
//    [self.navigationController pushViewController:self.sideEffectsViewController animated:YES];
//}

-(void)patientEducationIconTaped{
    
}

-(void)conditionReportIconTaped{
    self.conditionReportViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ConditionReportTableViewController"];
    [self.navigationController pushViewController:self.conditionReportViewController animated:YES];
}

-(void)exacerbationTaped{
    self.exacerbationViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ExacerbationTableViewController"];
    [self.navigationController pushViewController:self.exacerbationViewController animated:YES];
}

-(void)chartsTaped{
    self.chartsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ChartsTableViewController"];
    [self.navigationController pushViewController:self.chartsViewController animated:YES];
}
@end
