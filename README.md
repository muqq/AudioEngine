### Core Audio Practice
  * 實作`AudioEngine`
  * 熟悉`Audio Queue`
  * 熟悉`Audio Unit`

### 心得
  * 這次的內容比較多，只有實作`AudioEngine`，剩下兩個只有熟悉流程，熟悉完才了解到`AudioEngine`幫我們做了多少事情。在熟悉之前，需要先看一些數位音訊的基礎知識，必須先了解`frame`、`packet`、`PCM`。
  * `Audio Queue`和`Audio Unit`最主要的差異在`Audio Queue`無法對聲音做特殊處理，像混音和EQ，但實作起來也比`Audio Unit`簡單。以下簡單介紹流程。

  * Audio Queue
    * 建立`AudioFileStreamID`與網路連線
    * 拿到部份資料後parse
    * 收到parse出的檔案格式後檢查，然後建立`Audio Queue`
    * 收到parse出的`packet`，並存起來
    * packet數量夠多時，enqueue buffer
    * `Audio Queue`快播完時會callback再和你要資料，再enqueue buffer，以此循環。

  * Audio Unit
    * 建立`Audio Unit`和設定`Render Callback`
    * 建立`AudioFileStreamID`與網路連線
    * 拿到部份資料後parse
    * 收到parse出的檔案格式後檢查，然後建立`Converter`，和`Audio Queue`最主要的差別是必須自己把data轉成LPCM格式
    * 收到parse出的`packet`，並存起來
    * packet數量夠多時，開始播放
    * `Render Callback`會來要資料，把packet透過converter轉成LPCM回傳
    * 實作Converter的fill callback，把資料餵給converter
