@ComponentV2
@Preview
export struct Footer {
  @Require @Param isShowCart: boolean
  //实现子组件向父组件要求更新@Param装饰变量的能力，开发者可以使用@Event装饰器。
  @Event changeShowCart: (isShowCart: boolean) => void;

  build() {
    Row() {
      Row() {
        Badge({ value: '0', position: BadgePosition.Right, style: { badgeSize: 18 } }) {
          Image($r('app.media.b0q')).width(47).height(69).position({ y: -19 })
        }.margin({ left: 20 })
        .onClick(() => {
          //显示隐藏购物车列表
          this.changeShowCart(!this.isShowCart)
        })

        Column() {
          Text() {
            Span('¥')
              .fontColor('#fff')
              .fontSize(12)
            Span('0.00')
              .fontColor('#fff')
              .fontSize(24)
          }

          Text('预估另需配送费 ¥5')
            .fontSize(12)
            .fontColor('#999')
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 15 })

        Text('去结算')
          .backgroundColor('#f8c74e')
          .alignSelf(ItemAlign.Stretch)
          .padding(15)
          .borderRadius({
            topRight: 25,
            bottomRight: 25
          })

      }.height(50)
      .width('100%')
      .backgroundColor($r('app.color.color_22')).borderRadius(25)
    }.height(80).width('100%').padding(15)

  }
}