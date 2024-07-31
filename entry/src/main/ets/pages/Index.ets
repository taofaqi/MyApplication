import router from '@ohos.router'

@Entry
@Component
struct Index {
  private listTitle = ["ZhiHu", "If", "ForEach", "State"]
  private listRouter = ["pages/Index_ZhiHu", "pages/Index_If", "pages/Index_ForEach", "pages/Index_State"]

  build() {
    Column() {
      List() {
        ForEach(this.listTitle, (item: string) => {
          ListItem() {
            Button(item, { type: ButtonType.Normal, stateEffect: true })
              .borderRadius(10)
              .backgroundColor(0xff31abff)
              .width('70%')
              .height(30)
              .align(Alignment.Center)
              .onClick(() => {
                router.pushUrl({
                  url: this.listRouter[this.listTitle.indexOf(item)], params: {
                    data1: 'message'
                  }
                })
              })
          }.width('100%')
          .height(40)
        })
      }.alignListItem(ListItemAlign.Start)
    }.backgroundColor(Color.White)
  }
}