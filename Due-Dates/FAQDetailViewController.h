//
//  FAQDetailViewController.h
//  Due Dates
//
//  Created by Zack Spicer on 7/30/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FAQDetailViewController : UIViewController


@property (strong, nonatomic) NSString *titleString;
@property (strong, nonatomic) IBOutlet UITextView *questionTitleLabel;
@property (strong, nonatomic) NSString *answerString;
@property (strong, nonatomic) IBOutlet UITextView *questionAnswerLabel;

@end
