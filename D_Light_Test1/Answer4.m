//
//  Answer4.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer4.h"
#define SUN_BLUE_VALUE 6 //out of 20
#define SUN_RED_VALUE 14 //out of 20

@interface Answer4 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//Private Variables


@end

@implementation Answer4

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showAnswer];
    [self healthBar];
}

- (void)showAnswer
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger health = [defaults integerForKey:@"health"];

    NSInteger sunscreen = [defaults integerForKey:@"sunscreen"];
    NSInteger hat = [defaults integerForKey:@"hat"];
    NSInteger cover = [defaults integerForKey:@"cover"];
    //increment/decrement health based on choices
    if (sunscreen == 0) { //sunscreen good
        health--;
        self.SunscreenLabel.text = @"Incorrect! Sunscreen protects your skin from getting burnt but allows it to make vitamin D.";
    } else {
        health ++;
        self.SunscreenLabel.text = @"Correct! Sunscreen protects your skin from getting burnt but allows it to make vitamin D.";
    }
    if (hat == 0) { //hat good
        health--;
        self.HatLabel.text = @"Incorrect. It is important to protect your face by wearing a hat.";
    } else {
        health++;
        self.HatLabel.text = @"Correct. It is important to protect your face by wearing a hat.";
    }
    if (cover == 0) { //cover bad
        health++;
        self.CoverLabel.text = @"Correct. You need to expose some skin to make vitamin D.";
    } else {
        health--;
        self.CoverLabel.text = @"Incorrect. You need to expose some skin to make vitamin D.";
    }
    
    [defaults setInteger:health forKey:@"health"];
}
//Function that loads health bar
- (void) healthBar {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger health = [defaults integerForKey:@"health"];
    //check that health not over boundaries
    if (health < 0) {
        health = 0;
    }
    if (health > 10) {
        health = 10;
    }
    [defaults setInteger:health forKey:@"health"];
    //make rectangle inside - green with size = health*40
    UIImageView *healthAmount = [[UIImageView alloc] initWithFrame:CGRectMake(6, 6, health*39, 24)];
    if (health <= 3) {
        healthAmount.backgroundColor = [UIColor redColor];
    } else {
        healthAmount.backgroundColor = [UIColor greenColor];
    }
    [self.HeathBar addSubview:healthAmount];
}
@end
