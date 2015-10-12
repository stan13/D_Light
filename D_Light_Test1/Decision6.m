//
//  Decision6.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Decision6.h"

@interface Decision6 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//Private Variables

@end

@implementation Decision6

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self healthBar];

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

        UITouch *touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:self.view];
    
    if([touch view] == self.foodWithNone){
        self.foodWithNone.center = location;
    } else if([touch view] == self.foodWithSome){
        self.foodWithSome.center = location;
    } else if([touch view] == self.foodWithEnough){
        self.foodWithEnough.center = location;
    }
    
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesBegan:touches withEvent:event];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    UIImageView *food = [[UIImageView alloc] initWithFrame:CGRectMake(70, 50, 300, 180)];
    
    if (CGRectIntersectsRect(self.foodWithNone.frame, self.plate.frame)) {
        food.image = [UIImage imageNamed:@"Hamburger.png"];
        [defaults setInteger:1 forKey:@"food"];
    }
    if (CGRectIntersectsRect(self.foodWithSome.frame, self.plate.frame)) {
        food.image = [UIImage imageNamed:@"Pizza"];
        [defaults setInteger:2 forKey:@"food"];
    }
    if (CGRectIntersectsRect(self.foodWithEnough.frame, self.plate.frame)) {
        food.image = [UIImage imageNamed:@"Fish"];
        [defaults setInteger:3 forKey:@"food"];
    }
    
    for (UIView *view in [self.plate subviews]) [view removeFromSuperview];
    
    [self.plate addSubview:food];
    
    self.foodWithNone.center = CGPointMake(108, 209);
    self.foodWithSome.center = CGPointMake(300, 209);
    self.foodWithEnough.center = CGPointMake(492, 209);
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
