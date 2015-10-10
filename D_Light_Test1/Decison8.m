//
//  Decison8.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Decision8.h"

@interface Decision8 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//Private Variables


@end

@implementation Decision8

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    self.nextButton.enabled = NO;
}


- (IBAction)chooseMore:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.moreButton.backgroundColor = [UIColor grayColor];
    self.lessButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"equator"];
}
- (IBAction)chooseLess:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.moreButton.backgroundColor = [UIColor clearColor];
    self.lessButton.backgroundColor = [UIColor grayColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:2 forKey:@"equator"];
}
@end

