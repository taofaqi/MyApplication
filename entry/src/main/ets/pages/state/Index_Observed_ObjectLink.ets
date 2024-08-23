/**
 * 三级数据结构
 */
import { util } from '@kit.ArkTS';

// 每一级数据结构都需要用Observed修饰
@Observed
class GrandsonInfo {
  content: string = "";
}

/**
 * 二级数据结构
 */
// 每一级数据结构都需要用Observed修饰
@Observed
class ChildInfo {
  index: number;
  grandsonInfo: GrandsonInfo;

  constructor(index: number, content: string) {
    this.index = index;
    this.grandsonInfo = new GrandsonInfo();
    this.grandsonInfo.content = content;
  }
}

/**
 * 一级数据结构
 */
// 每一级数据结构都需要用Observed修饰
@Observed
class ItemInfo {
  key: string = util.generateRandomUUID(true);
  name: string;
  icon: Resource;
  childInfo: ChildInfo;
  select: boolean;

  constructor(name: string, icon: Resource, index: number, content: string) {
    this.name = name;
    this.icon = icon;
    this.childInfo = new ChildInfo(index, content);
    this.select = false;
  }
}


/**
 * 多层嵌套刷新渲染
 */
@Entry
@Component
struct IndexObservedObjectLink {
  private TAG: string = "ObservedPage";
  @State mListData: Array<ItemInfo> = [];

  aboutToAppear(): void {
    this.mListData.push(new ItemInfo('游戏', $r("app.media.avatar"), 1, "鹅厂1"));
    this.mListData.push(new ItemInfo('游戏', $r("app.media.avatar"), 2, "鹅厂2"));
    this.mListData.push(new ItemInfo('游戏', $r("app.media.avatar"), 3, "鹅厂3"));
    this.mListData.push(new ItemInfo('游戏', $r("app.media.avatar"), 4, "鹅厂4"));
    this.mListData.push(new ItemInfo('游戏', $r("app.media.avatar"), 5, "鹅厂5"));
    this.mListData.push(new ItemInfo('游戏', $r("app.media.avatar"), 6, "鹅厂6"));
  }

  build() {
    List() {
      ForEach(this.mListData, (item: ItemInfo, index: number) => {
        ListItem() {
          // ListItem包裹的ItemView需要抽离成Component组件的形态，参数通过属性赋值传递，即：大括号包裹中，属性值key value形式赋值
          ItemView({
            item: item,
            index: index
          })
        }
      }, (item: ItemInfo) => JSON.stringify(item)) // , (item: ItemInfo) => JSON.stringify(item)
      // keyGenerator: ArkUI框架会对重复的键值发出警告。在UI更新的场景下，如果出现重复的键值，框架可能无法正常工作. [渲染异常]
      // 除非必要，否则不推荐将第三个参数KeyGenerator函数处于缺省状态,应尽量避免最终键值生成规则中包含index。[渲染性能降低]
    }
    .width("100%")
    .height("100%")
    .padding({ left: px2vp(60), right: px2vp(60) })
  }
}

@Component
struct ItemView {
  private TAG: string = "ItemView";
  @Prop index: number = 0;
  // 列表数据的单个item对象数据，需要使用ObjectLink修饰监听，用于将数据变化传递给外部父组件的mListData
  @ObjectLink item: ItemInfo

  build() {
    Row() {
      Image(this.item.icon)
        .width(px2vp(200))
        .height(px2vp(200))

      Text(this.item.name + "(" + this.item.childInfo.index + ")" + " [ " + this.item.childInfo.grandsonInfo.content +
        " ] ")
        .fontSize(px2fp(52))

      Blank()

      if (this.item.select) {
        Image($r("app.media.avatar"))
          .size({
            width: px2vp(72),
            height: px2vp(72)
          })
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.Start)
    .onClick(() => {
      this.item.select = !this.item.select;
      if (this.item.select) {
        // 使用很方便，只需要直接改变item数据的任意层级属性值，变化就会同步刷新
        this.item.childInfo.index = 666;
        this.item.childInfo.grandsonInfo.content = "鹅厂23333"
      } else {
        this.item.childInfo.index = this.index;
        this.item.childInfo.grandsonInfo.content = "鹅厂" + this.index;
      }
      console.log(this.TAG, " ItemView onClick: " + this.index + " item.select: " + this.item.select);
    })
  }
}