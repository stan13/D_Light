//
//  Answer5.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer5.h"

@interface Answer5 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//Private Variables


@end

@implementation Answer5

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showAnswer];
}

-(void)showAnswer{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"timeInSunPrison"];
    int result = (int)[defaults integerForKey:@"result"];
    switch (answer) {
        case 1:
            self.answerLabel.text = @"Five minutes in the sun makes a world of difference. Escape plans are coming along nicely. add one to the ‘success’ count";
            break;
        case 2:
            self.answerLabel.text = @" You spend some time outside, but it’s not much, and your escape plan isn’t coming along so well. Unfortunately, you didn’t make enough vitamin D today! ";
            result--;
            break;
        case 3:
            self.answerLabel.text = @"You can’t make vitamin D when the sun isn’t there! Also, it’s dark and a bit cold. You feel weird.";
            result -= 2;
            break;
            
        default:
            break;
    }
    self.resultsProgress.progress = result/20.0;
    [defaults setInteger:result forKey:@"result"];
}

@end
