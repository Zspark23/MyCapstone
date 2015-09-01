//
//  WorkTypePickerViewDataSource.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/26/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "WorkTypePickerViewDataSource.h"

@implementation WorkTypePickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 7;
}

@end
