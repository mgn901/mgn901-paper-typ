#import "@preview/tiptoe:0.2.0"
#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.4"
#import "libs/diagram/icon.typ": icon
#import "libs/diagram/shape.typ": create-mpl-bubble
#import "libs/diagram/node-edge.typ": node, edge, annotation-node, straight
#import "libs/mgn901-paper/common-perpage-bibliography.typ": cite
#import "libs/mgn901-paper/mpl.typ": create-mpl
#import "libs/mgn901-paper/slide.typ": slide
#import "libs/mgn901-paper/slide-running-head.typ": running-head
#import "libs/mgn901-paper/utils.typ": q
#import "libs/mgn901-paper/utils.typ": q
#import "libs/presets/slide.typ": page-settings, type-settings, font-settings, heading-type-settings
#import "libs/presets/common.typ": color-presets
#import "libs/slide-frontmatter.typ": slide-frontmatter

#let mpl = create-mpl(font-settings: font-settings, type-settings: type-settings)
#let mpl-bubble = create-mpl-bubble(font-settings: font-settings.strong, type-settings: type-settings.default)

#show: slide.with(
  document-settings: (lang: "ja"),
  page-settings: page-settings,
  type-settings: type-settings,
  font-settings: font-settings,
  heading-type-settings: heading-type-settings,
  heading-font-settings: (font-settings.heading,),
  heading-settings: (
    (label-width: 1em, numbering: none, break-before: true),
    (label-width: 2em, numbering: none, break-before: false),
  ),
)

#slide-frontmatter(
  title: [レポート・論文・スライド組版向け\ Typstテンプレート「mgn901-paper-typ」],
  subtitle: [],
  author: [めがね901\ 個人サークル めがね901\ https://mgn901.com],
  date: [2025年2月11日],
  title-font-settings: font-settings.heading,
  subtitle-font-settings: font-settings.default,
  author-font-settings: font-settings.default,
  default-type-settings: type-settings.default,
  title-type-settings: type-settings.frontmatter-title,
  subtitle-type-settings: type-settings.frontmatter-default,
  author-type-settings: type-settings.frontmatter-small,
)

= 本スライドの構成

+ Typstとは
+ Typstの導入方法
+ mgn901-paper-typの利用方法
+ mgn901-paper-typでのスライドの作り方

= Typstテンプレート「mgn901-paper-typ」の特長

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 1em,
  rows: (100% - type-settings.default.line-height * 2.26),
  (mpl-bubble.block-strong)(height: 100%)[
    1. #(mpl.itype-small)[レポート、論文、\ スライドなど、]\ #(mpl.font-heading)[多くの媒体の\ 組版に対応]
    #(mpl-bubble.block-emph)[
      #(mpl.type-footnote)[
        - 充実のテンプレート
          - #icon[article] 1段組レポート
          - #icon[news] 1段組論文
          - #icon[view_column_2] 2段組記事
          - #icon[slide_library] スライド
        - 書体、組体裁の設定は\ テンプレート本体と\ 独立していて、\ 簡単に変更可能
      ]
    ]
  ],
  (mpl-bubble.block-strong)(height: 100%)[
    2. #(mpl.itype-small)[和文組版向けの設定が\ 最初から適用済み]\ #(mpl.font-heading)[美しい仕上がりを\ 簡単に得られる]
    #block(
      width: 100%,
      clip: true,
      fill: white,
      stroke: none,
      radius: (type-settings.default.line-height - type-settings.default.font-size) * 1.5,
    )[#image(width: 100%, "./example-article.svg")]
  ],
  (mpl-bubble.block-strong)(height: 100%)[
    3. #(mpl.itype-small)[読みやすく美しい\ 紙面や画面の作成に役立つ]\ #(mpl.font-heading)[充実した\ 機能、関数]
    #(mpl-bubble.block-emph)[
      #(mpl.type-small)[
        - 番号付き見出し
        - 番号付き図表
        - 図表、数式の自動行取り
        - ページ番号の自動挿入
        - スライド用の柱
        - 論文用の目次
        - スライドごとの参考文献の\ 書誌情報の挿入
        - 図解作成用の関数
        - 緩和曲線の角丸矩形
      ]
    ]
  ],
)

= Typst：レポート、論文、スライド向けの組版エンジン

#running-head([], [Typst\ とは])

#grid(
  columns: (1fr, 1.5fr, 1fr),
  align: (right + horizon, center + horizon, left + horizon),
  node(<node:typstとは:入力>)[#(mpl-bubble.emph)[#icon[docs] 文字や図表]],
  node(<node:typstとは:組版エンジン>)[
    #(mpl-bubble.strong)[
      #icon[memory]組版エンジン
      #(mpl.type-small)[文字や図表を\ 紙面に配置]
    ]
  ],
  node(<node:typstとは:pdf1>)[#(mpl-bubble.emph)[#icon[picture_as_pdf] PDFファイル#(mpl.itype-footnote)[等]]],
)

#edge(<node:typstとは:入力>, <node:typstとは:組版エンジン>, direction: "lr", label-pos: top)[
  #(mpl-bubble.edge-default)[入力]
]
#edge(<node:typstとは:組版エンジン>, <node:typstとは:pdf1>, direction: "lr", label-pos: top)[
  #(mpl-bubble.edge-default)[出力]
]

#v(type-settings.default.line-height, weak: true)

#grid(
  columns: (1fr, 1.5fr, 1fr),
  align: (right + horizon, center + horizon, left + horizon),
  node(<node:typstとは:typ>)[
    #(mpl-bubble.emph)[
      #align(center)[
        #icon[data_object] typファイル
        #(mpl.type-small)[Typst用の\ マークアップ言語]
      ]
    ]
  ],
  node(<node:typstとは:typst>)[
    #(mpl-bubble.strong)[
      #align(center)[
        Typst
        #(mpl.type-small)[組版エンジン]
      ]
    ]
  ],
  node(<node:typstとは:pdf2>)[#(mpl-bubble.emph)[#icon[picture_as_pdf] PDFファイル#(mpl.itype-footnote)[等]]],
)

#edge(<node:typstとは:typ>, <node:typstとは:typst>, direction: "lr", label-pos: top)[#(mpl-bubble.edge-default)[入力]]
#edge(<node:typstとは:typst>, <node:typstとは:pdf2>, direction: "lr", label-pos: top)[#(mpl-bubble.edge-default)[出力]]


#annotation-node(
  <node:typstとは:typの特徴>,
  <node:typstとは:typ>,
  direction: "tb",
  y: type-settings.default.line-height * 10,
  start-sep: -.25em,
)[
  #(mpl-bubble.strong)[
    #(mpl.type-footnote)[
      - テキストエディタで\ 編集できる
      - 再利用しやすい
    ]
  ]
]

#annotation-node(
  <node:typstとは:typstの特徴>,
  <node:typstとは:typst>,
  direction: "tb",
  y: type-settings.default.line-height * 10,
  start-sep: -.25em,
)[
  #(mpl-bubble.strong)[#(mpl.type-footnote)[数式組版や\ 相互参照の仕組みが\ 整っている]]
]

= 2つの導入方法

#running-head([Typstの導入方法], [導入\ 方法])

#(mpl-bubble.block-structural)[
  1. #icon[devices] 自分のPCにインストールして利用する
    - VSCode#(mpl.itype-footnote)[（Visual Studio Code）]上で利用する場合の方法#h(.125em)#(mpl.itype-footnote)[を紹介]
]

#(mpl-bubble.block-structural)[
  2. #icon[cloud] typst.app#(mpl.itype-footnote)[（Typst Web Application）]上で利用する
]

= VSCode上で利用する場合の導入方法

== 1. VSCode#(mpl.itype-footnote)[（テキストエディタ）]をインストールする

#grid(
  inset: (x: 1em),
  columns: 2,
  column-gutter: -1.5em,
  link("https://apps.microsoft.com/detail/xp9khm4bk9fz7q")[
    #(mpl-bubble.emph)[
      Windows#(mpl.itype-footnote)[（Microsoft Store経由）]
      #(mpl.type-small)[https://apps.microsoft.com/detail/xp9khm4bk9fz7q]
    ]
  ],
  link("https://apps.microsoft.com/detail/xp9khm4bk9fz7q")[
    #(mpl-bubble.emph)[
      Windows以外
      #(mpl.type-small)[https://code.visualstudio.com]
    ]
  ],
)

== 2. VSCodeを起動する

== 3. 拡張機能をインストールする

#grid(
  inset: (x: 1em),
  row-gutter: type-settings.default.line-height - type-settings.default.font-size,
  link("https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist")[
    #(mpl-bubble.emph)[
      Tinymist Typst#(mpl.itype-footnote)[（Typstが同梱されている）]
      #(mpl.type-small)[https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist]
    ]
  ],
  link("https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf")[
    #(mpl-bubble.emph)[
      vscode-pdf#(mpl.itype-footnote)[（VSCodeでPDFを閲覧できる）]
      #(mpl.type-small)[https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf]
    ]
  ],
)

= VSCodeでtypファイルを編集する

== 1. フォルダを作成する

#grid(inset: (x: 1em))[
  - エクスプローラー（macOSの場合はFinder）などで、\ typファイルを保存するためのフォルダを作成する。
]

== 2. 作成したフォルダを開く

#grid(inset: (x: 1em))[
  - VSCodeのメニューバーの#(mpl-bubble.inline-default)[`ファイル`]→#(mpl-bubble.inline-default)[`フォルダーを開く`]
]

== 3. VSCodeでフォルダ内のファイルを編集する

#grid(inset: (x: 1em))[
  - VSCodeの画面左側に、\ そのフォルダに含まれるファイルの一覧が表示される。
  - 一覧から、テキストファイルの名前をダブルクリックすると、\ そのファイルをVSCodeで開くことができる。
]

= typst.app上で利用する場合の方法

== 1. #link("https://typst.app/signup")[#(mpl-bubble.inline-default)[`typst.app/signup`]]にアクセスする

== 2. 必要な情報を入力して#(mpl-bubble.inline-default)[`Sign Up`]をクリックする

= typst.appでtypファイルを編集する

== 1. #link("https://typst.app/app")[#(mpl-bubble.inline-default)[`typst.app/app`]]にアクセスしてログインする

== 2. Projectを作成して開く

#grid(inset: (x: 1em))[
  - typst.appでは、\ typファイルのまとまりを「Project」として管理する。
  - typst.appを開くと表示されるDashboardで、\ Projectを作成したり開いたりして、編集を始める。
]

= mgn901-paper-typ#cite(<mgn901:mgn901-paper-typ>)とは

#running-head([mgn901-paper-typの利用方法], [利用\ 方法])

#v(type-settings.default.line-height)

- Typstの#node(<node:mgn901-paper-typとは:テンプレート>)[#(mpl-bubble.inline-emph)[テンプレート]]
- 和文組版のために調整

#align(center)[
  #v(type-settings.default.line-height, weak: true)
  #(mpl-bubble.strong)[
    #align(start)[
      - 追加の調整不要
      - 見た目はテンプレートに任せて、内容だけを意識して作業
      - 美しく読みやすい和文のレポート、論文、スライドを作成可能
    ]
  ]
]

#annotation-node(
  <node:mgn901-paper-typとは:テンプレート説明>,
  <node:mgn901-paper-typとは:テンプレート>,
  direction: "lr",
  x: 50%,
  start-sep: -.25em,
)[#(mpl-bubble.emph)[印刷物の体裁を\ 調整するための命令だけが\ 書かれたtypファイル]]

= mgn901-paper-typを利用して\ レポート・論文・スライドの作成をはじめる

== 1. mgn901-paper-typのzipファイルをダウンロードする

#grid(
  inset: (x: 1em),
  columns: 2,
  column-gutter: -1.5em,
  link("https://github.com/mgn901/mgn901-paper-typ/archive/refs/main.zip")[
    #(mpl-bubble.emph)[
      #icon[folder_zip] GitHubからzipファイルをダウンロード
      #(mpl.type-small)[https://github.com/mgn901/mgn901-paper-typ/archive/refs/main.zip]
    ]
  ],
)

== 2. typファイルを保存するためのフォルダに展開する

== 3. 名前が#(mpl-bubble.inline-default)[`example`]で始まるtypファイルを編集する

#grid(inset: (x: 1em),)[
  直接編集するか、複製して編集する。
]

= 真円による角丸 vs 緩和曲線による角丸

#running-head([スライドテンプレート使用例], [スライド\ 作成例])

// このスライドで用いるための大きい角丸四角形による吹き出しの定義
#let mpl-bubble-big = create-mpl-bubble(
  type-settings: (line-height: type-settings.default.line-height * 3, font-size: type-settings.default.font-size * 3),
  font-settings: font-settings.strong,
)

#grid(
  columns: (50%, 50%),
  column-gutter: -1em,
  row-gutter: type-settings.default.line-height,
  inset: (x: 1em),
  [
    == #rect(
      width: 100%,
      inset: (type-settings.default.line-height - type-settings.default.font-size) * 4.5,
      radius: (type-settings.default.line-height - type-settings.default.font-size) * 4.5,
      fill: color-presets.blue.at(6),
    )[
      #align(center)[#(mpl.font-strong)(color: color-presets.gray1.at(0))[真円による角丸]]
    ]
  ],
  [
    == #(mpl-bubble-big.block-strong)[#align(center)[緩和曲線による角丸]]
  ],

  [
    #node(<node:真円vs緩和曲線:真円曲率>)[
      - 円弧と直線の接続部分で\ 曲率が#(mpl-bubble.inline-emph)[不連続]に変化する
    ]
    #v(type-settings.default.line-height * 1.5, weak: true)
    #align(center)[#node(<node:真円vs緩和曲線:真円角丸感>)[#(mpl-bubble.emph)[ひっかかりのある角丸]]]
    #v(type-settings.default.line-height, weak: true)
    - 多くのソフトウェアで\ #(mpl-bubble.inline-emph)[簡単に利用可能]
  ],
  [
    #node(<node:真円vs緩和曲線:緩和曲線曲率>)[
      - 直線部分・曲線部分を通して\ 曲率が#(mpl-bubble.inline-emph)[連続]に変化する
    ]
    #v(type-settings.default.line-height * 1.5, weak: true)
    #align(center)[#node(<node:真円vs緩和曲線:緩和曲線角丸感>)[#(mpl-bubble.strong)[なめらかな角丸]]]
    #v(type-settings.default.line-height, weak: true)
    - 多くのソフトウェアで\ 利用時に#(mpl-bubble.inline-emph)[工夫が必要]
  ],
)

#edge(<node:真円vs緩和曲線:真円曲率>, <node:真円vs緩和曲線:真円角丸感>, direction: "tb")[]
#edge(<node:真円vs緩和曲線:緩和曲線曲率>, <node:真円vs緩和曲線:緩和曲線角丸感>, direction: "tb")[]

= Web上の情報システムを可能にする技術

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  rows: (100% - type-settings.default.line-height * 2.26),
  stroke: ((x: q(.5)), (left: q(2), right: q(.5)), (x: q(.5)), (x: q(.5))),
  inset: (x: .25em),
  [
    #node(<node:web:ua>)[
      #align(center)[
        #scale(x: 66%, reflow: true)[== ユーザエージェント]
      ]
      #v(type-settings.default.line-height)
    ]
    #(mpl.type-small)[
      #(mpl-bubble.block-emph)[
        - プレゼンテーション\ 層からのデータを\ ユーザに提示する
        - プレゼンテーション\ 層にユーザの入力\ したデータを送る
      ]
      - SPAの場合は\ JavaScriptが\ JSONを送受信して\ DOMを書き換える。
        #(mpl-bubble.block-default)[
          React、Vue、\ Angularなど
        ]
    ]
  ],
  [
    #node(<node:web:p>)[
      #align(center)[
        #scale(x: 66%, reflow: true)[== プレゼンテーション#(mpl.itype-footnote)[層]]
      ]
      #v(type-settings.default.line-height)
    ]
    #(mpl.type-small)[
      #(mpl-bubble.block-emph)[アプリの状態を\ サーバ外に公開する]
      - *MPA*—HTMLで公開
        #(mpl-bubble.block-default)[
          - JSP/Servlet
        ]
      - *SPA*—JSON等で公開
        #(mpl-bubble.block-default)[
          - Spring
          - Express
          - Fastify
          - Hono
          - Django
          - Ruby on Rails\ など
        ]
    ]
  ],
  [
    #node(<node:web:b>)[
      #align(center)[
        #scale(x: 66%, reflow: true)[== ビジネスロジック#(mpl.itype-footnote)[層]]
      ]
      #v(type-settings.default.line-height)
    ]
    #(mpl.type-small)[
      #(mpl-bubble.block-emph)[アプリの\ モデルを表現する]
      - プレゼンテーション層\ からの呼び出しに\ 応じて、結果の計算や、\ データアクセス層の\ 読み書きなどを行う。
      - 様々な\ プログラミング\ パラダイム、設計論、\ 方法論が用いられる。
    ]
  ],
  [
    #node(<node:web:da>)[
      #align(center)[
        #scale(x: 66%, reflow: true)[== データアクセス#(mpl.itype-footnote)[層]]
      ]
      #v(type-settings.default.line-height)
    ]
    #(mpl.type-small)[
      #(mpl-bubble.block-emph)[アプリの状態を\ 永続化する]
      - *DBMS*
        - *RDBMS*
          #(mpl-bubble.block-default)[
            - PostgreSQL
            - MySQL など
          ]
        - *NoSQL*
          #(mpl-bubble.block-default)[
            - MongoDB など
          ]
      - *オブジェクトストレージ*
        #(mpl-bubble.block-default)[
          - S3 など
        ]
      - *ファイルシステム*
    ]
  ],
)

#edge(
  <node:web:ua>,
  <node:web:p>,
  direction: "lr",
  start-sep: -.5em,
  end-sep: -.5em,
  label-pos: top,
  path-func: tiptoe.path.with(
    tip: straight.with(width: q(40), length: q(40) / calc.sqrt(2)),
    toe: straight.with(width: q(40), length: q(40) / calc.sqrt(2)),
    stroke: stroke(thickness: q(8), paint: color-presets.blue.at(6), dash: "solid", cap: "butt"),
  ),
)[#(mpl-bubble.edge-default)[#(mpl.itype-small)[HTTP]]]

#edge(
  <node:web:p>,
  <node:web:b>,
  direction: "lr",
  start-sep: -.5em,
  end-sep: -.5em,
  label-pos: top,
  path-func: tiptoe.path.with(
    tip: straight.with(width: q(40), length: q(40) / calc.sqrt(2)),
    toe: straight.with(width: q(40), length: q(40) / calc.sqrt(2)),
    stroke: stroke(thickness: q(8), paint: color-presets.blue.at(6), dash: "solid", cap: "butt"),
  ),
)[#(mpl-bubble.edge-default)[#(mpl.itype-small)[関数・メソッド呼び出し]]]

#edge(
  <node:web:b>,
  <node:web:da>,
  direction: "lr",
  start-sep: -.5em,
  end-sep: -.5em,
  label-pos: top,
  path-func: tiptoe.path.with(
    tip: straight.with(width: q(40), length: q(40) / calc.sqrt(2)),
    toe: straight.with(width: q(40), length: q(40) / calc.sqrt(2)),
    stroke: stroke(thickness: q(8), paint: color-presets.blue.at(6), dash: "solid", cap: "butt"),
  ),
)[#(mpl-bubble.edge-default)[#(mpl.itype-small)[RPC、SQLなど]]]

#bibliography("references.bib", style: "libs/ipsj-short-nonumber.csl")
