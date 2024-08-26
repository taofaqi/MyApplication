// @ObservedV2
// class Son {
//   @Trace age: number = 100;
// }
// class Father {
//   son: Son = new Son();
// }
// @Entry
// @ComponentV2
// struct Index_ObservedV2_Trace {
//   father: Father = new Father();
//
//   build() {
//     Column({space:15}){
//       // 当点击改变age时，Text组件会刷新
//       Text(`基本类型改变：${this.father.son.age}`)
//         .onClick(() => {
//           this.father.son.age++;
//         })
//       Divider()
//       Text(`继承类 属性改变：${this.father.son.age}`)
//         .onClick(() => {
//           this.father.son.age++;
//         })
//
//     }.margin({top:100})
//   }
// }






// @ObservedV2
// class Pencil {
//   @Trace length: number = 21; // 当length变化时，会刷新关联的组件
// }
// class Bag {
//   width: number = 50;
//   height: number = 60;
//   pencil: Pencil = new Pencil();
// }
// class Son {
//   age: number = 5;
//   school: string = "some";
//   bag: Bag = new Bag();
// }
//
// @Entry
// @ComponentV2
// struct Index_ObservedV2_Trace {
//   son: Son = new Son();
//   renderTimes: number = 0;
//   isRender(id: number): number {
//     console.info(`id: ${id} renderTimes: ${this.renderTimes}`);
//     this.renderTimes++;
//     return 40;
//   }
//
//   build() {
//     Column() {
//       Text('pencil length'+ this.son.bag.pencil.length)
//         .fontSize(this.isRender(1))   // UINode (1)
//       Button("change length")
//         .onClick(() => {
//           // 点击更改length值，UINode（1）会刷新
//           this.son.bag.pencil.length += 100;
//         })
//       Button("assign Son")
//         .onClick(() => {
//           // 由于变量son非状态变量，因此无法刷新UINode（1）
//           this.son = new Son();
//         })
//     }.margin({top:100})
//   }
// }




//@Trace装饰基础类型的数组
let nextId: number = 0;

@ObservedV2
class Arr {
  id: number = 0;
  @Trace numberArr: number[] = [];

  constructor() {
    this.id = nextId++;
    this.numberArr = [0, 1, 2];
  }
}

@Entry
@ComponentV2
struct Index {
  arr: Arr = new Arr();

  build() {
    Column() {
      Text(`length: ${this.arr.numberArr.length}`)
        .fontSize(40)
      Divider()
      if (this.arr.numberArr.length >= 3) {
        Text(`第一个元素点击累加：  ${this.arr.numberArr[0]}`)
          .fontSize(40)
          .onClick(() => {
            this.arr.numberArr[0]++;
          })
        Text(`第二个元素点击累加：  ${this.arr.numberArr[1]}`)
          .fontSize(40)
          .onClick(() => {
            this.arr.numberArr[1]++;
          })
        Text(`第三个元素点击累加：  ${this.arr.numberArr[2]}`)
          .fontSize(40)
          .onClick(() => {
            this.arr.numberArr[2]++;
          })
      }

      Divider()

      ForEach(this.arr.numberArr, (item: number, index: number) => {
        Text(`${index} ${item}`)
          .fontSize(40)
      })

      Button('push')
        .onClick(() => {
          this.arr.numberArr.push(50);
        })

      Button('pop')
        .onClick(() => {
          this.arr.numberArr.pop();
        })

      Button('shift')
        .onClick(() => {
          this.arr.numberArr.shift();
        })

      Button('splice')
        .onClick(() => {
          this.arr.numberArr.splice(1, 0, 60);
        })



      Button('unshift')
        .onClick(() => {
          this.arr.numberArr.unshift(100);
        })

      Button('copywithin')
        .onClick(() => {
          this.arr.numberArr.copyWithin(0, 1, 2);
        })

      Button('fill')
        .onClick(() => {
          this.arr.numberArr.fill(0, 2, 4);
        })

      Button('reverse')
        .onClick(() => {
          this.arr.numberArr.reverse();
        })

      Button('sort')
        .onClick(() => {
          this.arr.numberArr.sort();
        })
    }.margin({top:100})
  }
}