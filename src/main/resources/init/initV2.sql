-- 创建数据库 base_project
drop database if exists `base_project`;
create database `base_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- attachment 表
DROP TABLE IF EXISTS `base_project`.`attachment`;
CREATE TABLE `base_project`.`attachment`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `save_name`             varchar(255),
    `old_name`              varchar(255),
    `save_path`             varchar(255),
    `url_path`              varchar(255),
    `user_id`               varchar(255),
    `time`                  TIMESTAMP default now(),
    `type`                  varchar(255),
    `suffix`                varchar(255),
    `size`                  varchar(255),
    `width`                 varchar(255),
    `height`                varchar(255)
);

-- sort_info 表
DROP TABLE IF EXISTS `base_project`.`sort_info`;
CREATE TABLE `base_project`.`sort_info`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `name`                  varchar(255),
    `des`                   varchar(255),
    `full_name`             varchar(255),
    `series`                varchar(255),
    `last_id`               varchar(255),
    `first_name`            varchar(255),
    `last_name`             varchar(255),
    `sep`                   varchar(255),
    `sort`                  varchar(255),
    `status`                varchar(255)
);

-- login_log 表
DROP TABLE IF EXISTS `base_project`.`login_log`;
CREATE TABLE `base_project`.`login_log`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `user_name`             varchar(255),
    `login_time`            int4,
    `login_result`          varchar(255),
    `login_result_detail`   varchar(255),
    `login_url`             varchar(255)
);

-- login_pic 表
DROP TABLE IF EXISTS `base_project`.`login_pic`;
CREATE TABLE `base_project`.`login_pic`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `name`                  varchar(255),
    `detail`                varchar(255),
    `status`                varchar(255),
    `path`                  varchar(255),
    `create_time`           TIMESTAMP default now(),
    `update_time`           TIMESTAMP default now(),
    `create_user_id`        varchar(255),
    `update_user_id`        varchar(255),
    `sort`                  varchar(255),
    `attachment_id`         varchar(255)
);

-- menu 表
DROP TABLE IF EXISTS `base_project`.`menu`;
CREATE TABLE `base_project`.`menu`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `pid`                   varchar(255),
    `name`                  varchar(255),
    `url`                   varchar(255),
    `status`                varchar(255),
    `sort`                  int4,
    `series`                varchar(255),
    `icon`                  varchar(255)
);

-- role 表
DROP TABLE IF EXISTS `base_project`.`role`;
CREATE TABLE `base_project`.`role`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `name`                  varchar(255),
    `des`                   varchar(255),
    `status`                varchar(255)
);

-- role_menu 表
DROP TABLE IF EXISTS `base_project`.`role_menu`;
CREATE TABLE `base_project`.`role_menu`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `role_id`               varchar(255),
    `menu_id`               varchar(255)
);

-- system 表
DROP TABLE IF EXISTS `base_project`.`system`;
CREATE TABLE `base_project`.`system`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `system_key`            varchar(255),
    `system_value`          varchar(255),
    `remark`                varchar(255)
);

-- user_role 表
DROP TABLE IF EXISTS `base_project`.`user_role`;
CREATE TABLE `base_project`.`user_role`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `user_id`               varchar(255),
    `role_id`               varchar(255)
);

-- t_users
DROP TABLE IF EXISTS `base_project`.`t_users`;
CREATE TABLE `base_project`.`t_users`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `username`              varchar(255),
    `password`              varchar(255),
    `telephone`             varchar(255),
    `email`                 varchar(255),
    `home_url`              varchar(255),
    `screen_name`           varchar(255),
    `created`               int4,
    `activated`             int4,
    `logged`                int4,
    `group_name`            varchar(255),
    `status`                varchar(255),
    `type`                  varchar(255),
    `identification`        varchar(255),
    `address`               varchar(255),
    `unit`                  varchar(255)
);



--  菜单初始化
INSERT INTO `base_project`.`menu` VALUES ('0', '-1', '功能菜单', '-- ', '0', 00000000001, '0', NULL);
INSERT INTO `base_project`.`menu` VALUES ('402880e675cc5f190175cc5f19db0000', '0', '系统管理', '-- ', '0', 00000000002, '1', '&-- xe62e;');
INSERT INTO `base_project`.`menu` VALUES ('402880e675cc5f190175cc6b359a0001', '402880e875cfd3fb0175cfd3fba80000', '用户管理', '/admin/user/manager', '0', 00000000004, '2', '');
INSERT INTO `base_project`.`menu` VALUES ('402880e675cc5f190175cc6bc2100002', '402880e675cc5f190175cc5f19db0000', '系统设置', '/admin/system/manager', '0', 00000000005, '2', '');
INSERT INTO `base_project`.`menu` VALUES ('402880e675cc5f190175cc6c4c880003', '402880e675cc5f190175cc5f19db0000', '登录设置', '/admin/loginPic/manager', '0', 00000000006, '2', '');
INSERT INTO `base_project`.`menu` VALUES ('402880e675cc5f190175cc6ce8df0004', '402880e675cc5f190175cc5f19db0000', '菜单管理', '/admin/menu/manager', '0', 00000000007, '2', '');
INSERT INTO `base_project`.`menu` VALUES ('402880e675cc5f190175cc6f9aaa0005', '402880e675cc5f190175cc5f19db0000', '数据字典', '/admin/dict/manager', '0', 00000000008, '2', '');
INSERT INTO `base_project`.`menu` VALUES ('402880e875cfd3fb0175cfd3fba80000', '0', '管理员管理', '-- ', '0', 00000000001, '1', '&-- xe62d;');
INSERT INTO `base_project`.`menu` VALUES ('402880e875cfd3fb0175d009042d0001', '402880e875cfd3fb0175cfd3fba80000', '12', '21', '2', 00000000001, '2', '21');
INSERT INTO `base_project`.`menu` VALUES ('402880e875d061220175d06122d40000', '402880e875cfd3fb0175cfd3fba80000', '角色管理', '/admin/role/manager', '0', 00000000000, '2', '');
INSERT INTO `base_project`.`menu` VALUES ('402880e875da2fb60175da2fb6020000', '402880e875cfd3fb0175cfd3fba80000', '测试', '/admin/checkBox/', '2', 00000000003, '2', '');
INSERT INTO `base_project`.`menu` VALUES ('402880e875f422000175f42200710000', '402880e875cfd3fb0175cfd3fba80000', '管理员用户', '/admin/administrator/manager', '0', 00000000005, '2', '');
INSERT INTO `base_project`.`menu` VALUES ('402880e875f905c30175f905c3590000', '828282dd75e3a1860175e3a1862b0000', '报表1', '/admin/registration/report1', '2', 00000000001, '2', '');
INSERT INTO `base_project`.`menu` VALUES ('828282d275fe3a5f0175fe3a5fc90000', '828282dd75e3a1860175e3a1862b0000', '报表2', '/admin/registration/report2', '2', 00000000001, '2', '');
INSERT INTO `base_project`.`menu` VALUES ('828282d275ff33400175ff33409b0000', '828282dd75e3a1860175e3a1862b0000', '报表3', '/admin/registration/report3', '2', 00000000002, '2', '');
INSERT INTO `base_project`.`menu` VALUES ('828282dd75e3a1860175e3a1862b0000', '0', '报名管理', '', '2', 00000000003, '1', '&-- xe637;');
INSERT INTO `base_project`.`menu` VALUES ('828282dd75e3a1860175e3a2d3520001', '828282dd75e3a1860175e3a1862b0000', '报名表', '/admin/registration/manager', '2', 00000000000, '2', '');

--  角色初始化
INSERT INTO `base_project`.`role` VALUES ('402880e875d9433b0175d9433b3f0000', '管理员', '管理员', '0');
INSERT INTO `base_project`.`role` VALUES ('402880e875d9433b0175d94681af0019', '普通用户', '普通用户', '0');

-- 角色菜单对应关系
INSERT INTO `base_project`.`role_menu` VALUES ('402880e875d9433b0175d9454e9f0011', '402880e875d9433b0175d9433b3f0000', '402880e675cc5f190175cc5f19db0000');
INSERT INTO `base_project`.`role_menu` VALUES ('402880e875d9433b0175d9454e9f0012', '402880e875d9433b0175d9433b3f0000', '402880e675cc5f190175cc6b359a0001');
INSERT INTO `base_project`.`role_menu` VALUES ('402880e875d9433b0175d9454e9f0013', '402880e875d9433b0175d9433b3f0000', '402880e675cc5f190175cc6bc2100002');
INSERT INTO `base_project`.`role_menu` VALUES ('402880e875d9433b0175d9454e9f0014', '402880e875d9433b0175d9433b3f0000', '402880e675cc5f190175cc6c4c880003');
INSERT INTO `base_project`.`role_menu` VALUES ('402880e875d9433b0175d9454e9f0015', '402880e875d9433b0175d9433b3f0000', '402880e675cc5f190175cc6ce8df0004');
INSERT INTO `base_project`.`role_menu` VALUES ('402880e875d9433b0175d9454e9f0016', '402880e875d9433b0175d9433b3f0000', '402880e675cc5f190175cc6f9aaa0005');
INSERT INTO `base_project`.`role_menu` VALUES ('402880e875d9433b0175d9454e9f0017', '402880e875d9433b0175d9433b3f0000', '402880e875cfd3fb0175cfd3fba80000');
INSERT INTO `base_project`.`role_menu` VALUES ('402880e875d9433b0175d9454e9f0018', '402880e875d9433b0175d9433b3f0000', '402880e875d061220175d06122d40000');
INSERT INTO `base_project`.`role_menu` VALUES ('402880e875f911450175f928a7e20001', '402880e875d9433b0175d94681af0019', '828282dd75e3a1860175e3a1862b0000');
INSERT INTO `base_project`.`role_menu` VALUES ('402880e875f911450175f928a7e20002', '402880e875d9433b0175d94681af0019', '828282dd75e3a1860175e3a2d3520001');
INSERT INTO `base_project`.`role_menu` VALUES ('402880e875f911450175f928a7e30003', '402880e875d9433b0175d94681af0019', '402880e875f905c30175f905c3590000');

-- 字段
INSERT INTO `base_project`.`sort_info` VALUES ('0', '数据字典', '数据字典', '数据字典', '0', '-1', '0', '数据字典', '/', '1', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e896e2ee0000', '性别', '性别', '性别', '1', '0', '/', '性别', '/', '3', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e89712130001', '0', '男', '性别null男', '2', '402880e875e896e20175e896e2ee0000', '性别', '性别', '/', '1', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e89735a00002', '1', '女', '性别null女', '2', '402880e875e896e20175e896e2ee0000', '性别', '性别', '/', '2', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e8b10ee90003', '研发阶段', '研发阶段', '研发阶段', '1', '0', '/', '研发阶段', '/', '4', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e8b203320004', '0', '技术设计', '研发阶段/技术设计', '2', '402880e875e896e20175e8b10ee90003', '研发阶段', '研发阶段', '/', '1', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e8b239210005', '1', '原理机', '研发阶段/原理机', '2', '402880e875e896e20175e8b10ee90003', '研发阶段', '研发阶段', '/', '2', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e8b273cc0006', '2', '原型机', '研发阶段/原型机', '2', '402880e875e896e20175e8b10ee90003', '研发阶段', '研发阶段', '/', '3', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e8b2a2850007', '3', '项目转化', '研发阶段/项目转化', '2', '402880e875e896e20175e8b10ee90003', '研发阶段', '研发阶段', '/', '4', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e8b2f2230008', '介绍资料', '介绍资料', '介绍资料', '1', '0', '/', '介绍资料', '/', '5', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e8b3245e0009', '0', 'ppt', '介绍资料/ppt', '2', '402880e875e896e20175e8b2f2230008', '介绍资料', '介绍资料', '/', '1', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e8b3554f000a', '1', '视频', '介绍资料/视频', '2', '402880e875e896e20175e8b2f2230008', '介绍资料', '介绍资料', '/', '2', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e8b388fb000b', '2', '动效', '介绍资料/动效', '2', '402880e875e896e20175e8b2f2230008', '介绍资料', '介绍资料', '/', '3', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875e896e20175e8b3b2d5000c', '3', '其它', '介绍资料/其它', '2', '402880e875e896e20175e8b2f2230008', '介绍资料', '介绍资料', '/', '4', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '所属地区', '1', '0', '/', '所属地区', '/', '6', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f341cd060001', '0', '杭州', '所属地区/杭州', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '1', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f341eff00002', '1', '省级医院', '所属地区/省级医院', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '2', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f3424f950003', '2', '宁波', '所属地区/宁波', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '3', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f34289a90004', '3', '金华', '所属地区/金华', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '4', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f342c7920005', '4', '温州', '所属地区/温州', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '5', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f34327980006', '5', '台州', '所属地区/台州', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '6', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f34372290007', '6', '舟山', '所属地区/舟山', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '7', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f343ad170008', '7', '湖州', '所属地区/湖州', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '8', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f344025d0009', '8', '嘉兴', '所属地区/嘉兴', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '9', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f3448ab8000a', '9', '衢州', '所属地区/衢州', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '10', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f344eafa000b', '10', '绍兴', '所属地区/绍兴', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '11', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880e875f340fb0175f3452f92000c', '11', '丽水', '所属地区/丽水', '2', '402880e875f340fb0175f340fbb50000', '所属地区', '所属地区', '/', '12', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880ed75b0d93a0175b0d93a5b0000', '是否启用', '是否启用', '是否启用', '1', '0', '/', '是否启用', '/', '1', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880ed75b0d93a0175b0d986670001', '0', '是', '是否启用/是', '2', '402880ed75b0d93a0175b0d93a5b0000', '是否启用', '是否启用', '/', '1', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880ed75b0d93a0175b0d9adcd0002', '1', '否', '是否启用/否', '2', '402880ed75b0d93a0175b0d93a5b0000', '是否启用', '是否启用', '/', '2', '0');
INSERT INTO `base_project`.`sort_info` VALUES ('402880ed75b569f50175b569f57f0000', '1', '1', '1', '1', '0', '/', '1', '/', '2', '2');

-- 系统配置
INSERT INTO `base_project`.`system` VALUES ('1', 'logo', '402880e675ca18620175ca1bca420002', '');
INSERT INTO `base_project`.`system` VALUES ('2', 'copyright', '2020 © 中国智能协会', '');

--  用户
INSERT INTO `base_project`.`t_users` VALUES ('1', 'admin', 'f6fdffe48c908deb0f4c3bd36c032e72', NULL, '2816498817@qq.com', NULL, 'admin', 1490756162, 0, 0, '', '0', '2', NULL, NULL, NULL);
INSERT INTO `base_project`.`t_users` VALUES ('2', '123', '4297f44b13955235245b2497399d7a93', NULL, '1600198991@qq.com', NULL, '超级管理员', 1490756162, 0, 0, '', '0', '2', NULL, NULL, NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880e675ca33ee0175ca33eef90000', '1', '2cfd4560539f887a5e420412b370b361', '15617875453', '1600198991', NULL, '李卫朋', 0, 0, 0, '402880e875d9433b0175d94681af0019', '0', '0', '1', '1', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880e675ca33ee0175ca33ef230001', '2', '3c59dc048e8850243be8079a5c74d079', '1', '1', NULL, '1', 0, 0, 0, '', '2', '0', '1', '1', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880e875d53d060175d53d06b50000', '2', '5a1e3a5aede16d438c38862cac1a78db', '2', '2', NULL, '2', 0, 0, 0, '', '2', '0', '2', '2', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880e875f422000175f433010a0005', 'manager', '0795151defba7a4b5dfa89170de46277', '', '', NULL, 'manager', 0, 0, 0, '402880e875d9433b0175d9433b3f0000', '0', '1', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880e875f976950175f977bb740002', '2', '5a1e3a5aede16d438c38862cac1a78db', '', '', NULL, '2', 0, 0, 0, '402880e875d9433b0175d94681af0019', '2', '0', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880ec76dc02d00176dc02d0ea0000', '2121', '08fcca953ea86087ab71581a8a33a689', '', '', NULL, '21', 0, 0, 0, '', '2', '0', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880ec76dc02d00176dc62651f0001', 'll', '69215793fafec162b250b7525d1f65cb', '', '', NULL, '45', 0, 0, 0, '', '2', '0', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880ec76dc02d00176dc6360f60002', '12', '0acf03f408f90ea0dcba786d300620db', '', '', NULL, '122', 0, 0, 0, '', '2', '0', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880ec76e111b50176e111b54f0000', '21', '72f9f967c43ce5c44ea12bf78ae63eaf', '', '', NULL, '2122', 0, 0, 0, '', '0', '0', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880ec76e111b50176e14134220001', '12', '0acf03f408f90ea0dcba786d300620db', '', '', NULL, '21121', 0, 0, 0, '', '0', '0', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880ec76e111b50176e159f7020002', '212', '631adfda20949eb1f2533d1da0b505a4', '', '', NULL, '21', 0, 0, 0, '', '0', '0', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880ec76e111b50176e15a0c7b0003', '211', 'a68374dba52abd050cb60a3199898ea8', '', '', NULL, '21212', 0, 0, 0, '', '0', '0', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880ec76e111b50176e15a23410004', '21212121', 'c3b8616b7ea9902f19c0d5a5f0bf4f7c', '', '', NULL, '2121', 0, 0, 0, '', '0', '0', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880ec76e111b50176e15a440e0005', '212121212', 'fd193e2bb951ed9e537524b639bd08c0', '', '', NULL, '212121', 0, 0, 0, '', '0', '0', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880ec76e111b50176e15a5b3b0006', '32121', '55209d1b1c61cae42b90ced6bf443bb8', '', '', NULL, '321231', 0, 0, 0, '', '0', '0', '', '', NULL);
INSERT INTO `base_project`.`t_users` VALUES ('402880ec76e111b50176e15a834c0007', '32', 'e557bfa4e959dc5025f60ee6f5cb4298', '', '', NULL, '32', 0, 0, 0, '', '0', '0', '', '', NULL);


--  用户角色
INSERT INTO `base_project`.`user_role` VALUES ('402880e875db89070175db8b1f0e0004', '402880e675ca33ee0175ca33eef90000', '402880e875d9433b0175d94681af0019');
INSERT INTO `base_project`.`user_role` VALUES ('402880e875f422000175f422e5220002', '402880e875f422000175f422e5150001', '402880e875d9433b0175d9433b3f0000');
INSERT INTO `base_project`.`user_role` VALUES ('402880e875f422000175f42f03040004', '402880e875f422000175f42f02fe0003', '402880e875d9433b0175d9433b3f0000');
INSERT INTO `base_project`.`user_role` VALUES ('402880e875f422000175f43301100006', '402880e875f422000175f433010a0005', '402880e875d9433b0175d9433b3f0000');
INSERT INTO `base_project`.`user_role` VALUES ('402880e875f976950175f977bb860003', '402880e875f976950175f977bb740002', '402880e875d9433b0175d94681af0019');


-- t_users
DROP TABLE IF EXISTS `base_project`.`financial`;
CREATE TABLE `base_project`.`financial`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `financial_name`        varchar(255),
    `source`                varchar(255),
    `purchase_time`         TIMESTAMP,
    `purchase_amount`       int8,
    `financial_user`        varchar(255),
    `financial_code`        varchar(255),
    `status`                varchar(255),
    `remark`                varchar(255),
    `create_time`           TIMESTAMP default now()
);


DROP TABLE IF EXISTS `base_project`.`financial_record`;
CREATE TABLE `base_project`.`financial_record`
(
    `id`                    varchar(255) NOT NULL PRIMARY KEY,
    `financial_id`          varchar(255),
    `record_time`           TIMESTAMP,
    `record_amount`         numeric,
    `total_income`          numeric,
    `last_income`           numeric,
    `total_day`             int4,
    `last_day`              int4,
    `total_rate`            numeric,
    `last_rate`             numeric,
    `total_income_wan`      numeric,
    `last_income_wan`       numeric,
    `total_one_day_income`  numeric,
    `last_one_day_income`   numeric,
    `total_one_day_income_wan`  numeric,
    `last_one_day_income_wan`   numeric,
    `create_time`           TIMESTAMP default now()
);