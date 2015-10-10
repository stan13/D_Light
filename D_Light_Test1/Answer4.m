//
//  Answer4.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer4.h"
#define LOWER_BOUND 10   //lower bound for the correct number of minutes at the beach
#define UPPER_BOUND 20  //upper bound for the correct number of minutes at the beach

@interface Answer4 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//Private Variables


@end

@implementation Answer4

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showAnswer];
}

- (void)showAnswer
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"timeInSunBeach"];
    bool sunscreen = [defaults boolForKey:@"sunscreen"];
    int result = (int)[defaults integerForKey:@"result"];
    if (answer < LOWER_BOUND) {
        if (sunscreen) {
            self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Not only do you not get enough sun exposure, you also boil from wearing all that stuff. ", answer];
        } else {
            self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Not only do you not get enough sun exposure, you also boil from wearing all that stuff. You also should have worn sunscreen", answer];
            result++;
        }
        result--;
    }else if (answer <= UPPER_BOUND){
        if (sunscreen) {
            self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Nice job! The best idea is to expose a lot of skin for a short time, but you got the balance right.", answer];
        } else {
            self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Nice job! The best idea is to expose a lot of skin for a short time, but you got the balance right. You also should have worn sunscreen", answer];
            result++;
        }
    } else {
        if (sunscreen) {
            self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Ouch! You got burnt. Remember the more of your skin you expose, the shorter time you have to spend in the sun to get your vitamin D for the day. ", answer];
        } else {
            self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Ouch! You got burnt. Remember the more of your skin you expose, the shorter time you have to spend in the sun to get your vitamin D for the day. You also should have worn sunscreen", answer];
            result++;
        }
        result++;
    }
    self.resultsProgress.progress = result/20.0;
    [defaults setInteger:result forKey:@"result"];
}

@end
