fc =
  "專案名稱":
    type: \@makeform/input
    meta:
      is-required: true
      desc: "取一個響亮的專案名稱吧！"

  "專案代表圖":
    type: \@makeform/upload
    meta:
      is-required: true
      desc: "放一張閃亮的代表圖！"
      term: [{opset: \file, enabled: true, op: \extension, msg: '檔案格式不符', config: str: "jpg,gif,png"}]
      config: note: [ "請上傳 JPG / PNG / GIF 檔案" "檔案上限1MB" ]

  "專案影片":
    type: \@makeform/video
    meta:
      is-required: true
      desc: "放一張閃亮的影片檔！"
      config: note: [ "請上傳 MPEG-4 / H.264 編碼的 mp4 檔案。" "檔案上限1MB" ]

  "專案簡介":
    type: \@makeform/textarea
    meta:
      is-required: true
      desc: "請以簡短（150 字內）且非專業人士也能理解的方式介紹此專案。"
      term: [{opset: \length, enabled: true, op: \lte, msg: '太長了', config: val: 150}]

  "提案代表人":
    type: \@makeform/input
    meta:
      is-required: true
      desc: "不需要是本名。獲獎團隊須在提案申請時，選定一位自然人作為團隊代表人。提案代表人將被視為提案的代表與聯絡人。"

  "提案代表人是否具有 U-22 組資格？":
    type: \@makeform/radio
    meta:
      is-required: true
      desc: "資格請參考提案細則 sch001.g0v.tw/means"
      config: values: <[是 否]>

  "提案代表人的 g0v Slack ID":
    type: \@makeform/input
    meta:
      is-required: true
      desc: "如何加入 g0v Slack 請參考 g0v.hackmd.io/@jothon/joing0vslack"

  "提案團隊簡介":
    type: \@makeform/textarea
    meta:
      is-required: true
      desc: "請簡單介紹每位成員，包括背景、在專案中的角色（例如：專案經理、全端工程師、顧問等）若還需要徵求成員，也請在此項說明（還需要什麼人才）。"
      term: [{opset: \length, enabled: true, op: \lte, msg: '太長了', config: val: 1500}]
      config: limitation: "不可超過 1500 字"


  "為什麼要做這個專案？（動機）":
    type: \@makeform/textarea
    meta:
      is-required: true
      desc: "或許你有一個故事？"
      term: [{opset: \length, enabled: true, op: \lte, msg: '太長了', config: val: 1500}]
      config: limitation: "不可超過 1500 字"

  "請以此句型釐清專案目標、受眾與獨特性":
    type: \@makeform/textarea
    meta:
      is-required: true
      desc: "「為了解決（某使用者族群）遇到的（要解決的問題）困難，我的專案提供（某種解決方式），可以做到（如何解決問題）。我的專案跟（現有的解決方式），在（差異與區別部分）不同，因此具有不可取代性。」"
      term: [{opset: \length, enabled: true, op: \lte, msg: '太長了', config: val: 500}]
      config: limitation: "不可超過 500 字"

  "請列出這個計畫的目標對象，他們的需求、情境與使用動機？":
    type: \@makeform/textarea
    meta:
      is-required: true
      term: [{opset: \length, enabled: true, op: \lte, msg: '太長了', config: val: 1500}]
      config: limitation: "不可超過 1500 字"

  "請提供本專案的示意圖或介面設計草圖":
    type: \@makeform/upload
    meta:
      is-required: true
      term: [{opset: \file, enabled: true, op: \extension, msg: '檔案格式不符', config: str: "png,jpg,gif"}]
      config:
        note: [
          "請上傳 JPG / PNG / GIF 檔案"
          "檔案上限1MB"
        ]

  "你覺得本專案可能會面臨的困難有哪些，你又會如何解決這些困難？":
    type: \@makeform/textarea
    meta:
      is-required: true
      term: [{opset: \length, enabled: true, op: \lte, msg: '太長了', config: val: 500}]
      config: limitation: "不可超過 500 字"

  "本專案結束後，未來可能進一步的發展？":
    type: \@makeform/textarea
    meta:
      is-required: true
      term: [{opset: \length, enabled: true, op: \lte, msg: '太長了', config: val: 500}]
      config: limitation: "不可超過 500 字"

  "專案分類":
    type: \@makeform/radio
    meta:
      is-required: true
      config:
        other: enabled: true
        values: [
          "COVID-19 新解方（New Solution for Preventing Pandemic）"
          "遠距教學解決方案（Solution of Distance Learing）"
          "社群經營與基礎建設（Community Management & Infrastructure）"
          "教育內容（Educational Content）"
        ]

  "專案總經費":
    meta:
      is-required: true
      config: unit: "元新臺幣"
  "自籌款金額":
    meta:
      title: "自籌款金額"
      is-required: true
      config: unit: "元新臺幣"
  "補助款金額":
    meta:
      readonly: true, is-required: true
      config: unit: "元新臺幣"

  "若有本專案介紹的投影片，請提供":
    type: \@makeform/upload
    meta:
      is-required: true
      term: [{opset: \file, enabled: true, op: \extension, msg: '檔案格式不符', config: str: "pdf"}]
      config:
        note: [
          "請上傳 PDF 檔案"
          "檔案上限30MB"
        ]

  "你有什麼其他想補充的事情嗎？":
    type: \@makeform/textarea
    meta:
      is-required: true
      term: [{opset: \length, enabled: true, op: \lte, msg: '太長了', config: val: 500}]
      desc: "例如：「這個專案正在／預計跟什麼社群／團體合作？」「你的專案有面向某個社群嗎？要如何讓社群和使用者參與專案，並回饋意見？」"
      config:
        show-markdown-option: true

  "社群守則":
    type: "@makeform/checkbox"
    meta:
      title: " "
      is-required: true
      config:
        values: ["我已閱讀並接受「社群守則」。"]
        other: enabled: false
        note: ["記得勾選"]
