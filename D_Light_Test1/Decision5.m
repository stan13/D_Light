//
//  Decision5.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//


#import "Decision5.h"

@interface Decision5 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//Private Variables


@end

@implementation Decision5

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    self.nextButton.enabled = NO;
}

- (IBAction)chooseMidday:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.middayButton.backgroundColor = [UIColor grayColor];
    self.afternoonButton.backgroundColor = [UIColor clearColor];
    self.nightButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"prison"];
    
}

- (IBAction)chooseAfternoon:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.middayButton.backgroundColor = [UIColor clearColor];
    self.afternoonButton.backgroundColor = [UIColor grayColor];
    self.nightButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:2 forKey:@"prison"];
}

- (IBAction)chooseNight:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.middayButton.backgroundColor = [UIColor clearColor];
    self.afternoonButton.backgroundColor = [UIColor clearColor];
    self.nightButton.backgroundColor = [UIColor grayColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:3 forKey:@"prison"];
}

@end
