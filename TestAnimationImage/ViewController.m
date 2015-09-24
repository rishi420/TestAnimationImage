//
//  ViewController.m
//  TestAnimationImage
//
//  Created by Warif Akhand Rishi on 9/24/15.
//  Copyright (c) 2015 Warif Akhand Rishi. All rights reserved.
//

#import "ViewController.h"


@interface RandomImages : NSObject

@property (strong, nonatomic) NSArray *diceImages;

- (UIImage *) randomNumber;

@end


@implementation RandomImages
@synthesize diceImages;

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Array of dice for the randomNumber method
        self.diceImages = [[NSArray alloc] initWithObjects:
                           [UIImage imageNamed:@"loading1"],
                           [UIImage imageNamed:@"loading2"],
                           [UIImage imageNamed:@"loading3"],
                           [UIImage imageNamed:@"loading4"],
                           [UIImage imageNamed:@"loading5"],
                           [UIImage imageNamed:@"loading6"],
                           [UIImage imageNamed:@"loading7"],
                           [UIImage imageNamed:@"loading8"],
                           [UIImage imageNamed:@"loading9"],nil];
    }
    return self;
}


// Random dice number method
- (UIImage *)randomNumber {
    int random = arc4random_uniform((int)self.diceImages.count);
    return [self.diceImages objectAtIndex:random];
}

@end


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *dieImage0;
@property (weak, nonatomic) IBOutlet UIImageView *dieImage1;
@property (weak, nonatomic) IBOutlet UIImageView *dieImage2;
@property (weak, nonatomic) IBOutlet UIImageView *dieImage3;
@property (strong, nonatomic) RandomImages *randomImages;
@property (strong, nonatomic) NSArray *diceOutletArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.randomImages = [[RandomImages alloc] init];
    
    //self.rollTargetButton.hidden = YES;
    
    self.diceOutletArray = [[NSArray alloc] initWithObjects:self.dieImage0, self.dieImage1, self.dieImage2, self.dieImage3, nil];
    
    // Animation for rolling dice
    for (UIImageView *dieImages in self.diceOutletArray) {
        dieImages.animationImages = [[NSArray alloc] initWithObjects:
                                     [UIImage imageNamed:@"loading1"],
                                     [UIImage imageNamed:@"loading2"],
                                     [UIImage imageNamed:@"loading3"],
                                     [UIImage imageNamed:@"loading4"],
                                     [UIImage imageNamed:@"loading5"],
                                     [UIImage imageNamed:@"loading6"],
                                     [UIImage imageNamed:@"loading7"],
                                     [UIImage imageNamed:@"loading8"],
                                     [UIImage imageNamed:@"loading9"], nil];
        dieImages.animationDuration = 1.0f;
        dieImages.animationRepeatCount = 1;
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) rollDice{
    //self.diceOutletArray = [[NSArray alloc] initWithObjects:self.dieImage0, self.dieImage1, self.dieImage2, self.dieImage3, nil];
    
    // Randomly set the image of the dice
    for (UIImageView *numberImage in self.diceOutletArray) {
        
        numberImage.image = [self.randomImages randomNumber];
        [numberImage startAnimating];
        
    }
    
}

/* Motion functions *****************************************************************************************/

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
}
- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self rollDice];
        NSLog(@"There was a bump!: Line 85");
    }
    NSLog(@"Motion Ended: Line 87");
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
}

/* Roll Button **********************************************************************************************/

- (IBAction)rollDiceButton {
    [self rollDice];
    NSLog(@"Ouch! Somebody poked me!: Line 97");
}


/* Segues **************************************************************************************************/


@end
