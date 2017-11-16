//
//  QZUserCenterCell.m
//  
//
//  Created by wzh on 17/3/14.
//
//

#import "QZUserCenterCell.h"
#import "QZUserCenterItem.h"

@interface QZUserCenterCell ()

@property (strong, nonatomic) QZUserCenterItem *myItem;

@end

@implementation QZUserCenterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    [self setDefautUI];
}
+ (QZUserCenterCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *indent = @"cell";
    [tableView registerNib:[UINib nibWithNibName:@"QZUserCenterCell" bundle:nil] forCellReuseIdentifier:indent];
    QZUserCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setDefautUI{
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.titleLab textColor:[UIColor colorWith0x333333] textFont:[UIFont textCustomFont15]];
    [self.FindNewVersionLabel styleWithCornerRadius:10.0];
    self.FindNewVersionLabel.hidden = YES;
    self.topLineView.backgroundColor = [UIColor colorWith0xEFEFEF];
    self.bottomLineView.backgroundColor = [UIColor colorWith0xEFEFEF];
    [self.arrowBtn setImage:[UIImage imageNamed:@"nextArrow"] forState:UIControlStateNormal];
    self.iconLeft.constant = 20 * kScaleOfX;
    self.titleLeft.constant = 15 * kScaleOfX;
    self.arrowRight.constant = 15 * kScaleOfX;
    
    
    
    [self.desLab textColor:[UIColor colorWith0x333333] textFont:[UIFont textCustomFont15]];
    
    self.hotImageViewTop.constant = 10 *kScaleOfX;
    self.hotImageViewLeft.constant = 4 * kScaleOfX;
    self.hotImageView.image = [UIImage imageNamed:@"hot"];
    self.hotImageView.hidden = YES;
    self.redPointView.backgroundColor = [UIColor colorWith0xf27d00];
    self.redPointViewRight.constant = 5 * kScaleOfX;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if(selected){
        if(self.myItem.selectValueAction){
            self.myItem.selectValueAction(self);
        }
    }
}


- (void)setItem:(QZUserCenterItem *)item{
    self.myItem = item;
    //设置图标显示
    if(item.icon && ![item.icon isEqual:@""]){
        self.titleLeft.constant = 15 * kScaleOfX;
        self.iconImageView.hidden = NO;
        self.iconImageView.image = [UIImage imageNamed:item.icon];
    }else{
        self.titleLeft.constant = -self.iconImageView.width;
        self.iconImageView.hidden = YES;
    }
    self.titleLab.text = [NSString stringWithFormat:@"%@",item.title];
    self.desLab.text = [NSString stringWithFormat:@"%@",item.des];
    
    //设置新版本显示
    if (item.showNewVersion) {
        self.FindNewVersionLabel.hidden = NO;
    } else {
        self.FindNewVersionLabel.hidden = YES;
    }
    
    //设置是否显示switch
    self.mSwitch.hidden = !item.isSwitch;
    
    //如果有switch 则箭头没有
    if(item.isSwitch){
        item.isArrow = NO;
    }
    //设置箭头
    if(item.isArrow){
        self.arrowBtn.hidden = NO;
        self.desRight.constant = 5 * kScaleOfX;
    }else{
        self.arrowBtn.hidden = YES;
        self.desRight.constant = - self.arrowBtn.width;
    }
    
    //设置是否热度
    self.hotImageView.hidden = !item.isHot;
    if(item.isHot){
        self.desLab.font = [UIFont textBoldFont16];
    }else{
        self.desLab.font = [UIFont textFont15];
    }
    //红点处理
    self.redPointView.hidden = !item.isRedPoint;

    //设置线条
    switch (item.lineType) {
            //上隐藏下显示 下段 == QZLineTypeDefaut
        case QZLineTypeTopHiddenBottomShortShow:{
            self.topLineView.hidden = YES;
            self.bottomLineView.hidden = NO;
            self.bottomLeft.constant = 15 * kScaleOfX;
            self.bottomRight.constant = 15 * kScaleOfX;

        }
            break;
            //上下线都显示 上长下段
        case QZLineTypeTopShowBottomShortShow:{
            self.topLineView.hidden = NO;
            self.bottomLineView.hidden = NO;
            self.bottomLeft.constant = 15 * kScaleOfX;
     
            
        }
            break;
            //上隐藏下显示 下长
        case QZLineTypeTopHiddenBottomShow:{
            self.topLineView.hidden = YES;
            self.bottomLineView.hidden = NO;
            self.bottomLeft.constant = 0;
        }
            break;
            //上下线都显示 都是长的
        case QZLineTypeTopShowBottomShow:{
            self.topLineView.hidden = NO;
            self.bottomLineView.hidden = NO;
            self.bottomLeft.constant = 0;
        }
            break;
        case QZLineTypeTopHiddenBottomHidden:{
            self.topLineView.hidden = YES;
            self.bottomLineView.hidden = YES;
        }
            break;
        default:
            break;
    }

}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.redPointView styleWithCornerRadius:self.redPointView.width / 2];
}

@end
