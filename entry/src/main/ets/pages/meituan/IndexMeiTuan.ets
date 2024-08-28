import { Cart } from './components/Cart';
import { Footer } from './components/Footer';
import { MenuWrapper } from './components/MenuWrapper';
import { Nav } from './components/Nav';
import { Category } from './models/FoodItem';
import { http } from '@kit.NetworkKit';
import { CART_KEY } from './utils/Utils';

const req = http.createHttp()

@Preview
@Entry
@ComponentV2
struct IndexMeiTuan {
  @Local isShowCart: boolean = false;
  @Local categoryList: Category[] = []


  //在build执行前
  aboutToAppear(): void {
    AppStorage.get<string>(CART_KEY)


    req.request('https://taofaqi.github.io/testHtml/takeaway.json')
      .then(res => {
        const categoryList = JSON.parse(res.result as string) as Category[]
        this.categoryList = categoryList
      })
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      //外卖商品容器
      Column() {
        //导航
        Nav()
        //商品区
        MenuWrapper({ categoryList: this.categoryList })
      }.width('100%')
      .height('100%')

      //购物车
      if (this.isShowCart) {
        Cart()
      }

      //底部结算
      Footer({
        isShowCart: this.isShowCart, changeShowCart: (isShowCart: boolean) => {
          this.isShowCart = isShowCart
        }
      })
    }
    .width('100%').margin({ top: 40 })
  }
}