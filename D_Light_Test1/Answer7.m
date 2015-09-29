//
//  Answer7.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer7.h"

@interface Answer7 ()
//Private Variables


@end

@implementation Answer7

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showAnswer];
}

-(void)showAnswer{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"timeInSunSmoke"];
    int result = (int)[defaults integerForKey:@"result"];
    switch (answer) {
        case 1:
            self.answerLabel.text = @"That’s right! Cover from smoke or air pollution reduces the amount of UV that gets through. You spend enough time in the sun, and can help put the fire out.";
            break;
        case 2:
            self.answerLabel.text = @" Cover from smoke or air pollution reduces the amount of UV that gets through. You don’t get quite enough vitamin D today. Dr. Dastardly escapes!";
            result--;
            break;
        case 3:
            self.answerLabel.text = @"Oh no! The smoke reduces the amount of sunlight that gets through, so you end up getting way less vitamin D than usual. Dr. Dastardly escapes!";
            result-=2;
            break;
            
        default:
            break;
    }
    [defaults setInteger:result forKey:@"result"];
}

@end
