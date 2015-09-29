//
//  Answer1.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer1.h"
#define LOWER_BOUND 5   //lower bound for the correct number of minutes
#define UPPER_BOUND 15  //upper bound for the correct number of minutes


@interface Answer1 ()
//Private Variables


@end

@implementation Answer1

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showAnswer];
}

- (void)showAnswer
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"timeInSun"];
    int result = 10;
    if (answer < LOWER_BOUND) {
        self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Not enough - not enough vitamin d today! Remember it only takes a few more minutes. Dr. Dastardly escapes!", answer];
        result--;
    }else if (answer <= UPPER_BOUND){
        self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Just right - right on! You stayed out in the sun long enough to stay healthy, but not enough to get burnt. Well done! ", answer];
    } else {
        self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Too much - ouch! You stayed out in the sun too long. You'll have a nasty sunburn for a few days. Dr. Dastardly escapes!", answer];
        result++;
    }
    [defaults setInteger:result forKey:@"result"];
}

@end
