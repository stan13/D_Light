//
//  Decision4.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Decision4.h"

@interface Decision4 ()
//Private Variables


@end

@implementation Decision4

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self.sunscreenSwitch setOn:NO];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"sunscreen"];
}

- (IBAction)option1:(UIButton *)sender{
    
}

- (IBAction)option2:(UIButton *)sender {
}

- (IBAction)option3:(UIButton *)sender {
}

- (IBAction)option4:(UIButton *)sender {
}

- (IBAction)changeColour:(UISlider *)sender {
}

- (IBAction)chooseSunscreen:(UISwitch *)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:[sender isOn] forKey:@"sunscreen"];
}

- (IBAction)changeMinutes:(UISlider *)sender {
    int answer = (int)pow(100, sender.value);
    [self makeMinutes:answer];
}

- (void)makeMinutes:(int)minutes{
    self.minutesLabel.text = [NSString stringWithFormat:@"%i minutes", minutes];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:minutes forKey:@"timeInSunBeach"];
}

@end