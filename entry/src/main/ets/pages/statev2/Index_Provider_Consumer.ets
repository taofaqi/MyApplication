// @Entry
// @ComponentV2
// struct Index_Provider_Consumer {
//   @Provider('2e4') str: string = 'hello';
//
//   build() {
//     Column() {
//       Button(this.str)
//         .onClick(() => {
//           this.str += '1';
//         })
//       ChildProviderConsumer()
//     }.margin({ top: 100 })
//   }
// }
//
//
// @ComponentV2
// struct ChildProviderConsumer {
//   @Consumer('2e4') str: string = 'world';
//
//   build() {
//     Column({ space: 20 }) {
//       Button(this.str)
//         .onClick(() => {
//           this.str += '0';
//         })
//     }
//   }
// }


//@Provider和@Consumer可以修饰回调事件，方便组件之间完成行为抽象
// @Entry
// @ComponentV2
// struct Index_Provider_Consumer {
//   @Local childX: number = 0;
//   @Local childY: number = 1;
//   @Provider() onDrag: (x: number, y: number) => void = (x: number, y: number) => {
//     console.log(`onDrag event at x=${x} y:${y}`);
//     this.childX = x;
//     this.childY = y;
//   }
//
//   build() {
//     Column() {
//       Text(`child position x: ${this.childX}, y: ${this.childY}`)
//       Child_Provider_Consumer()
//     }.margin({ top: 100 })
//   }
// }
//
// @ComponentV2
// struct Child_Provider_Consumer {
//   @Consumer() onDrag: (x: number, y: number) => void = (x: number, y: number) => {
//   };
//
//   build() {
//     Button("changed")
//       .draggable(true)
//       .onClick(() => {
//         this.onDrag(100, 200);
//       })
//       .onDragStart((event: DragEvent) => {
//         // 当前预览器上不支持通用拖拽事件
//         // this.onDrag(event.getDisplayX(), event.getDisplayY());
//       })
//   }
// }



@ObservedV2
class UserProviderConsumer {
  @Trace name: string;
  @Trace age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

const data: UserProviderConsumer[] = [new UserProviderConsumer('Json', 10), new UserProviderConsumer('Eric', 15)];

@Entry
@ComponentV2
struct Index_Provider_Consumer {
  @Provider('data') users: UserProviderConsumer[] = data;

  build() {
    Column() {
      Child_Provider_Consumer()
      Button('age new User_Provider_Consumer')
        .onClick(() => {
          this.users.push(new UserProviderConsumer('Molly', 18));
        })
      Button('age++')
        .onClick(() => {
          this.users[0].age++;
        })
      Button('change name')
        .onClick(() => {
          this.users[0].name = 'Shelly';
        })
    }.margin({ top: 100 })
  }
}



@ComponentV2
struct Child_Provider_Consumer {
  @Consumer('data') users: UserProviderConsumer[] = [];

  build() {
    Column() {
      ForEach(this.users, (item: UserProviderConsumer) => {
        Column() {
          Text(`name: ${item.name}`).fontSize(30)
          Text(`age: ${item.age}`).fontSize(30)
          Divider()
        }
      })
    }
  }
}