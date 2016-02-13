//
//  MAGViewController.m
//  CoreAnimationTest
//
//  Created by Ievgen Rudenko on 4/11/13.
//  Copyright (c) 2013 MadAppGang. All rights reserved.
//

#import "MAGViewController.h"

@interface MAGViewController ()

@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;

@end

@implementation MAGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)redTap:(UIButton *)sender {
    [self startSoftwareAnimation];
}
- (IBAction)greenTap:(UIButton *)sender {
    [self startCoreAnimation];
}

-(void)startSoftwareAnimation {
    [NSTimer scheduledTimerWithTimeInterval: 1/60.
                                     target: self
                                   selector: @selector(softwareDrawFrame)
                                   userInfo: nil
                                    repeats: YES];
}
-(void)softwareDrawFrame {
    static NSInteger increment = 1;
    CGRect frame = self.redLabel.frame;
    frame.origin.x += increment;
    if (frame.origin.x>300) increment=-1;
    if (frame.origin.x<0) increment=1;
    self.redLabel.frame = frame;
}
- (void)startCoreAnimation {
    CABasicAnimation* pulseAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    [pulseAnimation setFromValue:[NSValue valueWithCGPoint:self.greenLabel.frame.origin]];
    [pulseAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(self.greenLabel.frame.origin.x+300, self.greenLabel.frame.origin.y)]];
    pulseAnimation.duration = 2.0;
    pulseAnimation.repeatCount = CGFLOAT_MAX;
    pulseAnimation.autoreverses = YES;
    [[self.greenLabel layer] addAnimation:pulseAnimation forKey:@"position"];
}

@end
