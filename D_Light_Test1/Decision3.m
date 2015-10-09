//
//  Decision3.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//


#import "Decision3.h"

@interface Decision3 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//Private Variables


@end

@implementation Decision3

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    self.nextButton.enabled = NO;
}


- (IBAction)chooseInside:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.insideButton.backgroundColor = [UIColor grayColor];
    self.outsideButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"inOrOut"];
}

- (IBAction)chooseOutside:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.outsideButton.backgroundColor = [UIColor grayColor];
    self.insideButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:2 forKey:@"inOrOut"];
}

@end
