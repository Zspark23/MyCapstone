//
//  ViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/24/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "MainScreenViewController.h"

@interface MainScreenViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"New Entry"]) {
        ((UIViewController *)segue.destinationViewController).title = @"New Entry-TM";
    } else {
        UITableViewCell *cellThatWasTapped = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cellThatWasTapped];
        NSString *titleOfNextVC;
        
        switch (indexPath.row)
        {
            case 0:
                titleOfNextVC = @"New Entry";
                break;
            case 1:
                titleOfNextVC = @"Statistics";
                break;
            case 2:
                titleOfNextVC = @"Homework";
                break;
            case 3:
                titleOfNextVC = @"Essays";
                break;
            case 4:
                titleOfNextVC = @"Projects";
                break;
            case 5:
                titleOfNextVC = @"Tests";
                break;
            case 6:
                titleOfNextVC = @"Chores";
                break;
            case 7:
                titleOfNextVC = @"Practice";
                break;
            case 8:
                titleOfNextVC = @"Other";
                break;
            default:
                break;
        }
        ((UIViewController *)segue.destinationViewController).title = titleOfNextVC;
    }

}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (indexPath.row == 0)
//    {
//        [self performSegueWithIdentifier:@"newEntry" sender:self];
//    }
//}

@end
