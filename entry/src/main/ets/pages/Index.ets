import router from '@ohos.router'

@Entry
@Component
struct Index {
  private listTitle = ["ZhiHu", "If", "ForEach", "State", "Tab", "Prop", "Link", "Provide_Consume", "Index_Watch",
    "Index_Observed_ObjectLink", "Index_LocalStorage", "Index_AppStorage", "Index_ObservedV2_Trace", "Index_local",
    "Index_Param", "Index_Once", "Index_Event", "Index_Provider_Consumer", "Index_Monitor","http_demo_page"]
  private listRouter =
    ["pages/Index_ZhiHu", "pages/Index_If", "pages/Index_ForEach", "pages/state/Index_State_BuilderParam",
      "pages/Index_tab", "pages/state/Index_Prop", "pages/state/Index_Link", "pages/state/Index_Provide_Consume",
      "pages/state/Index_Watch", "pages/state/Index_Observed_ObjectLink", "pages/storage/Index_LocalStorage",
      "pages/storage/Index_AppStorage", "pages/statev2/Index_ObservedV2_Trace", "pages/statev2/Index_local",
      "pages/statev2/Index_Param", "pages/statev2/Index_Once", "pages/statev2/Index_Event",
      "pages/statev2/Index_Provider_Consumer", "pages/statev2/Index_Monitor","pages/http/http_demo_page",]

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
    }.backgroundColor(Color.White).margin({ top: 100, bottom: 100 })
  }
}