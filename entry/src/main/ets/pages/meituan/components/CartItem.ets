import { CalcBtn } from './CalcBtn'

@ComponentV2
export struct CartItem {
  build() {
    Row() {
      Image($r('app.media.avatar'))
        .width(60)
        .aspectRatio(1)
      Column({ space: 10 }) {
        Text('小份酸汤莜面鱼鱼+肉夹馍套餐')
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .maxLines(2)
        Row() {
          Text() {
            Span('¥ ')
              .fontSize(10)
              .fontColor('#ff8000')
            Span('23.23')
              .fontWeight(600)
              .fontColor('#ff8000')
          }
        }

        Row({ space: 10 }) {
          CalcBtn({ icon: $r('app.media.icon_minus_1'), plain: true })
          Text('0')
            .fontSize(14)
          CalcBtn({ icon: $r('app.media.icon_add_1'), plain: false })
        }
      }.layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10 })
    }.padding({ top: 15, bottom: 15 })
    .alignItems(VerticalAlign.Top)
  }
}