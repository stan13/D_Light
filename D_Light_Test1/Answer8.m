//
//  Answer8.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer8.h"


@interface Answer8 ()
//Private Variables


@end

@implementation Answer8

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showAnswer];
}

-(void)showAnswer{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"equator"];
    int result = (int)[defaults integerForKey:@"result"];
    switch (answer) {
        case 1:
            self.answerLabel.text = @"That’s right! Closer to the equator, UV rays from the sun have an easier time getting through the atmosphere. Add one to the success count.";
            break;
        case 2:
            self.answerLabel.text = @"Close to the equator, UV rays from the sun have an easier time getting through the atmosphere, so you create more vitamin D from the sun on your skin, not less. ";
            result++;
            break;
            
        default:
            break;
    }
    self.resultsProgress.progress = result/20.0;
    [defaults setInteger:result forKey:@"result"];
}

@end
