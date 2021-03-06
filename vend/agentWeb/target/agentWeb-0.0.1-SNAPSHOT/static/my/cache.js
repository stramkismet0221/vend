var cache = function(){};

//定义静态方法
cache.data={
    1:{
        0 : "未使用",
        1 : "已使用"
    },
    2:{
        "1":"消费成功",
        "2":"异常订单",
        "3":"未支付",
        "4": "未完成"
    },
    3:{
        0 : "高电平",
        1 : "代电平"
    },
    4:{
        0 : "可退",
        1 : "不可退"
    },
    5:{
        1 : "微信",
        2 : "支付宝",
        3 : "积分",
        4 : "门票",
        5 : "年票",
        6 : "金币",
        7 : "彩票"
    },
    6:{
        1 : "在线",
        2 : "离线"
    },
    7:{
        1 : "泡沫充足",
        2 : "泡沫不足"
    },
    8:{
        1 : "开启",
        2 : "停用"
    },
    9:{
        0 : "未审核",
        1 : "审核通过",
        2 : "禁用"
    },
    10:{
        0 : "未使用",
        1 : "已使用"
    },
    11:{
        "1":"消费",
        "2":"充值",
        "3":"退款"
    },
    12:{
        1 : "进货",
        2 : "出货"
    },
    13:{
        1 : "金币",
        2 : "金币彩票",
        3 : "金币积分",
        4 : "彩票",
        5 : "积分",
        6 : "年票",
        7 : "门票"
    },
    14:{
        0 : "待审核",
        1 : "不通过",
        2 : "已完成"
    },
    15:{
        1 : "上架",
        2 : "下架"
    },
    16:{
        1 : "充足",
        2 : "缺货"
    }
};

/**
 * 获取缓存
 * @param type
 */
cache.get = function(type){
    return cache.data[type];
}

/**
 * 获取缓存明细值
 * @param type
 * @param cacheVal
 * @returns
 */
cache.getName = function(type,cacheVal){
    try {
        return cache.data[type][cacheVal];
    } catch (e) {
        return "--";
    }
}