//
//  Explanation4.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 29/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Explanation4.h"

@interface Explanation4 ()
//Private Variables


@end

@implementation Explanation4


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


