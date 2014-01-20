//
//  ConvertorViewController.m
//  Temperature
//
//  Created by Hua Wu on 1/18/14.
//  Copyright (c) 2014 zynga. All rights reserved.
//

#import "ConvertorViewController.h"

@interface ConvertorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *FahrenValue;
@property (weak, nonatomic) IBOutlet UITextField *CelValue;
- (IBAction)Convert:(id)sender;
- (float)startConvert:(BOOL)flag Temp:(float)temperature;
- (IBAction)onTap:(id)sender;
@end

@implementation ConvertorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.title = @"Temperature";
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont boldSystemFontOfSize:20.0];
        label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        self.navigationItem.titleView = label;
        label.text = @"Temperature";
        [label sizeToFit];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Convert:(id)sender {
    NSString *FTempField = self.FahrenValue.text;
    NSString *CTempField = self.CelValue.text;
    NSLog(@"The FtempField is: %@", FTempField);
    NSLog(@"The CtempField is: %@", CTempField);
    float result;
    if (![FTempField isEqual: @""]) {
        float FTemp = [self.FahrenValue.text floatValue];
        result = [self startConvert:YES Temp:FTemp];
        self.CelValue.text =  [NSString stringWithFormat:@"%0.1f", result];
    } else if (![CTempField isEqual: @""]) {
        float CTemp = [self.CelValue.text floatValue];
        result = [self startConvert:NO Temp:CTemp];
        self.FahrenValue.text = [NSString stringWithFormat:@"%0.1f", result];
    }
}

- (float)startConvert:(BOOL)flag Temp:(float)temperature {
    if (flag) {
        // convert F to C
        return (temperature - 32) * 5 / 9;
    } else {
        return temperature * 9 / 5 + 32;
    }
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

@end
