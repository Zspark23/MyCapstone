//
//  EssaysEntryViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/25/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "EssaysEntryViewController.h"

@interface EssaysEntryViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *countTextField;
@property (strong, nonatomic) IBOutlet UIButton *deleteButton;
@property (strong, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation EssaysEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.deleteButton.enabled = NO;
    self.deleteButton.backgroundColor = [UIColor grayColor];
    [self.deleteButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    self.addButton.enabled = NO;
    self.addButton.backgroundColor = [UIColor grayColor];
    [self.addButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3)
    {
        self.deleteButton.enabled = YES;
        self.deleteButton.backgroundColor = [UIColor darkGrayColor];
        [self.deleteButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        self.addButton.enabled = YES;
        self.addButton.backgroundColor = [UIColor darkGrayColor];
        [self.addButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    }else
    {
        self.deleteButton.enabled = NO;
        self.deleteButton.backgroundColor = [UIColor grayColor];
        self.addButton.enabled = NO;
        self.addButton.backgroundColor = [UIColor grayColor];
    }
}
- (IBAction)submitButtonTapped:(UIButton *)sender
{
    if (self.tableView.indexPathForSelectedRow == nil)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Please Select a Divide Type"
                                                                       message:@"Please select a work divide type from the list above"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else if ([self.countTextField.text isEqualToString:@""])
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter a Count"
                                                                       message:@"Your must enter a count"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}



@end
