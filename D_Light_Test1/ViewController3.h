//
//  ViewController3.h
//  D_Light_Test1
//
//  Created by Nathan Stanley on 14/08/2015.
//  Copyright (c) 2015 Nathan Stanley. All rights reserved.
//


#import "ViewController.h"
#import <Foundation/Foundation.h>

@interface ViewController3 : ViewController

//Image Views
@property (weak, nonatomic) IBOutlet UIImageView *torsoView;
@property (weak, nonatomic) IBOutlet UIImageView *legsView;
@property (weak, nonatomic) IBOutlet UIImageView *armsView;
@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UIImageView *eyesView;
@property (weak, nonatomic) IBOutlet UIImageView *hairBackView;
@property (weak, nonatomic) IBOutlet UIImageView *hairFrontView;
@property (weak, nonatomic) IBOutlet UIImageView *baseView;
@property (weak, nonatomic) IBOutlet UIImageView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *shoesView;
@property (weak, nonatomic) IBOutlet UIImageView *glassesView;
@property (weak, nonatomic) IBOutlet UIImageView *hatView;

//tops
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *top;
- (IBAction)Singlet:(UIButton *)sender;
- (IBAction)Shirt:(UIButton *)sender;
- (IBAction)Dress:(UIButton *)sender;

//bottoms
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *bottom;
 - (IBAction)Shorts0:(UIButton *)sender;
 - (IBAction)Pants:(UIButton *)sender;

//shoes
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *shoes;
 - (IBAction)Shoes0:(UIButton *)sender;
 - (IBAction)Shoes1:(UIButton *)sender;
 - (IBAction)Shoes2:(UIButton *)sender;

//glasses
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *glasses;
- (IBAction)Glasses0:(UIButton *)sender;
- (IBAction)Glasses1:(UIButton *)sender;

//hat
- (IBAction)Hat:(UIButton *)sender;

//Colour sliders
@property (weak, nonatomic) IBOutlet UISlider *topColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *bottomColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *shoeColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *glassesColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *hatColorSlider;


@end

