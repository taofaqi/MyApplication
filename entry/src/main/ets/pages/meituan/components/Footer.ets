@ComponentV2
export struct Footer {
  @Require @Param isShowCart: boolean

  //实现子组件向父组件要求更新@Param装饰变量的能力，开发者可以使用@Event装饰器。
  @Event changeShowCart: (isShowCart: boolean) => void;

  build() {
    Column() {
      Text('底部导航    Footer').onClick(() => {
        this.changeShowCart(!this.isShowCart)
      })
    }.height(100)

  }
}