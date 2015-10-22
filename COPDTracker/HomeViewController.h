//
//  HomeViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/21/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

//square views
@property (weak, nonatomic) IBOutlet UIView *lab_result;
@property (weak, nonatomic) IBOutlet UIView *medical_history;
@property (weak, nonatomic) IBOutlet UIView *side_effects;
@property (weak, nonatomic) IBOutlet UIView *patient_education;
@property (weak, nonatomic) IBOutlet UIView *condition_report;
@property (weak, nonatomic) IBOutlet UIView *exacerbation;
@property (weak, nonatomic) IBOutlet UIView *charts;

//gestures
@property (strong, nonatomic) UITapGestureRecognizer *tapLabResult;
@property (strong, nonatomic) UITapGestureRecognizer *tapMedicalHistory;
@property (strong, nonatomic) UITapGestureRecognizer *tapSideEffects;
@property (strong, nonatomic) UITapGestureRecognizer *tapPatientEducation;
@property (strong, nonatomic) UITapGestureRecognizer *tapConditionReport;
@property (strong, nonatomic) UITapGestureRecognizer *tapExacerbation;
@property (strong, nonatomic) UITapGestureRecognizer *tapCharts;

//imageViews
@property (weak, nonatomic) IBOutlet UIImageView *labResultsImageView;
@property (weak, nonatomic) IBOutlet UIImageView *medicalHistoryImageView;
@property (weak, nonatomic) IBOutlet UIImageView *sideEffectsImageView;
@property (weak, nonatomic) IBOutlet UIImageView *patientEducationImageView;
@property (weak, nonatomic) IBOutlet UIImageView *conditionReportIimageView;
@property (weak, nonatomic) IBOutlet UIImageView *exacerbationImageView;
@property (weak, nonatomic) IBOutlet UIImageView *chartsImageView;

@end
