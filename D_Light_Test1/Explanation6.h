//
//  Explanation6.h
//  D_Light_Test1
//
//  Created by Candice Christiansen on 9/10/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//


#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface Explanation6 : ViewController
{
    SystemSoundID PlaySoundID;
}

//Public Variables
- (IBAction)listenToVoiceOver:(UIButton *)sender;
- (IBAction)stopVoiceOver:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;


@end
