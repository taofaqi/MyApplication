// TODO   @Once：初始化同步一次     https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-new-once-V5

@ObservedV2
class InfoOnce {
  @Trace name: string;

  constructor(name: string) {
    this.name = name;
  }
}

@ComponentV2
struct ChildOnce {
  // @Param @Once相当于使用@Local
  @Param @Once onceParamNum: number = 0;
  @Param @Once @Require onceParamInfo: InfoOnce;

  build() {
    Column() {
      Text(`Child onceParamNum: ${this.onceParamNum}`)
      Text(`Child onceParamInfo: ${this.onceParamInfo.name}`)
      Button("changeOnceParamNum")
        .onClick(() => {
          this.onceParamNum++;
        })
      Button("changeParamInfo")
        .onClick(() => {
          this.onceParamInfo = new InfoOnce("Cindy");
        })
    }
  }
}

@Entry
@ComponentV2
struct Index_Once {
  @Local localNum: number = 10;
  @Local localInfo: InfoOnce = new InfoOnce("Tom");

  build() {
    Column({ space: 12 }) {
      Text(`Parent localNum: ${this.localNum}`)
      Text(`Parent localInfo: ${this.localInfo.name}`)
      Button("changeLocalNum")
        .onClick(() => {
          this.localNum++;
        })
      Button("changeLocalInfo")
        .onClick(() => {
          this.localInfo = new InfoOnce("Cindy");
        })
      ChildOnce({
        onceParamNum: this.localNum,
        onceParamInfo: this.localInfo
      })
    }.margin({ top: 100 })
  }
}