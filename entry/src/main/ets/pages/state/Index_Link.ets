class LinkUser {
  name: string = ''
  age: number = 0
}

//状态共享-父子双向
// 1）简单类型 string、number、boolean、enum
// 2）复杂类型 Object、class
@Component
@Entry
struct IndexLink {
  @State
  count: number = 10
  @State
  user: LinkUser = { name: 'jack', age: 18 }

  build() {
    Column({ space: 15 }) {
      // Text('父组件' + this.count.toString())
      //   .onClick(() => {
      //     this.count++
      //   })
      // Divider()
      // LinkChild({  count: this.count })

      Text('父组件：' + `${this.user.name} 今年 ${this.user.age} 岁`)
        .onClick(() => {
          this.user.age++
        })
      Divider()
      LinkChild({ user: this.user })

    }.height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct LinkChild {
  // @Link
  // count: number

  @Link
  user: LinkUser

  build() {
    // Text('子组件' + this.count.toString())
    //   .onClick(() => {
    //     this.count++
    //   })


    Text('子组件' + `姓名 ： ${this.user.name}` + `年龄： ${this.user.age}`)
      .onClick(() => {
        this.user.age++
      })
  }
}
