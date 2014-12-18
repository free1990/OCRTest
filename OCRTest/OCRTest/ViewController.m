//
//  ViewController.m
//  OCRTest
//
//  Created by John on 14/12/18.
//  Copyright (c) 2014年 WorkMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    G8Tesseract* tesseract = [[G8Tesseract alloc] initWithLanguage:@"eng+ita"];
    tesseract.delegate = self;
    
    [tesseract setVariableValue:@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                         forKey:kG8ParamTesseditCharWhitelist]; //limit search
    
    [tesseract setImage:[UIImage imageNamed:@"image_sample.jpg"]];
//    [tesseract setImage:[UIImage imageNamed:@"abc.jpg"]];
    
    //image to check
    [tesseract recognize];
    
    NSLog(@"---- >  %@", [tesseract recognizedText]);
    
    tesseract = nil;
}


- (BOOL)shouldCancelImageRecognitionForTesseract:(G8Tesseract*)tesseract
{
    NSLog(@"progress: %ld", tesseract.progress);
    return NO;  // return YES, if you need to interrupt tesseract before it finishes
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
