//
//  SFCFCNetworkEngine.h
//  SinaFreshCity
//
//  Created by 飞 光普 on 14-8-7.
//  Copyright (c) 2014年 sina.com. All rights reserved.
//



#import "SANetworkEngine.h"
#import "SANetworkOperation.h"
typedef void (^SFCFCNetworkEngineCallback)(id resp, NSError *error);

@interface MCNetworkEngine :SANetworkEngine
+ (instancetype)defaultEngine;
/*
 *	@brief	2.1	基础数据接口
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getFaoundationDateWithCallback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.2.1	首页广告 
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getHomeAdWithCallback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.2.2	课程推荐
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getRecommendCourseWithCallback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.2.3	积分乐园
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */

//积分乐园首页及代金券；
- (SANetworkOperation *)getMoneyCardWithUser:(NSString *)user Vid:(int)vid Vcode:(NSString *)vcode Callback:(SFCFCNetworkEngineCallback)callback;
//积分乐园首页接口
- (SANetworkOperation *)getIntegralShopWithpage:(int)page pageCount:(int)pageCount Callback:(SFCFCNetworkEngineCallback)callback;
//积分乐园礼品兑换；
//积分乐园礼品兑换接口；1
- (SANetworkOperation *)getIntegralShopPresentWithCallback:(SFCFCNetworkEngineCallback)callback;
//积分乐园礼品兑换接口；2
- (SANetworkOperation *)getIntegralShopPresentWithpage:(int)page pageCount:(int)pageCount Callback:(SFCFCNetworkEngineCallback)callback;
//礼品兑换详情接口；
-(SANetworkOperation *)getIntegralShopPresentConVertWithPresentId:(int)presentId Callback:(SFCFCNetworkEngineCallback)callback;
//礼品兑换提交交数据接口；
- (SANetworkOperation *)ConverPresentWithUser:(NSString *)user pid:(int)pid Callback:(SFCFCNetworkEngineCallback)callback;
//我的代金券接口；
- (SANetworkOperation *)getMoneyCardWithUser:(NSString *)user AndStatu:(int)status page:(int)page pageCount:(int)pageCount Callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.3.1	热门搜索
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getHotSearchWithCallback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.3.2	搜索
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getSearch:(NSString *)keyword page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.3.3	热门课程
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getHotCourse:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.3.4	猜您喜欢
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getGuessLikeCourse:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.3.5	热评课程
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getHotCommentsCourse:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.3.6	最新课程
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getLatestCourse:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.4.1	筛选（学段+年级+科目+排序）
 *
 *	@param 	stage 学段Id
 *	@param 	grade 年级
 *	@param 	subject 学科
 *	@param 	sort 排序方法，“1”为“最新”，“2”为“最热”，3为“公开课”
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getFilterSearchCourse:(NSString *)stage grade:(NSString *)grade subject:(NSString *)subject sort:(NSString *)sort  page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.5.1	获取图片验证码
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getImageVerfyWithCallback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.5.5	邮箱注册（邮箱+密码）
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)emailRegist:(NSString *)email nickName:(NSString *)nickName password:(NSString *)password andDevice_token:(NSString * )deviceToken callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.5.9	忘记密码提交邮箱
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)emailforget:(NSString *)email userName:(NSString *)userName callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.5.10	登录（名字+密码）
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)Login:(NSString *)loginName
                     passWord:(NSString *)userPass token:(NSString *) token
                     callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.6.1	课程课件列表
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getCourseList:(NSString *)courseId
                            callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.6.3	课程通知
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getCourseNotifacationList:(NSString *)courseId page:(NSString *)page count:(NSString *)page_count user:(NSString * )user islogin:(NSString * )islogin
                                         callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.6.4	课程详情
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getCourseDetail:(NSString *)courseId user:(NSString * )user isLogin:(NSString * )islogin
                               callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.6.5	收藏网校
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)collectStore:(NSString *)storeId
                               callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.6.6	取消网校收藏
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)uncollectStore:(NSString *)storeId
                            callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.6.7	收藏课程
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)collectCrouse:(NSString *)crouseId
                              callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.6.8	取消收藏课程
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)uncollectCrouse:(NSString *)crouseId
                             callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.6.9	添加购物车
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)addCart:(NSString *)crouseId
                               callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.6.10	删除购物车
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)delCart:(NSString *)crouseId
                       callback:(SFCFCNetworkEngineCallback)callback;


/*
 *	@brief	2.6.11	提交订单
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)createOrder:(NSString *)cour_id ifcart:(BOOL)isCart crouses:(NSArray *)crouses callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.6.13	支付宝支付结果通知后台/支付确认接口
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)setPaymentStatus:(NSString *)pay_sn trade_no:(NSString *)trade_no callback:(SFCFCNetworkEngineCallback)callback;


/*
 *	@brief	2.6.14	余额查询
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)checkBalance:(NSString*)userId callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.6.15	预存款支付
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)balancePay:(NSString*)orderId callback:(SFCFCNetworkEngineCallback)callback;


/*
 *	@brief	2.6.16	添加观看记录
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)addWatch:(NSString *)cour_id lessionId:(NSArray *)less_id user:(NSString *) user andWatchState:(NSString *)watchState andisrepeatWatch:(int)isrepeatWatch callback:(SFCFCNetworkEngineCallback)callback;
//添加观看记录（3.3.1.2变更）
- (SANetworkOperation *)addWatch:(NSString *)cour_id user:(NSString *)user wichNum:(int)c_num callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.7.1	添加到我的课程
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)addtoMyCrouse:(NSString *)crouseId
                       callback:(SFCFCNetworkEngineCallback)callback;


/*
 *	@brief	2.8.1	获取题目列表
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getQuestions:(NSString *)courseId lessionId:(NSString *)lessionId user:(NSString *) user showNumber:(NSString *)show callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.8.2	下载题目
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
//- (SANetworkOperation *)downloadQuestion:(NSString *)questionName callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.8.3	提交答案
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)updateQuestionAnswer:(NSString *)crouseID lessionId:(NSString *)lessionId duration:(int)duration answers:(NSArray *)answers callback:(SFCFCNetworkEngineCallback)callback;


/*
 *	@brief	2.8.4	加入错题集
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)addWrongQuestionAnswer:(NSString *)crouseID lessionId:(NSString *)lessionId question_id:(NSString *)question_id answer:(NSString *)answer callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.1	获取我的页面基础数据
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getMineBasicData:(NSString*)userID callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.2	未看微课
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getUnWatchCourseList:(NSString*)userID page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.3	我的课程排序方式（’study’最近学习;’publish’最近更新）默认为最近学习排序
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */

- (SANetworkOperation *)getMineCourseList:(NSString*)userID page:(NSString *)page count:(NSString *)page_count andorderType:(NSString *)orderType stage:(NSString *)stage grage:(NSString *) grage  subject:(NSString *) subject callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.4	我收藏的课程
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getMineFavoriteCourseList:(NSString*)userID page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.5	我收藏的课程
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getMyFavoriteSchoolList:(NSString*)userID page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.6	我的购物车
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getMyShoppingCartList:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.7	错题集
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getWrongCourseList:(NSString*)userID page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.8	错题集详情
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getWrongCourseDetailList:(NSString*)userID courseId:(NSString*)courseId page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.10	我的订单
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getMyOrderList:(NSString*)userID page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.11	我的订单中待付款交易
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getMyOrderWaitPayList:(NSString*)userID page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.11	我的订单中已付款订单
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getMyOrderHavePayList:(NSString*)userID page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.11	我的订单中已取消订单
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getMyOrderCancelPayList:(NSString*)userID page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.11	取消订单
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)deleteMyOrderList:(NSString*)orderID reason:(NSString *)extend_msg callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.13	查看订单详情
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getMyOrderDetail:(NSString*)orderID callback:(SFCFCNetworkEngineCallback)callback;



/*
 *	@brief	2.11.1	意见反馈
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)feedbackWithContent:(NSString*)content callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.11.2	检测更新
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)checkUpdateWithCallback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.10.4	网校内热门课程
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getSchoolHotCourse:(NSString*)schoolId page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.10.5	网校内最新课程
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getSchoolLatestCourse:(NSString*)schoolId page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.10.3	网校内课程筛选
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getSchoolCourseBySubjectId:(NSString*)schoolId subjectId:(NSString*)subjectId page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;




/*
 *	@brief	2.10.2	网校科目列表
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getSchoolSubjectList:(NSString*)schoolId callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.16	更新个人资料
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)updatePrivateInfor:(NSString*)userId mobile:(NSString*)mobile sex:(NSString*)sex birthday:(NSString*)birthday address:(NSString*)address qq:(NSString*)qq weixin:(NSString*)weixin callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.18	修改密码
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)modifyPassword:(NSString*)oldPassword newPassword:(NSString*)newPassword callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.18	修改邮箱
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)modifyEmailaddress:(NSString*)email newPassword:(NSString*)password callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.10.1	网校内搜索
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)schoolInternalSearch:(NSString*)schoolId keyword:(NSString*)keyword page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	2.9.15	获取积分明细
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getScoreDetail:(NSString*)userId callback:(SFCFCNetworkEngineCallback)callback;

- (SANetworkOperation *)downloadZip:(NSString *)filePath callback:(SFCFCNetworkEngineCallback)callback;

//根据网校id获取网校详情
- (SANetworkOperation *)getSchoolInfor:(NSString *)schoolId callback:(SFCFCNetworkEngineCallback)callback;
- (SANetworkOperation *)balance:(NSString*)userId callback:(SFCFCNetworkEngineCallback)callback;


//内购收据验证；
- (SANetworkOperation *)Acount:(NSString*)userId reciept:(NSString *)reciept storeUrl:(NSString*)storeUrl  callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	3.10.2	当天学情分析接口
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *) getStudyReportCallback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	3.10.1	获取某天时间段内的时长及总时长打败考生比例接口
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *) getDurDistribution:(NSString *) sday Callback:(SFCFCNetworkEngineCallback)callback;
/*
 *	@brief	3.2	观看片段记录接口
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)addCourseWatchRecordlessionId:(NSString*)lessionId  crouseID:(NSString *)crouseID wbehavior:(NSString *) wbehavior type:(NSString *)type callback:(SFCFCNetworkEngineCallback)callback;

/*
 *	@brief	3.10	查看课件答题后学情分析
 *
 *	@param 	nil
 *
 *	@return	SANetworkOperation
 */
- (SANetworkOperation *)getcurriculumReport:(NSString *)user crouseID:(NSString *)crouseID lessionId:(NSString *)lessionId  callback:(SFCFCNetworkEngineCallback)callback;
//3.5订单提交前的接口
-(SANetworkOperation*)CreatOrderWithUser:(NSString * )user CourseId:(NSString * )courseId callback:(SFCFCNetworkEngineCallback)callback;
//3.8	生成订单接口（即提交订单）
-(SANetworkOperation*)CreatOrderWithUser:(NSString * )user CourseId:(int)courseId payMessage:(NSString *)message orderFrom:(int)orderfrom ifVoucher:(int)ifvoucher Voucher:(NSString * )voucher callback:(SFCFCNetworkEngineCallback)callback;

//虚拟币支付6.27;
- (SANetworkOperation *)balancePayWithUser:(NSString *)user pay_sn:(NSString*)pay_sn  callback:(SFCFCNetworkEngineCallback)callback;


//3.17.1.1	 获取课程评价
-(SANetworkOperation*)loadEvaluationData:(NSString * )user CourseId:(NSString *)courseId page:(NSString *)page callback:(SFCFCNetworkEngineCallback)callback;

//3.17.1.1	 获取我的评价标签
-(SANetworkOperation*)loadMyEvaluationTagLabCallback:(SFCFCNetworkEngineCallback)callback;

//3.18.1.1	 提交我的评价
-(SANetworkOperation*)updateEvaluationData:(NSString * )user CourseId:(NSString *)courseId starRate:(NSString *)star evalutionContent:(NSString *)content  anony:(NSString *)anony lablesIds:(NSString *)lables_ids  callback:(SFCFCNetworkEngineCallback)callback;
//3.18.1	获取IOS内购设置是否允许内购；
- (SANetworkOperation *)allowToBuycallback:(SFCFCNetworkEngineCallback)callback;

//5.6获取优秀课堂接口
- (SANetworkOperation *)getGoodStoreCourse:(NSString *)page count:(NSString *)page_count userID:(NSString*)userID callback:(SFCFCNetworkEngineCallback)callback;

//5.7删除我的课程
- (SANetworkOperation *)DeleteMyCourse:(NSString*)userID courseId:(NSString *)courseId callback:(SFCFCNetworkEngineCallback)callback;

//	@brief	5.8获取教师信息
- (SANetworkOperation *)getSchoolTeacher:(NSString*)schoolId type:(NSString *)type page:(NSString *)page count:(NSString *)page_count callback:(SFCFCNetworkEngineCallback)callback;
//	@brief	5.9我的消息
- (SANetworkOperation *)getViewMessagesNotifacationPage:(NSString *)page count:(NSString *)page_count user:(NSString * )user  callback:(SFCFCNetworkEngineCallback)callback;
//	5.10.1 查看片头片尾是否有更新
- (SANetworkOperation *)HeadTailWithHeader:(NSString*)HeaderStr andTail:(NSString *)TailStr callback:(SFCFCNetworkEngineCallback)callback ;
@end
