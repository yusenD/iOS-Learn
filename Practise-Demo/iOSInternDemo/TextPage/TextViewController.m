//
//  GameViewController.m
//  iOSInternDemo
//
//  Created by yuhao on 2019/6/6.
//  Copyright © 2019 jingsong.jn. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *header;
@property (weak, nonatomic) IBOutlet UIButton *outLineButton;
@property (weak, nonatomic) IBOutlet UIButton *unOutLineButton;

@end

@implementation TextViewController


- (IBAction)changeSelectionColorOfButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
}

- (IBAction)outLineSelectionButton:(UIButton *)sender {
    if(self.body.textColor) [self.body.textStorage addAttributes:@{NSStrokeColorAttributeName:self.body.textColor,NSStrokeWidthAttributeName:@-3} range:self.body.selectedRange];
    
}

- (IBAction)unOutLineSelectionButton:(UIButton *)sender {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"游戏";
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.outLineButton.currentTitle];
    [title setAttributes:@{NSStrokeWidthAttributeName : @3,
                           NSStrokeColorAttributeName:self.outLineButton.tintColor}
                   range:NSMakeRange(0, [title length])];
    [self.outLineButton setAttributedTitle:title forState:UIControlStateNormal];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontsChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

-(void)preferredFontsChanged:(NSNotification *)notification{
    [self usePreferredFonts];
}

-(void) usePreferredFonts{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.header.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
