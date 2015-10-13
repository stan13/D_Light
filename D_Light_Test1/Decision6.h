//
//  Decision6.h
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Decision6 : ViewController
@property (weak, nonatomic) IBOutlet UIImageView *HeathBar;
@property (weak, nonatomic) IBOutlet UIImageView *foodWithNone;
@property (weak, nonatomic) IBOutlet UIImageView *foodWithSome;
@property (weak, nonatomic) IBOutlet UIImageView *foodWithEnough;

- (IBAction)listenToVoiceOver:(UIButton *)sender;
- (IBAction)stopVoiceOver:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UIImageView *plate;

@end
