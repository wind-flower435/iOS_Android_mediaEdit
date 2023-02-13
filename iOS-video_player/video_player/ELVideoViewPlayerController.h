

#import <UIKit/UIKit.h>

@interface ELVideoViewPlayerController : UIViewController

+ (id)viewControllerWithContentPath:(NSString *)path
                       contentFrame:(CGRect)frame
                       parameters: (NSDictionary *)parameters;

@end
