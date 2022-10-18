//
//  ViewController.m
//  KiMe
//
//  Created by Chang Liu on 2022/1/17.
//

#import "ViewController.h"

#import "GLView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSData *yuvData;
    GLView * myview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *yuvFile = [[NSBundle mainBundle] pathForResource:@"jpgimage1_image_640_480" ofType:@"yuv"];
    yuvData = [NSData dataWithContentsOfFile:yuvFile];
    NSLog(@"the reader length is %lu", (unsigned long)yuvData.length);
    
    myview = [[GLView alloc]initWithFrame:CGRectMake(20, 20, self.view.frame.size.width - 40, self.view.frame.size.height - 40)];
    [self.view addSubview:myview];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UInt8 * pFrameRGB = (UInt8*)[yuvData bytes];
    [myview setVideoSize:640 height:480];
    [myview displayYUV420pData:pFrameRGB width:640 height:480];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
