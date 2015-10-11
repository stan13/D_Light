//
//  Answer1.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer1.h"
#define SKIN_TONE_CUT_OFF 0.5


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
    [self healthBar];
}

- (void)showAnswer
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger health = [defaults integerForKey:@"health"];
    CGFloat skinTone = [defaults floatForKey:@"skinTone"];
    int answer = (int)[defaults integerForKey:@"Decision1"];
    switch (answer) {
        case 1:
            if (skinTone < SKIN_TONE_CUT_OFF) {
                self.answerLabel.text = @"Correct! ☺ On a sunny day when the UV index is high, it takes a few minutes to make enough vitamin D if you have light coloured skin. Go capture Dr Dastardly!";
                self.audioFile = @"Slide 8 - light skin correct";
                health++;
            }else{
                self.answerLabel.text = @"Incorrect. ☹ Even on a sunny day when the UV index is high, it takes more than a few minutes to make enough vitamin D if you do not have light coloured skin. ";
                self.audioFile = @"Slide 8 - dark skin incorrect";
                health--;
            }
            break;
        case 2:
            if (skinTone < SKIN_TONE_CUT_OFF) {
                self.answerLabel.text = @"Incorrect. ☹ On a sunny day when the UV index is high, it takes a few minutes to make enough vitamin D if you have light coloured skin. ";
                self.audioFile = @"Slide 8 - light skin incorrect";
                health--;
            }else{
                self.answerLabel.text = @"Correct! ☺ On a sunny day when the UV index is high, it takes more than a few minutes to make enough vitamin D if you do not have light coloured skin. Go capture Dr Dastardly!";
                self.audioFile = @"Slide 8 - dark skin correct";
                health++;
            }
            break;
            
        default:
            break;
    }
    [defaults setInteger:health forKey:@"health"];

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

//Function that loads health bar
- (void) healthBar {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger health = [defaults integerForKey:@"health"];
    //check that health not over boundaries
    if (health < 0) {
        health = 0;
    }
    if (health > 10) {
        health = 10;
    }
    [defaults setInteger:health forKey:@"health"];
    //make rectangle inside - green with size = health*40
    UIImageView *healthAmount = [[UIImageView alloc] initWithFrame:CGRectMake(6, 6, health*39, 24)];
    if (health <= 3) {
        healthAmount.backgroundColor = [UIColor redColor];
    } else {
        healthAmount.backgroundColor = [UIColor greenColor];
    }
    [self.HealthBar addSubview:healthAmount];
}

@end
