import { FoodItem } from '../models/FoodItem'
import { CalcBtn } from './CalcBtn'

@ComponentV2
export struct MenuWrapperItem {
  @Require @Param food: FoodItem

  build() {
    Row() {
      Image($r('app.media.avatar'))//图片地址不能用
        .width(90)
        .aspectRatio(1)
      Column({ space: 5 }) {
        Text(this.food.name)
          .textOverflow({
            overflow: TextOverflow.Ellipsis,
          })
          .maxLines(2)
          .fontWeight(600)
        ForEach(this.food.food_tag_list, (tag: string) => {
          Text(tag)
            .fontSize(10)
            .backgroundColor('#fff5e2')
            .fontColor('#ff8000')
            .padding({
              top: 2,
              bottom: 2,
              right: 5,
              left: 5
            })
            .borderRadius(2)
        })
        Text('点评网友推荐')
          .fontSize(10)
          .backgroundColor('#fff5e2')
          .fontColor('#ff8000')
          .padding({
            top: 2,
            bottom: 2,
            right: 5,
            left: 5
          })
          .borderRadius(2)
        Text() {
          Span('月销售' + this.food.month_saled)
          Span(' ')
          Span(this.food.like_ratio_desc)
        }
        .fontSize(12)
        .fontColor('#999')

        Row() {
          Text() {
            Span('¥ ')
              .fontColor('#ff8000')
              .fontSize(10)
            Span(this.food.price.toString())
              .fontColor('#ff8000')
              .fontWeight(FontWeight.Bold)
          }

          CalcBtn({ icon: $r('app.media.icon_minus_1'), plain: true })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10, right: 10 })
    }
    .padding(10)
    .alignItems(VerticalAlign.Top)
  }
}