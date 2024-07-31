import { promptAction } from '@kit.ArkUI'
import { ReplyItem, replyItemList } from '../models/ReplyItem'

@Preview
@Entry
@Component
struct IndexZhiHu {
  @State
  replyList: ReplyItem[] = replyItemList
  @State
  content: string = ""

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Scroll() {
          Column() {
            //导航
            NavComp()
            //评论
            CommentComp()
            //分割线
            Divider().strokeWidth(1).color('#f5f5f5')
            //回复列表
            Column() {
              Text(`回复  ${this.replyList.length.toString()}`)
                .width('100%')
                .fontWeight(600)
              ForEach(this.replyList
                , (item: ReplyItem) => {
                  Row() {
                    Image(item.avatar).width(32).aspectRatio(1).borderRadius(16)
                    Column() {
                      Text(item.author)
                        .width('100%').fontWeight(FontWeight.Bold).fontSize(15)
                      Text(item.content).padding({ right: 20 }).width('100%')
                      Row() {
                        Text(`${item.time} · IP属地${item.area}`).fontSize(12).fontColor('#c3c4c5')
                        Row() {
                          //svg图片可以使用填充色
                          Image($r('app.media.ic_public_heart'))
                            .width(20)
                            .height(20)
                            .fillColor(item.likeFlag ? '#ff6600' : '#c3c4c5')
                          Text(`${item.likeNum?.toString()}`)
                            .fontSize(12)
                            .fontColor(item.likeFlag ? '#ff6600' : '#c3c4c5')
                        }.onClick(() => {
                          this.onLike(item)
                        })
                      }.justifyContent(FlexAlign.SpaceBetween).width('100%')
                    }.padding({ left: 10 }).layoutWeight(1)
                  }.padding({ top: 15, bottom: 15 }).alignItems(VerticalAlign.Top)
                },
                // key 有默认你规则
                // key 为了元素复用
                // 如果没有写，会自动生成一个key，index_ + JSON.stringify(item)，不建议不写
                // (item: ReplyItem) => item.id.toString() 写一个ID做唯一标识，需要key也更新才能更新对应UI
                // item => id + likeNum + likeFlag 把需要更新的字段合在一起当做key
                // (item:ReplyItem)=> JSON.stringify({ id,likeNum,likeFlag })

                // 学习了 @Observed @ObjectLink 这样也可以更新~
                // (item: ReplyItem) => item.id.toString()
              )
            }.padding(15)
          }.padding({ bottom: 50 })
        }
      }.width('100%').height('100%')

      Row({ space: 15 }) {
        TextInput({ placeholder: '回复~', text: this.content }).layoutWeight(1)
          .onChange((value: string) => {
            this.content = value
          })
        Text('发布')
          .fontColor('#069').onClick(() => {
          this.onReply()
        })
      }
      .width('100%')
      .height(50)
      .padding({ left: 15, right: 15 })
      .backgroundColor('#fff')
      .border({ width: { top: 0.5 }, color: '#e4e4e4' })
    }
  }

  onLike(item: ReplyItem) {
    //TODO
    // const reply : ReplyItem= { ...item }
    let reply: ReplyItem = new ReplyItem()
    reply.id = item.id
    reply.avatar = item.avatar
    reply.author = item.author
    reply.content = item.content
    reply.time = item.time
    reply.area = item.area
    reply.likeNum = item.likeNum
    reply.likeFlag = item.likeFlag

    if (reply.likeFlag) {
      reply.likeFlag = false
      reply.likeNum!--
      promptAction.showToast({ message: '取消点赞' })
    } else {
      reply.likeFlag = true
      reply.likeNum!++
      promptAction.showToast({ message: '点赞成功' })
    }
    const index = this.replyList.findIndex(rep => rep.id === reply.id)
    this.replyList[index] = reply
  }

  onReply() {
    //进行回复
    const reply: ReplyItem = {
      id: Math.random(),
      content: this.content,
      author: 'Zhousg',
      avatar: $r('app.media.avatar'),
      time: '12-01',
      likeNum: 0,
      area: '北京'
    }
    this.replyList.unshift(reply)
    this.content = ''
    promptAction.showToast({ message: '回复成功' })
  }
}

//导航
@Component
struct NavComp {
  build() {
    Row() {
      Row() {
        Image($r('app.media.back')).width(14).aspectRatio(1)
      }
      .width(24)
      .aspectRatio(1)
      .backgroundColor($r('app.color.main_color'))
      .borderRadius(12)
      .justifyContent(FlexAlign.Center)
      .margin({ left: 16 })

      Text('评论回复')
        .layoutWeight(1).textAlign(TextAlign.Center)
        .padding({ right: 40 })
    }.height(40).border({ width: { bottom: 0.5 }, color: '#e4e4e4' })
  }
}

//评论
@Component
struct CommentComp {
  build() {
    Row() {
      Image($r('app.media.avatar')).width(32).aspectRatio(1).borderRadius(16)
      Column() {
        Text('周杰伦')
          .width('100%').fontWeight(FontWeight.Bold).fontSize(15)
        Text('大理石能雕刻出肌肉和皮肤的质感，那个年代的工匠好牛啊').padding({ right: 20 }).width('100%')

        Row() {
          Text('10-21 · IP属地北京').fontSize(12).fontColor('#c3c4c5')
          Row() {
            //svg图片可以使用填充色
            Image($r('app.media.ic_public_heart')).width(20).height(20).fillColor('#c3c4c5')
            Text('100').fontSize(12).fontColor('#c3c4c5')
          }
        }.justifyContent(FlexAlign.SpaceBetween).width('100%')
      }.padding({ left: 10 }).layoutWeight(1)
    }.padding(15).alignItems(VerticalAlign.Top)
  }
}
