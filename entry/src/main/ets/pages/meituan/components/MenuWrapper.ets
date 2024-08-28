import { Category, FoodItem } from '../models/FoodItem'
import { MenuWrapperItem } from './MenuWrapperItem'

@ComponentV2
export struct MenuWrapper {
  @Local activeIndex: number = 0
  @Require @Param categoryList: Category[]

  build() {
    Row() {
      Column() {
        ForEach(this.categoryList, (item: Category, index: number) => {
          Text(item.name)
            .height(50)
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontSize(14)
            .backgroundColor(this.activeIndex === index ? '#fff' : '#f5f5f5')
            .onClick(() => {
              this.activeIndex = index
            })
        })
      }.width(90)

      //子组件必须使用 ListItem
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.categoryList[this.activeIndex]?.foods, (item: FoodItem, index: number) => {
          MenuWrapperItem({ food: item })
        })
      }
      .layoutWeight(1)
      .height('100%')
      .backgroundColor('#fff')
      .listDirection(Axis.Vertical) // 排列方向
      .edgeEffect(EdgeEffect.None)
      .nestedScroll({
        scrollForward: NestedScrollMode.PARENT_FIRST,
        scrollBackward: NestedScrollMode.SELF_FIRST
      }) // 嵌套模式
    }.layoutWeight(1)
    .alignItems(VerticalAlign.Top)
    .backgroundColor('#f5f5f5')
  }
}