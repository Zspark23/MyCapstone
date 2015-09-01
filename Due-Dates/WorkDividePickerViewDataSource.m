//
//  WorkDividePickerViewDataSource.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/27/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "WorkDividePickerViewDataSource.h"

@implementation WorkDividePickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
}

@end
