//
//  UIImage+Extension.h
//  QZFinancialSupermarket
//
//  Created by wzh on 17/2/28.
//
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,//从上到小
    GradientTypeLeftToRight = 1,//从左到右
    GradientTypeUpleftToLowright = 2,//左上到右下
    GradientTypeUprightToLowleft = 3,//右上到左下
};
@interface UIImage (Extension)
/**
 *  图片的圆角设置
 *
 *  @param name        图片的名字
 *  @param borderWidth 圆角宽度
 *  @param borderColor 圆角颜色
 *
 *  @return 设置好的image对象
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  加载图片
 *
 *  @param name 图片名
 */
+ (UIImage *)zhImageWithName:(NSString *)name;
+ (UIImage *)originalImageWithName:(NSString *)name;
/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
//将颜色转成图片
+(UIImage*)createImageWithColor:(UIColor*) color;
+(UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;
+ (UIImage *)imageByScalingToSize:(CGSize)targetSize imageName:(NSString *)imageName;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

+ (UIImage*)scaleImage:(UIImage*)aImage ToSize:(CGSize)aSize;
+ (UIImage*)scaleImageName:(NSString *)aImageName ToSize:(CGSize)aSize;
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
+ (UIImage *)scaleImageName:(NSString *)imageName toScale:(float)scaleSize;
@end
