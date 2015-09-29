//
//  Explanation2.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Explanation2.h"

@interface Explanation2 ()
//Private Variables


@end

@implementation Explanation2


- (void)viewDidLoad{
    
    NSString *path = [NSString stringWithFormat:@"%@/applause.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *SoundURL = [NSURL fileURLWithPath:path];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)SoundURL, &PlaySoundID);
    //&PlaySoundID = [[AVAudioPlayer alloc] initWithContentsOfURL:SoundURL error:nil];
    
    [super viewDidLoad];
    
    
}



- (IBAction)listenToVoiceOver:(UIButton *)sender {
    
    AudioServicesPlaySystemSound(PlaySoundID);
    //[PlaySoundID play];
}


@end

