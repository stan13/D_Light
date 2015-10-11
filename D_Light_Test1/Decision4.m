//
//  Decision4.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Decision4.h"

@interface Decision4 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
//Private Variables

@property NSInteger sunscreen;
@property NSInteger hat;
@property NSInteger cover;



@end

@implementation Decision4

- (void)viewDidLoad
{
    [super viewDidLoad];
    //put code here or call another method
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"Slide 11 - initial"
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
    
    //Set up default decisions
    //Sunscreen
    self.sunscreen = 0;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.sunscreen forKey:@"sunscreen"];
    //load in hat
    NSInteger hat = [defaults floatForKey:@"hat"];
    //Cover
    self.cover = 0;
    [defaults setInteger:self.cover forKey:@"cover"];
    [self healthBar];

}
- (IBAction)listenToVoiceOver:(UIButton *)sender {
    
    self.nextButton.enabled = NO;
    [_audioPlayer play];
}
- (IBAction)stopVoiceOver:(UIButton *)sender {
    [_audioPlayer stop];
    //if(self.choiceMade) self.nextButton.enabled = YES;
}
- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    //if(self.choiceMade) self.nextButton.enabled = YES;
}

//Buttons to decide if wearing sunscreen, hat, cover
- (IBAction)ChooseHat:(UIButton *)sender {
    if (self.hat == 0) {
        self.hat = 1;
    } else {
        self.hat = 0;
    }
    [self setDefaults];
}
- (IBAction)ChooseSunscreen:(UIButton *)sender {
    if (self.sunscreen == 0) {
        self.sunscreen = 1;
    } else {
        self.sunscreen = 0;
    }
    [self setDefaults];
}
- (IBAction)ChooseCover:(UIButton *)sender {
    if (self.cover == 0) {
        self.cover = 1;
    } else {
        self.cover = 0;
    }
    [self setDefaults];
}

//Method to update view
- (void)updateVisual {
    //TODO
}

//Stores answers
- (void)setDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.sunscreen forKey:@"sunscreen"];
    [defaults setInteger:self.hat forKey:@"hat"];
    [defaults setInteger:self.cover forKey:@"cover"];
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
    [self.HeathBar addSubview:healthAmount];
}
@end