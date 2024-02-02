//
//  ViewController.m
//  TestTimer
//
//  Created by Santiago on 2024/2/2.
//

#import "ViewController.h"
#import "TimerViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)showTimerVC:(id)sender {
    TimerViewController* timervc = [[TimerViewController alloc] init];
    [self presentViewController:timervc animated:YES completion:nil];
}

@end
