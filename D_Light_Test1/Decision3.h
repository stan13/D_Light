//
//  Decision3.h
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Decision3 : ViewController

- (IBAction)listenToVoiceOver:(UIButton *)sender;
- (IBAction)stopVoiceOver:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UIImageView *hairBack;
@property (weak, nonatomic) IBOutlet UIImageView *skinLegs;
@property (weak, nonatomic) IBOutlet UIImageView *skinArms;
@property (weak, nonatomic) IBOutlet UIImageView *skinHead;
@property (weak, nonatomic) IBOutlet UIImageView *eyes;
@property (weak, nonatomic) IBOutlet UIImageView *hairFront;

@property (weak, nonatomic) IBOutlet UIButton *insideButton;
@property (weak, nonatomic) IBOutlet UIButton *outsideButton;
- (IBAction)chooseInside:(UIButton *)sender;
- (IBAction)chooseOutside:(UIButton *)sender;

@end

