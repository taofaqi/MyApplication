import { promptAction } from '@kit.ArkUI'
import text from '@ohos.graphics.text'

@Extend(Text)
function sameType() {
  .fontColor('red')
  .onClick(() => {
  }).stateStyles({
    normal: {
      .backgroundColor('#ccc')
    },
    pressed: { .backgroundColor('#fa0')
    },
    focused: { .backgroundColor('red')
    },
    disabled: {
      .backgroundColor('#000')
    }
  })
}

@Entry
@Component
struct Index {
  build() {
    Column() {
      //导航
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
      }.height(40).border({ width: { bottom: 0.5 }, color: '#e4e4e4' })

      //评论
      Row() {
        Image($r('app.media.avatar')).width(32).aspectRatio(1).borderRadius(16)
        Column() {
          Text('周杰伦')
            .width('100%').fontWeight(FontWeight.Bold).fontSize(15)
          Text('大理石能雕刻出肌肉和皮肤的质感，那个年代的工匠好牛啊').padding({ right: 20 }).width('100%')

          Row() {
            Text('10-21 · IP属地北京').fontSize(12).fontColor('#c3c4c5')
            Row() {
              //svg图片可以使用填充色
              Image($r('app.media.ic_public_heart')).width(20).height(20).fillColor('#c3c4c5')
              Text('100').fontSize(12).fontColor('#c3c4c5')
            }
          }.justifyContent(FlexAlign.SpaceBetween).width('100%')
        }.padding({ left: 10 }).layoutWeight(1)
      }.padding(15).alignItems(VerticalAlign.Top)
    }
  }
}