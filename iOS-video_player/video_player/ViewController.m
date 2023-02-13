
#import "ViewController.h"
#import "CommonUtil.h"
#import "ELVideoViewPlayerController.h"

NSString * const MIN_BUFFERED_DURATION = @"Min Buffered Duration";
NSString * const MAX_BUFFERED_DURATION = @"Max Buffered Duration";

@interface ViewController ()
{
    NSMutableDictionary*            _requestHeader;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"tiny Player";
    _requestHeader = [NSMutableDictionary dictionary];
    _requestHeader[MIN_BUFFERED_DURATION] = @(1.0f);
    _requestHeader[MAX_BUFFERED_DURATION] = @(3.0f);
    // Do any additional setup after loading the view, typically from a nib.
    dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue() ,^{
        NSLog(@"5");
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"4");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"6");
    });

}

- (IBAction)forwardToPlayer:(id)sender {
    NSLog(@"forward local player page...");
    NSString* videoFilePath = [CommonUtil bundlePath:@"recording.flv"];
//    videoFilePath = @"http://wspull01.live.changbalive.com/easylive/1709828.flv";
    videoFilePath = [CommonUtil bundlePath:@"test.flv"];
    BOOL usingHWCodec = YES;
    ELVideoViewPlayerController *vc = [ELVideoViewPlayerController viewControllerWithContentPath:videoFilePath contentFrame:self.view.bounds parameters:_requestHeader];
    [[self navigationController] pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
