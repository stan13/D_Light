//
//  Explanation2.h
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface Explanation2 : ViewController
{
    SystemSoundID PlaySoundID;
}

//Public Variables
- (IBAction)listenToVoiceOver:(UIButton *)sender;

@end
