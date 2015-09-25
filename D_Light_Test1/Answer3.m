//
//  Answer3.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer3.h"


@interface Answer3 ()
//Private Variables


@end

@implementation Answer3

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showAnswer];
}

-(void)showAnswer{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"inOrOut"];
    switch (answer) {
        case 1:
            self.answerLabel.text = @"unfortunately, the car windows stop the sunlight from making vitamin d, so you didn't get any today.";
            break;
        case 2:
            self.answerLabel.text = @"well done! The tinting in car windows stops sunlight from making vitamin d, so you had to make it up after. ";
            break;
            
        default:
            break;
    }
}

@end
