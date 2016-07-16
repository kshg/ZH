#import "DetailViewController.h"

#import "DetailStepTableViewCell.h"
#import "DetailContentTableViewCell.h"

@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation DetailViewController
- (NSMutableArray *)dataArr{
	if (!_dataArr) {
		_dataArr=[NSMutableArray array];
	}
	return _dataArr;
}

/**StroyBoard生成Masonry简介*/
- (void)StroyBoard_Masonry{
    NSArray *details=@[@"将 StroyBoard 放在您的MAC电脑的桌面上",
                       @"返回模拟器,就会看到您刚刚放的文件",
                       @"点击右边的生成代码到桌面",
                       @"桌面上会生成一个以当前时间命名的文件夹,里面就是您要的代码",
                       @"如果找不到Main.StroyBoard,可以使用该工程文件的Main.StroyBoard测试"
                       ];
    
    [self addData:details];
}

/**Xib生成Masonry简介*/
- (void)Xib_Masonry{
    NSArray *details=@[@"将 Xib 文件放在您的MAC电脑的桌面上",
                       @"返回模拟器,就会看到您刚刚放的文件",
                       @"点击右边的生成代码到桌面",
                       @"桌面上会生成一个以当前时间命名的文件夹,里面就是您要的代码",
                       @"如果您的Xib文件里面有ViewController,或者说你的Xib内容复杂(相当于几个xib文件合成一个,用下标取其对应对象),那么还会生成新的对应的文件夹,里面存放的是对应的代码"
                       ];
    
    [self addData:details];
}

/**快速生成代码简介*/
- (void)QuickCreatCode{
    NSArray *details=@[@"我们基本上每一个界面都会有tableView或者collectionView",
                       @"我们添加它们时都发现很有规律,很无聊,尤其是写代理方法",
                       @"这个快速生成代码是你只需要填写少部分信息,就能根据你的这些信息帮你生成重复代码",
                       @"其实最麻烦的就是 代码助手.m文件里的格式怎么填,注意,这个文件的数据格式是Json,所以请不要打乱格式",
                       @"示例1:简单tableView",
                       @"{\n\
                       \"最大文件夹名字\":\"CocoaChina(随便给)\",\n\
                       \"ViewController的名字\":\"Set\",\n\
                       \"自定义Cell,以逗号隔开\":\"Set1,Set2,Set3\",\n\
                       \"是否需要对应的Model 1:0 (不填写么默认为否)\":\"1\",\n\
                       \"是否需要对应的StroyBoard 1:0 (不填写么默认为否)\":\"1\",\n\
                       \"自定义cell可编辑(删除) 1:0 (不填写么默认为否)\":\"1\"\n\
                       }",
                       @"简单collectionView",
                       @"{\n\
                       \"最大文件夹名字\":\"GitHub(随便给)\",\n\
                       \"ViewController的名字\":\"Chat\",\n\
                       \"自定义Cell,以逗号隔开\":\"ChatMeText,ChatOtherText,ChatMeImage,ChatOtherImage\",\n\
                       \"是否需要对应的Model 1:0 (不填写么默认为否)\":\"1\",\n\
                       \"是否需要对应的StroyBoard 1:0 (不填写么默认为否)\":\"1\"\n\
                       }",
                       @"tableView嵌套tableView或者collectionView",
                       @"{\n\
                       \"最大文件夹名字\":\"Code4App(随便给)\",\n\
                       \"ViewController的名字\":\"Code\",\n\
                       \"自定义Cell,以逗号隔开\":\"Code1,Code2,Code3,Code4,Code5\",\n\
                       \"自定义Cell标识符:(无:0 TableView:1(子cell以;隔开) ColloectionView:2(子cell以;隔开)),以逗号隔开\":\"0,1(Code2_1;Code2_2),2(Code3_1;Code3_2;Code3_3),2(Code4_1;Code4_2;Code4_3),0\",\n\
                       \"例如cell有A,B  那么嵌套这一行为:1(A1;A2),2(B1;B2)\":\"<#请填写#>\",\n\
                       \"是否需要对应的Model 1:0 (不填写么默认为否)\":\"1\",\n\
                       \"是否需要对应的StroyBoard 1:0 (不填写么默认为否)\":\"1\",\n\
                       \"自定义cell可编辑(删除) 1:0 (不填写么默认为否)\":\"1\"\n\
                       }\n\n注意这个格式稍微复杂,要注意,有以逗号\",\"分隔的,有以分号\";\"分隔的",
                       @"最后有一点,就是因为电脑的复制粘贴板和模拟器的复制粘贴板不是同一个,所以无法支持跨模拟器复制粘贴,所以才用 代码助手.m这个文件来输入数据源"
                       ];
    
    [self addData:details];
}

/**JSON转模型简介*/
- (void)Json_To_Model{
    NSArray *details=@[@"我们在网上看到很多JSON转模型的,包括很多插件,不过它们很多都是要么没有支持点语法,要么就是.m文件里还是需要我们自己去写某些第三方重写方法",
                       @"我这个是结合了这两个问题做的JSON转模型",
                       @"数据来源有3个,url,json字符串,plist文件",
                       @"url注意点,post的url本身是不带 \"?\",但是填写的时候要把参数写成和get一样的url格式,程序会把 \"?\" 后面的参数变成字典参数的",
                       @"如果有些url需要带额外头,那么建议使用json字符串,因为你只需要拿到json字符串就行了",
                       @"测试示例 url:  http://seecsee.com/index/getRecommendAndroid",
                       @"最后有一点,就是因为电脑的复制粘贴板和模拟器的复制粘贴板不是同一个,所以无法支持跨模拟器复制粘贴,所以才用 \"代码助手.m\" 这个文件来输入数据源"
                       ];
    
    [self addData:details];
}

/**获取指定长度的文字(数字,字母随机)*/
- (NSString *)getRandomStringWithLenth:(NSInteger)len{
    NSMutableString *strM=[NSMutableString string];
    NSInteger sj;
    unichar ch=0;
    while (strM.length<len) {
        sj=arc4random()%3+1;
        if (sj==1) {
            ch=arc4random()%26+'a';
        }else if (sj==2){
            ch=arc4random()%26+'A';
        }else if (sj==3){
            ch=arc4random()%10+'0';
        }
        [strM appendFormat:@"%C",ch];
    }
    return strM;
}

- (void)addData:(NSArray *)details{
    for (NSInteger i=0; i<details.count; i++) {
        DetailStepCellModel *DetailStepModel=[DetailStepCellModel new];
        DetailStepModel.title=[NSString stringWithFormat:@"第 %ld 步",i+1];
        [self.dataArr addObject:DetailStepModel];
        
        DetailContentCellModel *DetailContentModel=[DetailContentCellModel new];
        DetailContentModel.width=self.view.frame.size.width-32-16;
        DetailContentModel.title=details[i];
        [self.dataArr addObject:DetailContentModel];
    }
}

- (void)loadData{
    if ([_helpString isEqualToString:@"Xib生成Masonry简介"]) {
        [self Xib_Masonry];
    }else if ([_helpString isEqualToString:@"StroyBoard生成Masonry简介"]){
        [self StroyBoard_Masonry];
    }else if ([_helpString isEqualToString:@"快速生成代码简介"]){
        [self QuickCreatCode];
    }else if ([_helpString isEqualToString:@"JSON转模型简介"]){
        [self Json_To_Model];
    }
}

- (void)viewDidLoad{
	[super viewDidLoad];
	self.tableView.delegate=self;
	self.tableView.dataSource=self;
    
    self.tableView.tableFooterView=[UIView new];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
	self.edgesForExtendedLayout=UIRectEdgeNone;

    [self loadData];
}

#pragma mark - 必须实现的方法:
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	id modelObjct=self.dataArr[indexPath.row];
	if ([modelObjct isKindOfClass:[DetailStepCellModel class]]){
		DetailStepTableViewCell *DetailStepCell=[tableView dequeueReusableCellWithIdentifier:@"DetailStepTableViewCell"];
		DetailStepCellModel *model=modelObjct;
		[DetailStepCell refreshUI:model];
		return DetailStepCell;
	}
	if ([modelObjct isKindOfClass:[DetailContentCellModel class]]){
		DetailContentTableViewCell *DetailContentCell=[tableView dequeueReusableCellWithIdentifier:@"DetailContentTableViewCell"];
		DetailContentCellModel *model=modelObjct;
		[DetailContentCell refreshUI:model];
		return DetailContentCell;
	}
	//随便给一个cell
	UITableViewCell *cell=[UITableViewCell new];
	return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id modelObjct=self.dataArr[indexPath.row];
    if ([modelObjct isKindOfClass:[DetailStepCellModel class]]){
        return 28.0f;
    }
    if ([modelObjct isKindOfClass:[DetailContentCellModel class]]){
        DetailContentCellModel *model=modelObjct;
        return model.size.height+30+20;
    }
	return 44.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	NSLog(@"选择了某一行");
}


@end
