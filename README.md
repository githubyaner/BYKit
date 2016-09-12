# BYKit
BYKit 1.1
BYKit 是一个方便编码的工具.里面针对一些控件进行了封装 ,例如BYBaseViewController,BYBaseModel等等.同时也集成了一些常用的第三方在内,例如AFNetworking,SDWebImage等,方便使用.您也可以将它整理成framework.方便调用里面的方法.
    1.1版本 更新了几个工具类,并且删除了一些非必要的第三方.
注意:因为项目中使用了一些第三方的分类.使用方式为framework的时候,需要对您的项目进行配置.方法:TARGETS->Build Settings->Other Linker Flags:-objc,-all_load.此外使用framework的时候,一些分类将无法使用.
