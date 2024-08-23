// 应用状态-AppStorage
import { promptAction } from '@kit.ArkUI';

//TODO  AppStorageV2: 应用全局UI状态存储    https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-new-appstoragev2-V5
/**
 * AppStorage 是应用全局的UI状态存储，是和应用的进程绑定的，由UI框架在应用程序启动时创建，为应用程序UI状态属性提供中央存储。
 * 如果是初始化使用 AppStorage.SetOrCreate(key,value)
 * 单向 @StorageProp('user') 组件内可变
 * 双向 @StorageLink('user') 全局均可变
 */
@Entry
@Component
struct Index_AppStorage {
  bottomRectHeight: string = AppStorage.get<number>('bottomRectHeight') + 'px';
  @StorageLink('storageLinkIndex')
  storageLinkIndex: number = 0

  build() {
    RelativeContainer() {
      Column() {
        Text(`底部安全区域：  ${this.bottomRectHeight}`)
          .id('Index_AppStorageHelloWorld')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .onClick(() => {
            promptAction.showToast({ message: `${this.bottomRectHeight}` })
          })

        Divider()

        Text(`StorageLink:    +${this.storageLinkIndex}`).fontSize(50)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          }).onClick(() => {
          AppStorage.set('storageLinkIndex', 130)
        })
      }
    }
    .height('100%')
    .width('100%')
    .margin({ bottom: this.bottomRectHeight })
  }
}