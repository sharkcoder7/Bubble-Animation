//
//  ViewController.m
//  Test
//
//  Created by ioshero on 2/4/16.
//  Copyright © 2016 ioshero. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor colorWithRed:36/255.0 green:167/255.0 blue:192/255.0 alpha:1.0];
    
    self.arrayBubbleImages = [NSMutableArray array];
    
    for (int i = 0 ; i < 150 ; i ++)
    {
        UIImage *image = [UIImage imageNamed:@"circle.png"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.alpha = 0.5;
        [self.arrayBubbleImages addObject:imageView];
    }
    
	self.timer = [NSTimer scheduledTimerWithTimeInterval:(0.1) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}
 
- (void)onTimer
{
    if (self.bubbleCount >= self.arrayBubbleImages.count)
    {
        [self.timer invalidate];
        self.timer = nil;
        return;
    }
    
	UIImageView* bubbleView = [self.arrayBubbleImages objectAtIndex:self.bubbleCount];
    
    int nMode = (int)(round(random() % RAND_MAX)) % 6;
    switch (nMode) {
        case 0:
        {
            self.startX = -round(random() % 40);
            self.startY = -round(random() % (int)self.view.frame.size.height);
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
            break;
        case 1:
        {
            self.startX = round(random() % (int)self.view.frame.size.width);
            self.startY = -round(random() % 40);
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
            break;
        case 2:
        {
            self.startX = round(random() % 50) + self.view.frame.size.width;
            self.startY = round(random() % (int)self.view.frame.size.height);
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
        case 3:
        {
            self.startX = round(random() % (int)self.view.frame.size.width);
            self.startY = round(random() % 50) + self.view.frame.size.height;
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
            break;
        case 4:
        {
            self.startX = -round(random() % (int)self.view.frame.size.width / 2);
            self.startY = round(random() % (int)self.view.frame.size.height);
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
        case 5:
        {
            self.startX = round(random() % (int)self.view.frame.size.width);
            self.startY = -round(random() % (int)self.view.frame.size.height / 2);
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
            break;
        default:
            break;
    }
    
    double radius = 1 / round(random() % 2);
    if (radius == INFINITY)
        radius = 1.0;
    
	double scale = 1 / round(random() % 30) + radius;
    if (scale == INFINITY)
        scale = 1.0;
	double speed = 1 / round(random() % 30) + 1.0;
    if (speed == INFINITY)
        speed = 1.0;
    
    NSLog(@"scale = %f, speed = %f", scale, speed);
    
	bubbleView.frame = CGRectMake(self.startX, self.startY, 40 * scale, 40 * scale);
    
    [bubbleView.layer setCornerRadius:bubbleView.frame.size.width/2];
    [bubbleView.layer setMasksToBounds:YES];
    
    [self.view addSubview:bubbleView];
    [self.view sendSubviewToBack:bubbleView];
	
	[UIView beginAnimations:nil context:(__bridge void * _Nullable)(bubbleView)];
	[UIView setAnimationDuration:10 * speed];
	bubbleView.frame = CGRectMake(self.endX, self.endY, 40 * scale, 40 * scale);
	[UIView setAnimationDidStopSelector:@selector(onAnimationComplete:finished:context:)];
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];
    
    self.bubbleCount ++;
}

- (void)onAnimationComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	
	UIImageView *bubbleView = (__bridge UIImageView *)(context);

    int nMode = (int)(round(random() % RAND_MAX)) % 6;
    switch (nMode) {
        case 0:
        {
            self.startX = -round(random() % 40);
            self.startY = -round(random() % (int)self.view.frame.size.height);
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
            break;
        case 1:
        {
            self.startX = round(random() % (int)self.view.frame.size.width);
            self.startY = -round(random() % 40);
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
            break;
        case 2:
        {
            self.startX = round(random() % 50) + self.view.frame.size.width;
            self.startY = round(random() % (int)self.view.frame.size.height);
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
        case 3:
        {
            self.startX = round(random() % (int)self.view.frame.size.width);
            self.startY = round(random() % 50) + self.view.frame.size.height;
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
            break;
        case 4:
        {
            self.startX = -round(random() % (int)self.view.frame.size.width / 2);
            self.startY = round(random() % (int)self.view.frame.size.height);
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
        case 5:
        {
            self.startX = round(random() % (int)self.view.frame.size.width);
            self.startY = -round(random() % (int)self.view.frame.size.height / 2);
            
            self.endX = round(random() % (int)self.view.frame.size.width);
            self.endY = round(random() % (int)self.view.frame.size.height);
        }
            break;
        default:
            break;
    }
    
    double speed = 1 / round(random() % 30) + 1.0;
    if (speed == INFINITY)
        speed = 1.0;
    
    [UIView beginAnimations:nil context:(__bridge void * _Nullable)(bubbleView)];
    [UIView setAnimationDuration:5 * speed];
    bubbleView.frame = CGRectMake(self.endX, self.endY, bubbleView.frame.size.width, bubbleView.frame.size.height);
    [UIView setAnimationDidStopSelector:@selector(onAnimationComplete:finished:context:)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
