//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Dan Clawson on 4/5/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (instancetype) initWithFrame: (CGRect) frame {

    self = [super initWithFrame:frame];
    if (self) {
        // all views start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }

    return self;
}

- (void) drawRect: (CGRect) rect {

    CGRect bounds = self.bounds;

    // figure out the center of the bound rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    // the largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;

    UIBezierPath *path = [[UIBezierPath alloc] init];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }

    // set line width
    path.lineWidth = 10;

    // set the line color
    [[UIColor lightGrayColor] setStroke];

    // draw it
    [path stroke];
}

@end
