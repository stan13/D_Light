//
//  Decision5.h
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Decision5 : ViewController

- (IBAction)listenToVoiceOver:(UIButton *)sender;
- (IBAction)stopVoiceOver:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UIImageView *hairBack;
@property (weak, nonatomic) IBOutlet UIImageView *skinLegs;
@property (weak, nonatomic) IBOutlet UIImageView *skinArms;
@property (weak, nonatomic) IBOutlet UIImageView *skinHead;
@property (weak, nonatomic) IBOutlet UIImageView *eyes;
@property (weak, nonatomic) IBOutlet UIImageView *hairFront;

@property (weak, nonatomic) IBOutlet UIButton *middayButton;
- (IBAction)chooseMidday:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *afternoonButton;
- (IBAction)chooseAfternoon:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *nightButton;
- (IBAction)chooseNight:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *background;


@end