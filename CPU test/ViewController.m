//
//  ViewController.m
//  CPU test
//
//  Created by Gary on 2015/9/28.
//  Copyright © 2015年 Gary. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSInteger upperOffset = 70;
    
    mainScrollView = [[UIScrollView alloc] init];
    [self.view addSubview:mainScrollView];
    [mainScrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mainScrollView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mainScrollView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mainScrollView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mainScrollView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view  attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    

    UILabel* boardIDLabel = [[UILabel alloc] init];
    UILabel* manufactory = [[UILabel alloc] init];
    
    //for samsung users
    boardIDLabel.text = @"s8003";
    manufactory.text = @"TSMC";
    imageName = @"A9";
    
    [boardIDLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [manufactory setTranslatesAutoresizingMaskIntoConstraints:NO];
    [boardIDLabel setFont:[UIFont systemFontOfSize:36]];
    [mainScrollView addSubview:boardIDLabel];
    [mainScrollView addSubview:manufactory];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:boardIDLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:mainScrollView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:boardIDLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:mainScrollView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-upperOffset]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:manufactory attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:mainScrollView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:manufactory attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:mainScrollView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:50-upperOffset]];
    
    //Add chip icon
    UIImageView *imgView = [[UIImageView alloc] init];
    if(imageName) {
        imgView.image = [UIImage imageNamed:imageName];
        imgView.backgroundColor = [UIColor clearColor];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [mainScrollView addSubview: imgView];
        [imgView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [mainScrollView  addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:mainScrollView  attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
        [mainScrollView  addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:mainScrollView  attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
        [mainScrollView  addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:imgView  attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
        [mainScrollView  addConstraint:[NSLayoutConstraint constraintWithItem:imgView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:boardIDLabel  attribute:NSLayoutAttributeTop multiplier:1.0 constant:-24]];
    }
    
    //Append chart
    UIWebView *webView = [[UIWebView alloc] init];
    NSURL* url = [NSURL URLWithString:@"http://demo.hiraku.tw/CPUIdentifier/chart.php"];
    webView.backgroundColor = [UIColor grayColor];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    [mainScrollView addSubview:webView];
    webView.userInteractionEnabled = NO;
    [webView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:mainScrollView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:mainScrollView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:manufactory attribute:NSLayoutAttributeBottom multiplier:1.0 constant:100-upperOffset]];
    [mainScrollView addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:1300]];
    
    mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, SCREEN_HEIGHT + 952 -upperOffset*2);
}

@end

