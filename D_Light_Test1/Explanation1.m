//
//  Explanation1.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 18/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Explanation1.h"

@interface Explanation1 ()
//Private Variables


@end

@implementation Explanation1


- (void)viewDidLoad{
    
    NSString *path = [NSString stringWithFormat:@"%@/audio1.m4a", [[NSBundle mainBundle] resourcePath]];
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

