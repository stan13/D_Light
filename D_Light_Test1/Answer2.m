//
//  Answer2.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//


#import "Answer2.h"
#define LOWER_BOUND 10   //lower bound for the correct number of minutes on a cloudy day
#define UPPER_BOUND 20  //upper bound for the correct number of minutes on a cloudy day

@interface Answer2 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//Private Variables


@end

@implementation Answer2

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    [self showAnswer];
}

- (void)showAnswer
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"timeInSunCloudy"];
    int result = (int)[defaults integerForKey:@"result"];
    if (answer < LOWER_BOUND) {
        self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Not enough - not enough vitamin d today! Remember it only takes a few more minutes. Dr. Dastardly escapes!", answer];
        result--;
    }else if (answer <= UPPER_BOUND){
        self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Just right - right on! You stayed out in the sun long enough to stay healthy, but not enough to get burnt. Well done! ", answer];
    } else {
        self.answerLabel.text = [NSString stringWithFormat:@"You selected %i minutes. Too much - ouch! You stayed out in the sun too long. You'll have a nasty sunburn for a few days. Dr. Dastardly escapes!", answer];
        result++;
    }
    self.resultsProgress.progress = result/20.0;
    [defaults setInteger:result forKey:@"result"];
}

@end