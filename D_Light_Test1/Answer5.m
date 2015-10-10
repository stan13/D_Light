//
//  Answer5.m
//  D_Light_Test1
//
//  Created by Candice Christiansen on 25/09/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//

#import "Answer5.h"
#define SUN_BLUE_VALUE 6 //out of 20
#define SUN_RED_VALUE 14 //out of 20

@interface Answer5 ()
<AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property NSString *audioFile;


@end

@implementation Answer5

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

-(void)showAnswer{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int answer = (int)[defaults integerForKey:@"Decision5"];
    int result = (int)[defaults integerForKey:@"result"];
    switch (answer) {
        case 1:
            self.answerLabel.text = @"Correct! ☺ The UV index is greatest at this time of the day. You are powered up! You escape!!";
            self.audioFile = @"Slide 12 - midday";
            self.view.backgroundColor = [UIColor cyanColor];
            self.mouth.image = [UIImage imageNamed:@"9000 8 Mouth 1 Happy.png"];
            self.eyeWhites.image = [UIImage imageNamed:@"9000 9 Eye Whites 0 Default.png"];
            self.eyes.image = [UIImage imageNamed:@"9000 10 Eye Pupils 0 Default.png"];
            self.eyeBrows.image = [UIImage imageNamed:@"9000 12 Eye Brows 0 Default.png"];
            [self characterSettings];
            break;
        case 2:
            self.answerLabel.text = @"☹ Incorrect. The UV index is lower at this time of day. You didn’t make enough vitamin D today!";
            self.audioFile = @"Slide 12 - afternoon";
            self.view.backgroundColor = [UIColor blueColor];
            self.mouth.image = [UIImage imageNamed:@"9000 8 Mouth 4 Tired.png"];
            self.eyeWhites.image = [UIImage imageNamed:@"9000 9 Eye Whites 4 Tired.png"];
            self.eyes.image = [UIImage imageNamed:@"9000 10 Eye Pupils 4 Tired.png"];
            self.eyeBrows.image = [UIImage imageNamed:@"9000 12 Eye Brows 4 Tired.png"];
            [self characterSettings];
            result--;
            break;
        case 3:
            self.answerLabel.text = @"☹ Incorrect. You can’t make vitamin D when the sun isn’t there! ";
            self.audioFile = @"Slide 12 - night";
            self.view.backgroundColor = [UIColor blackColor];
            self.mouth.image = [UIImage imageNamed:@"9000 8 Mouth 0 Default.png"];
            self.eyeWhites.image = [UIImage imageNamed:@"9000 9 Eye Whites 0 Default.png"];
            self.eyes.image = [UIImage imageNamed:@"9000 10 Eye Pupils 0 Default.png"];
            self.eyeBrows.image = [UIImage imageNamed:@"9000 12 Eye Brows 6 Sad.png"];
            [self characterSettings];
            result -= 2;
            break;
            
        default:
            break;
    }

    if (result <= SUN_BLUE_VALUE) {
        self.sunImage.image = [UIImage imageNamed:@"SunBlue.png"];
    }else if (result < SUN_RED_VALUE){
        self.sunImage.image = [UIImage imageNamed:@"SunNormal.png"];
    }else{
        self.sunImage.image = [UIImage imageNamed:@"SunRed.png"];
    }
    [defaults setInteger:result forKey:@"result"];
}

- (void)characterSettings{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    UIColor *skinColour = [UIColor colorWithRed:[defaults floatForKey:@"skinRed"] green:[defaults floatForKey:@"skinGreen"] blue:[defaults floatForKey: @"skinBlue"] alpha:1.0];
    int head = (int)[defaults integerForKey:@"head"];
    
    
    self.skinArms.image = [self changeImage:self.skinArms.image toColour:skinColour];
    self.skinLegs.image = [self changeImage:self.skinLegs.image toColour:skinColour];
    if (head == 0) {
        self.skinHead.image = [self changeImage:[UIImage imageNamed:@"9000 7 Head 0 Default.png"] toColour:skinColour];
    }else if(head == 1){
        self.skinHead.image = [self changeImage:[UIImage imageNamed:@"9000 7 Head 1 Egg.png"] toColour:skinColour];
    }
    
    UIColor *hairColour = [UIColor colorWithHue:[defaults floatForKey:@"hairHue"] saturation:0.5 brightness:0.5 alpha:1];
    int hair = (int)[defaults integerForKey:@"hair"];
    
    switch (hair) {
        case 0:
            self.hairFront.image = [self changeImage:[UIImage imageNamed:@"9000 13 Hair Front 0 Short.png"] toColour:hairColour];
            break;
        case 1:
            self.hairBack.image = [self changeImage:[UIImage imageNamed:@"9000 0 Hair Back 1 Long.png"] toColour:hairColour];
            self.hairFront.image = [self changeImage:[UIImage imageNamed:@"9000 13 Hair Front 1 Long.png"] toColour:hairColour];
            break;
        case 2:
            //TODO
            break;
        case 3:
            //TODO
            break;
            
        default:
            break;
    }
    
    UIColor *eyeColour = [UIColor colorWithHue:[defaults floatForKey:@"eyeHue"] saturation:0.5 brightness:0.5 alpha:1];
    self.eyes.image = [self changeImage:self.eyes.image toColour:eyeColour];
    
}

- (UIImage *) changeImage: (UIImage *)img toColour: (UIColor *)colour
{
    //code modified from https://coffeeshopped.com/2010/09/iphone-how-to-dynamically-color-a-uiimage
    
    UIGraphicsBeginImageContext(img.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [colour setFill];
    CGContextTranslateCTM(context, 0, img.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeDarken);
    CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
    CGContextDrawImage(context, rect, img.CGImage);
    CGContextClipToMask(context, rect, img.CGImage);
    CGContextAddRect(context, rect);
    CGContextDrawPath(context,kCGPathFill);
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImg;
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
