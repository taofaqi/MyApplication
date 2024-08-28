//分类
export interface Category {
  tag: string
  name: string
  foods: FoodItem[]
}

//食物子项
export interface FoodItem {
  id: number
  name: string
  like_ratio_desc: string
  food_tag_list: string[]
  price: number
  picture: string
  description: string
  tag: string
  month_saled: number
  count: number
}
