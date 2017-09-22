//
//  CustomTableViewCell.m
//  MVVMDemo
//
//  Created by lbxia on 2017/3/22.
//  Copyright © 2017年 LBX. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userValidate;
@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configure:(CellParameterModel*)model
{
    _userImage.image = [UIImage imageNamed:model.userImage];
    _userName.text = model.userName;
    _userValidate.text = model.userValidate;
}

@end
