//
//  Decision2.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Decision2.h"

@interface Decision2 ()
//Private Variables


@end

@implementation Decision2

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
    [defaults setInteger:minutes forKey:@"timeInSunCloudy"];
}

@end
