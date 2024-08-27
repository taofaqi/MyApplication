import { Cart } from './components/Cart';
import { Footer } from './components/Footer';
import { MenuWrapper } from './components/MenuWrapper';
import { Nav } from './components/Nav';

@Entry
@ComponentV2
@Preview
struct IndexMeiTuan {
  @Local isShowCart: boolean = false;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      //外卖商品容器
      Column() {
        //导航
        Nav()
        //商品区
        MenuWrapper()
      }

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
    .height('100%')
    .width('100%')
  }
}