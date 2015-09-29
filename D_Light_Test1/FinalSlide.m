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
    
    
    int result = (int)[defaults integerForKey:@"result"];
    
    self.resultsProgress.progress = result/20.0;
    
    self.resultsLabel.text = [NSString stringWithFormat:@"Your final result is %i. You should aim to get as close to 10 as possible.", result];
}

@end
