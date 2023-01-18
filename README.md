# restaurant-tablet-v3

### app 初始化流程

```
1. 打开 app initialRoute  => landingpage
2. 判断是否有 token ?
    a. 有 token => 判断是否有 brandId、locationId
        1. brandId、locationId 均存在，叫 profile api 成功后进入 Orders 页面
        2. 若有一项不存在 => brandList 页面
    b. 没有 token => login  => brandList 页面
3. 进入 brandList 页面，选择 brand 请求 location 列表
4. 点击 location 叫 profile api 成功后进入 Orders 页面
```

### 工具
- jsonTodart https://app.quicktype.io/