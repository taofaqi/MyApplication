import { CartItem } from './CartItem'
import { promptAction } from '@kit.ArkUI'
/**
 * 1.加入购物车
 * 2.购物车中移除
 * 3.清空购物车
 */

@ComponentV2
export struct Cart {
  build() {
    Column() {
      Column() {
        Row() {
          Text('购物车')
            .fontSize(14)
          Text('清空购物车')
            .fontSize(14)
            .fontColor('#999').onClick(() => {
            promptAction.showToast({ message: '清空购物车' })
          })
        }
        .width('100%')
        .height(40)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({ left: 15, right: 15 })
        .border({ width: { bottom: 0.5 }, color: '#e4e4e4' })


        // 购物车列表
        List() {
          ListItem() {
            CartItem()
          }

          ListItem() {
            CartItem()
          }

          ListItem() {
            CartItem()
          }
        }
        .divider({
          strokeWidth: 0.5,
          color: '#e4e4e4'
        })
        .padding({ left: 15, right: 15 })

      }.width('100%')
      .padding({ bottom: 100 })
      .backgroundColor('#fff')
      .borderRadius({
        topLeft: 16,
        topRight: 16
      })
    }.height('100%')
    .width('100%')
    .backgroundColor('rgba(0,0,0,0.5)')
    .justifyContent(FlexAlign.End)
  }
}