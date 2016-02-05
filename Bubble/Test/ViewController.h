//
//  ViewController.h
//  Test
//
//  Created by ioshero on 2/4/16.
//  Copyright © 2016 ioshero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, assign) int startX;
@property (nonatomic, assign) int endX;
@property (nonatomic, assign) int startY;
@property (nonatomic, assign) int endY;
@property (nonatomic, assign) int bubbleCount;
@property (nonatomic, strong) NSMutableArray *arrayBubbleImages;
@property (nonatomic, strong) NSTimer *timer;

- (void)onAnimationComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;

@end

