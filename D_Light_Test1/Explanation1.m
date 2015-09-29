//
//  Explanation1.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//
// code altered from http://www.techotopia.com/index.php/Playing_Audio_on_an_iPhone_using_AVAudioPlayer_(iOS_6)

#import "Explanation1.h"

@interface Explanation1 ()
<AVAudioPlayerDelegate>

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;


@end

@implementation Explanation1


- (void)viewDidLoad{

    [super viewDidLoad];
    
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"applause"
                                         ofType:@"mp3"]];
    
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
