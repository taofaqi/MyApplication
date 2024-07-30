class User {
  id?: string
  name?: string
  age?: number
}

// ForEach(
//   // 数据源
//   arr: Array,
// // 组件生成函数
// itemGenerator: (item: Array, index?: number) => void,
// // 键值生成函数
// keyGenerator?: (item: Array, index?: number): string => string
// )

@Entry
@Component
  // ForEach 接口基于数组类型数据来进行循环渲染，需要与容器组件配合使用。
struct IndexForEach {
  @State
  userList: User[] = []

  build() {
    Scroll() {
      Column({ space: 20 }) {
        ForEach(
          this.userList,
          (item: User, index: number) => {
            Text(`${item.name} 今年 ${item.age} 岁`)
          }, (item: User) => item.id?.toString()
        )
        Button('加载更多')
          .onClick(() => {
            const arr: User[] = []
            for (let index = 0; index < 10; index++) {
              arr.push({ id: Math.random().toString(), name: 'jack', age: Math.ceil(Math.random() * 100) })
            }
            this.userList.push(...arr)
          })
      }.width('100%').justifyContent(FlexAlign.Center)
    }
  }
}
