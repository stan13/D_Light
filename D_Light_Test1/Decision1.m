//
//  Decision1.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Decision1.h"

@interface Decision1 ()
//Private Variables


@end

@implementation Decision1

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self makeMinutes:10];
}

- (IBAction)changeMinutes:(UISlider *)sender {
    int answer = (int)pow(100, sender.value);
    [self makeMinutes:answer];
}

- (void)makeMinutes:(int)minutes{
    self.minutesLabel.text = [NSString stringWithFormat:@"%i minutes", minutes];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:minutes forKey:@"timeInSun"];
}

@end
