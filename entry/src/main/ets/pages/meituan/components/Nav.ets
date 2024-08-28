@ComponentV2
export struct Nav {
  @Builder
  NavItemBuilder(active: boolean, title: string, subTitle?: string) {
    Column() {
      Text() {
        Span(title).fontColor(active ? '#000' : '#666').fontWeight(active ? 600 : 300)
        if (subTitle) {
          Span(subTitle).fontColor(active ? '#666' : '#999').fontSize(12)
        }
      }

      Text()
        .height(1)
        .width(20)
        .margin({ left: 6 })
        .backgroundColor(active ? '#fa0' : 'transparent')
    }.alignItems(HorizontalAlign.Start).width(72)
  }

  build() {
    Row() {
      this.NavItemBuilder(true, '点菜')
      this.NavItemBuilder(false, '评价', '1796')
      this.NavItemBuilder(false, '商家')

      Row() {
        Image($r('app.media.ic_public_input_search'))
          .width(14)
          .aspectRatio(1)
          .fillColor('#999')

        Text('请输入菜品名称')
          .fontSize(12)
          .fontColor('#999')
      }.backgroundColor('#eee')
      .height(25)
      .borderRadius(13)
      .padding({ left: 5, right: 5 })
      .layoutWeight(1)

    }.padding({ left: 15, right: 15 })
    .height(40)
    .border({ width: { bottom: 0.5 }, color: '#e4e4e4' })
  }
}