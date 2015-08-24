//
//  FAQViewController.m
//  Due Dates
//
//  Created by Zack Spicer on 7/30/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "FAQViewController.h"

@interface FAQViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FAQViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"FAQ's";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

 //In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cellThatWasTapped = sender;
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cellThatWasTapped];
    
    NSString *titleOfNextVC = [FAQs questionTypeAtIndex:indexPath.section inQuestionAtIndex:indexPath.row];
    NSString *questionAnswer = [FAQs questionTypeAtIndex:indexPath.section withAnswerAtIndex:indexPath.row];
    
    FAQDetailViewController *detailViewController = [segue destinationViewController];
    detailViewController.title = @"FAQ's";
    detailViewController.titleString = titleOfNextVC;
    detailViewController.answerString = questionAnswer;
}


@end
