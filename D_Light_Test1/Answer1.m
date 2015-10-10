//
//  Answer1.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer1.h"
#define SKIN_TONE_CUT_OFF 0.5
#define SUN_BLUE_VALUE 6 //out of 20
#define SUN_RED_VALUE 14 //out of 20


@interface Answer1 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property NSString *audioFile;

@end

@implementation Answer1

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showAnswer];
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:self.audioFile
                                         ofType:@"wav"]];
    
    NSError *error;
    _audioPlayer = [[AVAudioPlayer alloc]
                    initWithContentsOfURL:url
                    error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];
    }

}

- (void)showAnswer
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"Decision1"];
    CGFloat skinTone = [defaults floatForKey:@"skinTone"];
    int result = (int)[defaults integerForKey:@"result"];
    switch (answer) {
        case 1:
            if (skinTone < SKIN_TONE_CUT_OFF) {
                self.answerLabel.text = @"Correct! ☺ On a sunny day when the UV index is high, it takes a few minutes to make enough vitamin D if you have light coloured skin. Go capture Dr Dastardly!";
                self.audioFile = @"Slide 8 - light skin correct";
            }else{
                self.answerLabel.text = @"Incorrect. ☹ Even on a sunny day when the UV index is high, it takes more than a few minutes to make enough vitamin D if you do not have light coloured skin. ";
                self.audioFile = @"Slide 8 - dark skin incorrect";
                result--;
            }
            break;
        case 2:
            if (skinTone < SKIN_TONE_CUT_OFF) {
                self.answerLabel.text = @"Incorrect. ☹ On a sunny day when the UV index is high, it takes a few minutes to make enough vitamin D if you have light coloured skin. ";
                self.audioFile = @"Slide 8 - light skin incorrect";
                result++;
            }else{
                self.answerLabel.text = @"Correct! ☺ On a sunny day when the UV index is high, it takes more than a few minutes to make enough vitamin D if you do not have light coloured skin. Go capture Dr Dastardly!";
                self.audioFile = @"Slide 8 - dark skin correct";
            }
            break;
            
        default:
            break;
    }
    //self.resultsProgress.progress = result/20.0;
    if (result <= SUN_BLUE_VALUE) {
        self.sunImage.image = [UIImage imageNamed:@"SunBlue.png"];
    }else if (result < SUN_RED_VALUE){
        self.sunImage.image = [UIImage imageNamed:@"SunNormal.png"];
    }else{
        self.sunImage.image = [UIImage imageNamed:@"SunRed.png"];
    }
    [defaults setInteger:result forKey:@"result"];

}

- (IBAction)listenToVoiceOver:(UIButton *)sender {
    
    self.nextButton.enabled = NO;
    [_audioPlayer play];
}

- (IBAction)stopVoiceOver:(UIButton *)sender {
    [_audioPlayer stop];
    self.nextButton.enabled = YES;
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    self.nextButton.enabled = YES;
}



@end
