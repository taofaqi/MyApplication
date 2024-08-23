@Component
@Entry
struct IndexProp {
  @State
  count: number = 10

  build() {
    Column({ space: 15 }) {
      Text(this.count.toString())
        .onClick(() => {
          this.count++
        })
      Divider()
      Child({ count: this.count })
    }.height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct Child {
  // @State     //各定义各的
  // count: number = 0
  /**
   * @Prop 装饰的变量可以和父组件建立单向的同步关系。@Prop 装饰的变量是可变的，但是变化不会同步回其父组件。
   *
   * 支持类型 string、number、boolean、enum 类型
   * 子组件可修改 Prop 数据值，但不同步到父组件，父组件更新后覆盖子组件 Prop 数据
   * 子组件可以初始化默认值
   */
  @Prop
  count: number = 0
  build() {
    Text(this.count.toString())
      .onClick(() => {
        this.count++
      })
  }
}
