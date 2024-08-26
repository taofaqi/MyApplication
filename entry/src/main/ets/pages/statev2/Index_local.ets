//TODO   @Local装饰器：组件内部状态    https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-new-local-V5#%E6%A6%82%E8%BF%B0

// @Entry
// @ComponentV2
// struct Index_local {
//   @Local count: number = 0;
//   @Local message: string = "Hello";
//   @Local flag: boolean = false;
//
//   build() {
//     Column() {
//       Text(`${this.count}`)
//       Text(`${this.message}`)
//       Text(`${this.flag}`)
//       Button("change Local")
//         .onClick(() => {
//           // 当@Local装饰简单类型时，能够观测到对变量的赋值
//           this.count++;
//           this.message += " World";
//           this.flag = !this.flag;
//         })
//     }.margin({ top: 100 })
//   }
// }


// class RawObject {
//   name: string;
//   constructor(name: string) {
//     this.name = name;
//   }
// }
// @ObservedV2
// class ObservedObject {
//   @Trace name: string;
//   constructor(name: string) {
//     this.name = name;
//   }
// }
// @Entry
// @ComponentV2
// struct Index_local {
//   @Local rawObject: RawObject = new RawObject("rawObject");
//   @Local observedObject: ObservedObject = new ObservedObject("observedObject");
//   build() {
//     Column() {
//       Text(`${this.rawObject.name}`)
//       Text(`${this.observedObject.name}`)
//       Button("change object")
//         .onClick(() => {
//           // 对类对象整体的修改均能观察到
//           this.rawObject = new RawObject("new rawObject");
//           this.observedObject = new ObservedObject("new observedObject");
//         })
//       Button("change name")
//         .onClick(() => {
//           // @Local不具备观察类对象属性的能力，因此对rawObject.name的修改无法观察到
//           this.rawObject.name = "new rawObject name";
//           // 由于ObservedObject的name属性被@Trace装饰，因此对observedObject.name的修改能被观察到
//           this.observedObject.name = "new observedObject name";
//         })
//     }.margin({ top: 100 })
//   }
// }


// @ObservedV2
// class Info {
//   @Trace name: string;
//   @Trace age: number;
//
//   constructor(name: string, age: number) {
//     this.name = name;
//     this.age = age;
//   }
// }
//
// @Entry
// @ComponentV2
// struct Index_local {
//   info1: Info = new Info("Tom", 25);
//   @Local info2: Info = new Info("Tom", 25);
//
//   build() {
//     Column() {
//       Text(`info1: ${this.info1.name}-${this.info1.age}`) // Text1
//       Text(`info2: ${this.info2.name}-${this.info2.age}`) // Text2
//       Button("change info1&info2")
//         .onClick(() => {
//           this.info1 = new Info("Lucy", 18); // Text1不会刷新
//           this.info2 = new Info("Lucy", 18); // Text2会刷新
//         })
//
//       Button("change age")
//         .onClick(() => {
//           this.info1.age++; // Text1会刷新
//           this.info2.age++; // Text2会刷新
//         })
//     }.margin({ top: 100 })
//   }
// }


// 联合类型
@Entry
@ComponentV2
struct Index_local {
  @Local count: number | undefined = 10;

  build() {
    Column() {
      Text(`count(${this.count})`)
      Button("change to undefined")
        .onClick(() => {
          this.count = undefined;
        })
      Button("change to number")
        .onClick(() => {
          this.count = 10;
        })
    }
  }
}