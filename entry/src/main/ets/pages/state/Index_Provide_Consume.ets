// 3. 状态共享-后代组件
//@Provide 和 @Consume，应用于与后代组件的双向数据同步，应用于状态数据在多个层级之间传递的场景。

/*
*  Object、class、string、number、boolean、enum 类型均支持
*  通过相同的变量别名绑定 @Provide('key') 和 @Consume('key') key需要保持一致
*/

@Component
@Entry
struct IndexProvideConsume {
  @Provide('aaa')
  count: number = 10

  build() {
    Column({ space: 15 }) {
      Text('根组件' + this.count.toString())
        .onClick(() => {
          this.count++
        })

      Divider()

      IndexProvideParent()
    }.height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct IndexProvideParent {
  @Consume('aaa')
  count1: number

  build() {
    Column({ space: 15 }) {
      Text('父组件' + this.count1.toString())
        .onClick(() => {
          this.count1++
        })
      Divider()
      IndexProvideChild()
    }
  }
}

@Component
struct IndexProvideChild {
  @Consume('aaa')
  count2: number

  build() {
    Text('子组件' + this.count2.toString())
      .onClick(() => {
        this.count2++
      })
  }
}
