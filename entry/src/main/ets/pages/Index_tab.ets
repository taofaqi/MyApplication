import { it } from '@ohos/hypium'

class TabBarItem {
  defaultIcon: Resource = $r('app.media.home_page_normal_new')
  activeIcon: Resource = $r('app.media.home_page_select_new')
  label: string = ""
}


@Preview
@Entry
@Component
struct IndexTab {
  ///
  tabList: TabBarItem[] = [
    {
      defaultIcon: $r('app.media.home_page_normal_new'),
      activeIcon: $r('app.media.home_page_select_new'),
      label: '首页'
    },
    {
      defaultIcon: $r('app.media.ic_bidding_hall_normal_new'),
      activeIcon: $r('app.media.ic_bidding_hall_select_new'),
      label: '项目'
    },
    {
      defaultIcon: $r('app.media.my_price_normal_new'),
      activeIcon: $r('app.media.my_price_select_new'),
      label: '面经'
    },
    {
      defaultIcon: $r('app.media.personal_center_normal_new'),
      activeIcon: $r('app.media.personal_center_select_new'),
      label: '我的'
    }
  ]

  @State
  activeIndex: number = 0  //定义当前选中的index

  //自定义构建函数
  @Builder
  TabBarBuilder(item: TabBarItem, index: number) {
    Column() {
      Image(this.activeIndex === index ? item.activeIcon : item.defaultIcon)
        .width(24)
        .aspectRatio(1)
      Text(item.label)
        .fontSize(12)
    }
  }

  build() {
    Column() {
      Tabs({ index: this.activeIndex }) {
        ForEach(this.tabList, (item: TabBarItem, index: number) => {
          TabContent() {
            Text(index.toString())
          }.tabBar(this.TabBarBuilder(item, index))
        })
      }.barPosition(BarPosition.End)
      .onChange(index => {
        this.activeIndex = index
      })
    }.height('100%')
  }
}