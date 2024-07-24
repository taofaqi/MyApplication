import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  build() {
    Column() {
      Row() {
        Row() {
          Image($r('app.media.back')).width(14).aspectRatio(1)
        }
        .width(24)
        .aspectRatio(1)
        .backgroundColor($r('app.color.main_color'))
        .borderRadius(12)
        .justifyContent(FlexAlign.Center)
        .margin({ left: 16 })

        Text('评论回复')
          .layoutWeight(1).textAlign(TextAlign.Center)
          .padding({ right: 40 })
      }.height(40).border({ width: 1 })

      Row() {

      }
    }
  }
}