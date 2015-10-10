//
//  Answer2.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//


#import "Answer2.h"
#define SUN_BLUE_VALUE 6 //out of 20
#define SUN_RED_VALUE 14 //out of 20

@interface Answer2 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property NSString *audioFile;


@end

@implementation Answer2

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
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
    int answer = (int)[defaults integerForKey:@"Decision2"];
    int result = (int)[defaults integerForKey:@"result"];
    switch (answer) {
        case 1:
            self.answerLabel.text = @"Correct! ☺ Clouds can reduce the UV index by up to a half! ";
            self.audioFile = @"Slide 9 - correct";
            break;
        case 2:
            self.answerLabel.text = @"Incorrect. ☹ Clouds can reduce the UV index by up to a half!";
            self.audioFile = @"Slide 9 - incorrect";
            result--;
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