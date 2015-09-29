//
//  Answer6.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer6.h"

@interface Answer6 ()
//Private Variables


@end

@implementation Answer6

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showAnswer];
}

-(void)showAnswer{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"food"];
    int result = (int)[defaults integerForKey:@"result"];
    switch (answer) {
        case 1:
            self.answerLabel.text = @"that food has no vitamin D in it! ";
            result-=2;
            break;
        case 2:
            self.answerLabel.text = @" Vitamin D is mostly in fish and meat, but especially in oily fish, like salmon. You got some vitamin D today, but not really enough.";
            result--;
            break;
        case 3:
            self.answerLabel.text = @"Nice job! Oily fish is a great source of vitamin D, and mushrooms have some too";
            break;
            
        default:
            break;
    }
    self.resultsProgress.progress = result/20.0;
    [defaults setInteger:result forKey:@"result"];
}

@end
