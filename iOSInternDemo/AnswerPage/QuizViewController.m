//
//  QuizViewController.m
//  iOSInternDemo
//
//  Created by yuhao on 2019/6/5.
//  Copyright © 2019 jingsong.jn. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property(nonatomic) int currentQuestion;

@property(nonatomic,copy) NSArray *questions;
@property(nonatomic,copy) NSArray *answers;

@property(nonatomic,weak) IBOutlet UILabel *questionLabel;
@property(nonatomic,weak) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.questions = @[@"hello?",@"world?",@"nice to meet u"];
        self.answers = @[@"hi",@"earth",@"nice to meet u 2"];
    }
    return self;
}

- (IBAction)showQuestion:(id)sender{
    self.currentQuestion++;
    if(self.currentQuestion==[self.questions count]){
        self.currentQuestion = 0;
    }
    NSString *question = self.questions[self.currentQuestion];
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender{
    NSString *answer = self.answers[self.currentQuestion];
    self.answerLabel.text = answer;
}

@end
