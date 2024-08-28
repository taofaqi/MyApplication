import { CartItemModel } from '../models/CartItemModel'
import { FoodItem } from '../models/FoodItem'

export const CART_KEY = 'meituan_cart'

//获取购物车中数据
export const getCart = () => {
  return JSON.parse(AppStorage.Get(CART_KEY) || '[]') as CartItemModel[]
}

//加入购物车
export const addCart = (food: FoodItem) => {
  const json = AppStorage.get<string>(CART_KEY) || '[]'
  const list = JSON.parse(json) as CartItemModel[]
  const finded = list.find(item => item.id === food.id)
  //已经添加过了
  if (finded) {
    food.count++
  } else { //之前没有添加
    const cartItemModel: CartItemModel = {
      id: food.id,
      name: food.name,
      price: food.price,
      picture: food.picture,
      count: 1
    }
    list.push(cartItemModel)
  }
  AppStorage.Set(CART_KEY, JSON.stringify(list))
}