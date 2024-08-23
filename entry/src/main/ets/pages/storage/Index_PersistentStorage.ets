//PersistentStorage：持久化存储UI状态
//TODO   https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-persiststorage-V5
/**
 * PersistentStorage 将选定的 AppStorage 属性保留在设备磁盘上。
 * 支持：number, string, boolean, enum 等简单类型;
 * 如果：要支持对象类型，可以转换成json字符串
 * 持久化变量最好是小于2kb的数据，如果开发者需要存储大量的数据，建议使用数据库api。
 */

@Entry
@Component
struct Index_PersistentStorage {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('Index_PersistentStorageHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}