//
//  TextStatsViewController.m
//  iOSInternDemo
//
//  Created by yuhao on 2019/6/9.
//  Copyright © 2019 jingsong.jn. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()

@end

@implementation TextStatsViewController

- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;
    if(self.view.window) [self updateUI];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)updateUI{
    
}

@end
