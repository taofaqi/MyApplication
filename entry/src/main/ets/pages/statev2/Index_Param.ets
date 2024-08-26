//TODO    @Param：组件外部输入      https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-new-param-V5
//
// @Entry
// @Component
// struct Index_Param {
//   @State message: string = 'Hello World';
//
//   build() {
//     RelativeContainer() {
//       Text(this.message)
//         .id('Index_ParamHelloWorld')
//         .fontSize(50)
//         .fontWeight(FontWeight.Bold)
//         .alignRules({
//           center: { anchor: '__container__', align: VerticalAlign.Center },
//           middle: { anchor: '__container__', align: HorizontalAlign.Center }
//         })
//     }
//     .height('100%')
//     .width('100%')
//   }
// }


// @Entry
// @ComponentV2
// struct Index_Param {
//   @Local count: number = 0;
//   @Local message: string = "Hello";
//   @Local flag: boolean = false;
//
//   build() {
//     Column({ space: 22 }) {
//       Button("change_local")
//         .onClick(() => {
//           // 对数据源的更改会同步给子组件
//           this.count++;
//           this.message += " World";
//           this.flag = !this.flag;
//         })
//       Divider()
//       Text(`Local ${this.count}`)
//       Text(`Local ${this.message}`)
//       Text(`Local ${this.flag}`)
//
//       Divider()
//       ParamChild({
//         count: this.count,
//         message: this.message,
//         flag: this.flag
//       })
//
//     }.margin({ top: 100 })
//   }
// }
//
// @ComponentV2
// struct ParamChild {
//   @Require @Param count: number
//   @Require @Param message: string
//   @Require @Param flag: boolean
//
//   build() {
//     Column() {
//       Text(`Param ${this.count}`)
//       Text(`Param ${this.message}`)
//       Text(`Param ${this.flag}`)
//     }
//   }
// }


// @ObservedV2
// class Region {
//   @Trace x: number;
//   @Trace y: number;
//
//   constructor(x: number, y: number) {
//     this.x = x;
//     this.y = y;
//   }
// }
//
// @ObservedV2
// class Info {
//   @Trace name: string;
//   @Trace region: Region;
//
//   constructor(name: string, x: number, y: number) {
//     this.region = new Region(x, y);
//     this.name = name;
//   }
// }
//
// @Entry
// @ComponentV2
// struct Index_Param {
//   @Local infoArr: Info[] = [new Info("Ocean", 28, 120), new Info("Mountain", 26, 20)];
//   @Local originInfo: Info = new Info("Origin", 0, 0);
//
//   build() {
//     Column({ space: 12 }) {
//       ForEach(this.infoArr, (info: Info) => {
//         Row() {
//           Text(`name: ${info.name}`)
//           Text(`region: ${info.region.x}-${info.region.y}`)
//         }
//       })
//       Row() {
//         Text(`Origin name: ${this.originInfo.name}`)
//         Text(`Origin region: ${this.originInfo.region.x}-${this.originInfo.region.y}`)
//       }
//
//       Button("change infoArr item")
//         .onClick(() => {
//           // 由于属性name被@Trace装饰，所以能够观察到
//           this.infoArr[0].name = "Win";
//         })
//       Button("change originInfo")
//         .onClick(() => {
//           // 由于变量originInfo被@Local装饰，所以能够观察到
//           if (this.originInfo.region.x == 100) {
//             this.originInfo = new Info("Origin", 50, 50);
//           } else {
//             this.originInfo = new Info("Origin", 100, 100);
//           }
//         })
//       Button("change originInfo region")
//         .onClick(() => {
//           // 由于属性x、y被@Trace装饰，所以能够观察到
//           this.originInfo.region.x = 25;
//           this.originInfo.region.y = 25;
//         })
//       Divider()
//       ChildParam({ infoArr: this.infoArr, originInfo: this.originInfo })
//     }.margin({ top: 100 })
//   }
// }
//
// @ComponentV2
// struct ChildParam {
//   @Require @Param infoArr: Info[] = [];
//   @Require @Param originInfo: Info = new Info("O", 0, 0);
//
//   build() {
//     Column() {
//       ForEach(this.infoArr, (info: Info) => {
//         Row() {
//           Text(`name: ${info.name}`)
//           Text(`region: ${info.region.x}-${info.region.y}`)
//         }
//       })
//       Row() {
//         Text(`Origin name: ${this.originInfo.name}`)
//         Text(`Origin region: ${this.originInfo.region.x}-${this.originInfo.region.y}`)
//       }
//     }
//   }
// }


@ObservedV2
class Region {
  @Trace x: number;
  @Trace y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

@ObservedV2
class Info {
  @Trace name: string;
  @Trace age: number;
  @Trace region: Region;

  constructor(name: string, age: number, x: number, y: number) {
    this.name = name;
    this.age = age;
    this.region = new Region(x, y);
  }
}

@Entry
@ComponentV2
struct Index_Param {
  @Local infoList: Info[] = [new Info("Alice", 8, 0, 0), new Info("Barry", 10, 1, 20), new Info("Cindy", 18, 24, 40)];

  build() {
    Column({ space: 13 }) {
      ForEach(this.infoList, (info: Info) => {
        MiddleComponent({ info: info })
      })

      Divider()

      Button("change")
        .onClick(() => {
          this.infoList[0] = new Info("Atom", 40, 27, 90);
          this.infoList[1].name = "Bob";
          this.infoList[2].region = new Region(7, 9);
        })
    }.margin({ top: 100 })
  }
}

@ComponentV2
struct MiddleComponent {
  @Require @Param info: Info;

  build() {
    Column() {
      Text(`name: ${this.info.name}`)
      Text(`age: ${this.info.age}`)
      SubComponent({ region: this.info.region })
    }
  }
}

@ComponentV2
struct SubComponent {
  @Require @Param region: Region;

  build() {
    Column() {
      Text(`region: ${this.region.x}-${this.region.y}`)
    }
  }
}