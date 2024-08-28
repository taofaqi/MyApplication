@ComponentV2
export struct CalcBtn {
  //图片
  @Require @Param icon: Resource
  //是否灰色（不可点击）
  @Require @Param plain: boolean


  build() {
    Row() {
      Image(this.icon)
        .width(10)
        .aspectRatio(1)
    }
    .width(16)
    .aspectRatio(1)
    .backgroundColor(this.plain ? '#fff' : '#f8c74e')
    .border(this.plain ? { width: 0.5, color: '#f8c74e' } : {})
    .borderRadius(4)
    .justifyContent(FlexAlign.Center)
  }
}