//
//  TimerViewController.m
//  TestTimer
//
//  Created by Santiago on 2024/2/2.
//

#import "TimerViewController.h"

@interface TimerViewController ()
    
@end

@implementation TimerViewController
dispatch_source_t _timerForRecording;
dispatch_queue_t _safeTransactionQueue;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
    [self.view setBackgroundColor:[UIColor redColor]];
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"back" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 200, 40);
    [button addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self setupTimer];
}

- (void)clicked {
    [self dismissViewControllerAnimated:true completion:^{
        
    }];
}

- (void)setupTimer {
    if (_timerForRecording) {
        dispatch_source_cancel(_timerForRecording);
        _timerForRecording = NULL;
    }
    
    _timerForRecording = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _safeTransactionQueue);
    if (_timerForRecording) {
        dispatch_source_set_timer(_timerForRecording, dispatch_time(DISPATCH_TIME_NOW, 4.5 * NSEC_PER_SEC), 4.5 * NSEC_PER_SEC, 0.5 * NSEC_PER_SEC);
        __weak typeof(self) weakSelf = self;
        dispatch_source_set_event_handler(_timerForRecording, ^{
            [self sendLog];
        });
        dispatch_resume(_timerForRecording);
    }
}

- (void) sendLog {
    NSLog(@"send logg");
}
@end
