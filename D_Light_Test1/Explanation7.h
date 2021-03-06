//
//  Explanation7.h
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

@interface Explanation7 : ViewController
{
    SystemSoundID PlaySoundID;
}

//Public Variables
- (IBAction)listenToVoiceOver:(UIButton *)sender;
- (IBAction)stopVoiceOver:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

//Character Customisation
//0 Hair Back
@property (weak, nonatomic) IBOutlet UIImageView *hairBack;
//1 Cape Back
@property (weak, nonatomic) IBOutlet UIImageView *capeBack;
//2 Torso
@property (weak, nonatomic) IBOutlet UIImageView *torso;
//3 Legs
@property (weak, nonatomic) IBOutlet UIImageView *skinLegs;
//4 Shoes
@property (weak, nonatomic) IBOutlet UIImageView *shoes;
//5 Arms
@property (weak, nonatomic) IBOutlet UIImageView *skinArms;
//6A Clothing Bottom
@property (weak, nonatomic) IBOutlet UIImageView *bottom;
//6B Clothing Top
@property (weak, nonatomic) IBOutlet UIImageView *top;
//7 Head type
@property (weak, nonatomic) IBOutlet UIImageView *skinHead;
//8 Mouth
@property (weak, nonatomic) IBOutlet UIImageView *mouth;
//9 Eye Whites - not changed
@property (weak, nonatomic) IBOutlet UIImageView *eyesWhites;
//10 Eye Pupils
@property (weak, nonatomic) IBOutlet UIImageView *eyes;
//11 Eye Lashes - not changed
@property (weak, nonatomic) IBOutlet UIImageView *eyeLashes;
//12 Eye Brows
@property (weak, nonatomic) IBOutlet UIImageView *eyeBrows;
//13 Hair Front
@property (weak, nonatomic) IBOutlet UIImageView *hairFront;
//14 Glasses
@property (weak, nonatomic) IBOutlet UIImageView *glasses;
//15 Hat
@property (weak, nonatomic) IBOutlet UIImageView *hat;

@end
