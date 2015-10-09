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

- (IBAction)option1:(UIButton *)sender;
- (IBAction)option2:(UIButton *)sender;
- (IBAction)option3:(UIButton *)sender;
- (IBAction)option4:(UIButton *)sender;
- (IBAction)changeColour:(UISlider *)sender;
- (IBAction)chooseSunscreen:(UISwitch *)sender;
- (IBAction)changeMinutes:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;
@property (weak, nonatomic) IBOutlet UISwitch *sunscreenSwitch;

@end
