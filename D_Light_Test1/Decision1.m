//
//  Decision1.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Decision1.h"

@interface Decision1 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property BOOL choiceMade;

@end

@implementation Decision1

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"Slide 8 - initial"
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
    
    self.nextButton.enabled = NO;
    self.choiceMade = NO;
}



- (IBAction)listenToVoiceOver:(UIButton *)sender {
    
    self.nextButton.enabled = NO;
    [_audioPlayer play];
}

- (IBAction)stopVoiceOver:(UIButton *)sender {
    [_audioPlayer stop];
    if(self.choiceMade) self.nextButton.enabled = YES;
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if(self.choiceMade) self.nextButton.enabled = YES;
}




- (IBAction)chooseYes:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.yesButton.backgroundColor = [UIColor grayColor];
    self.noButton.backgroundColor = [UIColor clearColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"5MinsEnough"];
    self.choiceMade = YES;
}

- (IBAction)chooseNo:(UIButton *)sender {
    self.nextButton.enabled = YES;
    self.yesButton.backgroundColor = [UIColor clearColor];
    self.noButton.backgroundColor = [UIColor grayColor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:2 forKey:@"5MinsEnough"];
    self.choiceMade = NO;
}
@end
