import { promptAction } from '@kit.ArkUI'

/**
 *  如果开发者需要关注某个状态变量的值是否改变，可以使用 @Watch 为状态变量设置回调函数。
 * @State、@Prop、@Link 等装饰器在 @Watch 装饰之前
 */
@Entry
@Component
struct IndexWatch {
  @State
  activeIndex: number = 0

  onChange(index: number) {
    this.activeIndex = index
    promptAction.showToast({ message: '点击', })
  }

  build() {
    Navigation() {
      WatchChild({ activeIndex: this.activeIndex })
    }.titleMode(NavigationTitleMode.Full)
    .toolbarConfiguration([// 底部导航栏
      {
        value: '首页',
        icon: $r("app.media.ic_bidding_hall_normal_new"),
        action: () => this.onChange(0)
      },
      {
        value: '我的',
        icon: $r("app.media.personal_center_normal_new"),
        action: () => this.onChange(1)
      },
    ])
  }
}

@Component
struct WatchChild {
  @Prop
  @Watch('onActiveIndex')
  activeIndex: number = 100   //初始化的值不会被应用

  onActiveIndex() {
    promptAction.showToast({ message: '监听变化' })
  }

  build() {
    Column() {
      Text('Child:   ' + this.activeIndex)
    }
  }
}
