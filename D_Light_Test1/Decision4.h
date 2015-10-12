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
