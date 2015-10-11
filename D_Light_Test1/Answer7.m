//
//  Answer7.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer7.h"

@interface Answer7 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//Private Variables


@end

@implementation Answer7

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showAnswer];
    [self healthBar];
}

-(void)showAnswer{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"timeInSunSmoke"];
    NSInteger health = [defaults integerForKey:@"health"];
    switch (answer) {
        case 1:
            self.answerLabel.text = @"That’s right! Cover from smoke or air pollution reduces the amount of UV that gets through. You spend enough time in the sun, and can help put the fire out.";
            self.drDastardly.image = [UIImage imageNamed:@"VillainFailStanding.png"];
            health++;
            break;
        case 2:
            self.answerLabel.text = @" Cover from smoke or air pollution reduces the amount of UV that gets through. You don’t get quite enough vitamin D today. Dr. Dastardly escapes!";
            self.drDastardly.image = [UIImage imageNamed:@"VillainSuccess.png"];
            health--;
            break;
        case 3:
            self.answerLabel.text = @"Oh no! The smoke reduces the amount of sunlight that gets through, so you end up getting way less vitamin D than usual. Dr. Dastardly escapes!";
            self.drDastardly.image = [UIImage imageNamed:@"VillainSuccess.png"];
            health-=2;
            break;
            
        default:
            break;
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
