//
//  ViewController.m
//  FastestRPM
//
//  Created by Adam DesLauriers on 2016-01-21.
//  Copyright © 2016 Adam DesLauriers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *needleImage;
@property (weak, nonatomic) IBOutlet UIImageView *speedometerImage;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) CGPoint firstPoint;

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *moveTheNeedle;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *needleImage = [[UIImageView alloc] init];
  //  needleImage.center = CGPointMake(203.0, 343.0);
    self.needleImage.transform = CGAffineTransformMakeRotation(2.65);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)moveTheNeedle:(UIPanGestureRecognizer*)sender {
   
    
    
    UIGestureRecognizerState state = sender.state;
    
    CGPoint velocity = [sender velocityInView:self.view];
   // NSLog(@"hi %@", NSStringFromCGPoint(velocity));
  //  NSLog(@"yo %f %f", velocity.x, velocity.y);
    
    float vel =  sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
    NSLog(@"current vel %f", vel);
    
    
    if ([sender state] == UIGestureRecognizerStateChanged) {
        if (vel >= 3000.0) {
            self.needleImage.transform = CGAffineTransformMakeRotation(2.2 * M_PI);
        } else if (vel >= 2000.0){
            self.needleImage.transform = CGAffineTransformMakeRotation(1.8 * M_PI);
        }else if (vel >= 1000.0){
            self.needleImage.transform = CGAffineTransformMakeRotation(1.4 * M_PI);
        } else if (vel >= 1.0){
            self.needleImage.transform = CGAffineTransformMakeRotation(1.0 * M_PI);
        }
    }

   else ([sender state] == UIGestureRecognizerStateEnded) {
        self.needleImage.transform = CGAffineTransformMakeRotation(2.65);
        
   }







@end
