interface Params { title: string; }

//当子组件使用一个 @BuilderParam 的时候，使用组件的时候在尾随 {} 插入UI结构
// 当子组件使用多个 @BuilderParam 的时候，使用组件的时候 Comp({ xxx: this.builderFn }) 传入
// 子组件本身可以提供一个默认的 @Builder 函数作为 @BuilderParam 备用函数，当做备用内容使用

@Component
struct PanelComp {
  title?: string
  more?: string
  // 尾随闭包初始化组件
  // 组件内有且仅有一个使用 @BuilderParam 装饰的属性

  @BuilderParam
  panelContent: () => void = this.DefaultPanelContent
  // 参数初始化组件
  // 组件内有多个使用 @BuilderParam 装饰器属性
  @BuilderParam
  panelFooter: () => void

  // 备用 Builder
  @Builder
  DefaultPanelContent() {
    Text('默认内容')
  }

  build() {
    Column() {
      Row() {
        Text(this.title)
          .layoutWeight(1)
          .fontWeight(600)
        Row() {
          Text(this.more)
            .fontSize(14)
            .fontColor('#666666')
          Image($r('app.media.arrow'))
            .width(16)
            .fillColor('#666666')
        }
      }
      .padding(10)

      Row() {
        this.panelContent()
      }
      .height(100)

      Row() {
        this.panelFooter()
      }.height(50)
    }
    .borderRadius(12)
    .backgroundColor('#fff')
  }
}

@Preview
@Entry
@Component
struct IndexState {
  //构建函数-@Builder#
  // ArkUI还提供了一种更轻量的UI元素复用机制 @Builder，可以将重复使用的UI元素抽象成一个方法，在 build 方法里调用。

  //1.按值传递（场景：构建不同的UI）
  //2.引用传递（场景：当传递的数据更新，需要更新UI）
  @Builder
  MoreBuilder(params: Params = { title: '' }) {
    Row() {
      Text(params.title)
        .fontSize(14)
        .fontColor('#666')
      Image($r('app.media.arrow'))
        .width(14)
        .aspectRatio(1)
        .fillColor('#999')
    }
  }

  @State
  rate: number = 0 //好评率

  @Builder
  CommentContentBuilder() {
    Text('评价内容')
  }

  @Builder
  CommentFooterBuilder() {
    Text('评价底部')
  }

  build() {
    Column({ space: 15 }) {
      Button('获取数据')
        .margin({ bottom: 15 })
        .onClick(() => {
          this.rate = 98
        })

      GridRow({ columns: 2, gutter: 15 }) {
        GridCol({ span: 2 }) {
          PanelComp({
            title: '评价（2000+）',
            more: `好评率  ${this.rate} %`,
            panelContent: this.CommentContentBuilder,
            panelFooter: this.CommentFooterBuilder
          })
        }

        // GridCol() {
        //   PanelComp({ title: '推荐', more: '查看全部' }) {
        //     //尾随闭包
        //     Text('推荐内容')
        //   }
        // }
        //
        // GridCol() {
        //   PanelComp({ title: '体验', more: '4 条测评' }) {
        //     //尾随闭包
        //     Text('体验内容')
        //   }
        // }

      }
    }.height('100%')
    .width('100%')
    .padding(8)
    .backgroundColor('#CCCCCC')
  }
}