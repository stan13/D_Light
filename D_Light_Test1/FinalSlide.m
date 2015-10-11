//
//  FinalSlide.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "FinalSlide.h"

@interface FinalSlide ()
//Private Variables
@property NSString *results;

@end

@implementation FinalSlide

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showResults];
    [self healthBar];
}

- (void) showResults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    /*int timeInSun = (int)[defaults integerForKey:@"timeInSun"];
    int timeInSunCloudy = (int)[defaults integerForKey:@"timeInSunCloudy"];
    int inOrOut = (int)[defaults integerForKey:@"inOrOut"];
    int timeInSunBeach = (int)[defaults integerForKey:@"timeInSunBeach"];
    bool sunscreen = [defaults boolForKey:@"sunscreen"];
    int timeInSunPrison = (int)[defaults integerForKey:@"timeInSunPrison"];
    int food = (int)[defaults integerForKey:@"food"];
    int timeInSunSmoke = (int)[defaults integerForKey:@"timeInSunSmoke"];
    int equator = (int)[defaults integerForKey:@"equator"];*/
    //Just in case we need this information
    
    
    NSInteger health = [defaults integerForKey:@"health"];
    self.resultsLabel.text = [NSString stringWithFormat:@"Your final result is %i. You should aim to get as close to 10 as possible.", (int)health];
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
