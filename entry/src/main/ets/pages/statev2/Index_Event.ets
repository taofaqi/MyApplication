//TODO:Event装饰器：组件输出      https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-new-event-V5

/**
 * 使用@Event修改父组件的值是立刻生效的，但从父组件将变化同步回子组件的过程是异步的，
 * 即在调用完@Event的方法后，子组件内的值不会立刻变化。
 * 这是因为@Event将子组件值实际的变化能力交由父组件处理，
 * 在父组件实际决定如何处理后，将最终值在渲染之前同步回子组件。
 */
@Entry
@ComponentV2
struct Index_Event {
  @Local title: string = "Titile One";
  @Local fontColor: Color = Color.Red;

  build() {
    Column() {
      ChildEvent({
        title: this.title,
        fontColor: this.fontColor,
        changeFactory: (type: number) => {
          if (type == 1) {
            this.title = "Title One";
            this.fontColor = Color.Red;
          } else if (type == 2) {
            this.title = "Title Two";
            this.fontColor = Color.Green;
          }
          console.log(`in changeIndex ${this.title}`);
        }
      })
    }
  }
}

@ComponentV2
struct ChildEvent {
  @Param title: string = '';
  @Param fontColor: Color = Color.Black;
  @Event changeFactory: (x: number) => void = (x: number) => {
  };

  build() {
    Column({ space: 12 }) {
      Text(`${this.title}`)
      Button("change to Title Two")
        .onClick(() => {
          this.changeFactory(2);
          console.log(`after changeIndex ${this.title}`);
        })
      Button("change to Title One")
        .onClick(() => {
          this.changeFactory(1);
          console.log(`after changeIndex ${this.title}`);
        })
    }.margin({ top: 100 })
  }
}