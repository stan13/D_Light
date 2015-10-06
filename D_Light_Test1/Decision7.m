//
//  Decision7.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Decision7.h"

@interface Decision7 ()
//Private Variables


@end

@implementation Decision7

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    self.nextButton.enabled = NO;
}

- (IBAction)chooseMore:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.moreButton.backgroundColor = [UIColor grayColor];
    self.sameButton.backgroundColor = [UIColor clearColor];
    self.lessButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"timeInSunSmoke"];
}
- (IBAction)chooseSame:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.moreButton.backgroundColor = [UIColor clearColor];
    self.sameButton.backgroundColor = [UIColor grayColor];
    self.lessButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:2 forKey:@"timeInSunSmoke"];
}
- (IBAction)chooseLess:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.moreButton.backgroundColor = [UIColor clearColor];
    self.sameButton.backgroundColor = [UIColor clearColor];
    self.lessButton.backgroundColor = [UIColor grayColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:3 forKey:@"timeInSunSmoke"];
}
@end

