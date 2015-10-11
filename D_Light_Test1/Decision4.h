//
//  Decision4.h
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Decision4 : ViewController
@property (weak, nonatomic) IBOutlet UIImageView *HeathBar;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
- (IBAction)listenToVoiceOver:(UIButton *)sender;
- (IBAction)stopVoiceOver:(UIButton *)sender;
- (IBAction)ChooseHat:(UIButton *)sender;
- (IBAction)ChooseSunscreen:(UIButton *)sender;
- (IBAction)ChooseCover:(UIButton *)sender;

@end
