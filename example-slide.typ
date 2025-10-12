#import "@preview/tiptoe:0.2.0"
#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.4"
#import "libs/diagram/icon.typ": icon
#import "libs/diagram/shape.typ": themed-shape
#import "libs/diagram/node-edge.typ": annotation-node, edge, node, straight
#import "libs/mgn901-paper/common-per-page-bibliography.typ": cite
#import "libs/mgn901-paper/slide-section.typ": set-section
#import "libs/mgn901-paper/slide.typ": slide
#import "libs/mgn901-paper/style.typ": style
#import "libs/mgn901-paper/utils.typ": q
#import "libs/presets/slide.typ": heading-token-params, page-settings, slide-page-tokens, style-tokens as s
#import "libs/slide-frontmatter.typ": slide-frontmatter

// 図解作成用の関数、テンプレートの設定
#let tsd = themed-shape(
  node-style-tokens: (
    s.bg-t1b7-100,
    s.border-0,
    s.rounded-md,
    s.inset-20,
    s.text-t1b7-800,
  ),
  edge-style-tokens: (
    s.border-8,
    s.border-t1b7-600,
    s.text-t1b7-800,
    s.font-semibold,
  ),
  annotation-node-style-tokens: (
    s.border-8,
    s.border-t1b7-600,
    s.bg-white,
    s.rounded-md,
    s.inset-20,
    s.text-t1b7-800,
    s.font-semibold,
  ),
)

#let tsa = themed-shape(
  node-style-tokens: (
    s.bg-t1b7-600,
    s.border-0,
    s.rounded-md,
    s.inset-20,
    s.text-white,
    s.font-semibold,
  ),
)

#let tss = themed-shape(
  node-style-tokens: (
    s.bg-r7y1-100,
    s.border-0,
    s.rounded-md,
    s.inset-20,
    s.text-r7y1-800,
    s.font-medium,
  ),
)

#let tsg = themed-shape(
  node-style-tokens: (
    s.bg-g0-0,
    s.border-2,
    s.border-g0-100,
    s.rounded-md,
    s.inset-20,
    s.text-g0-800,
  ),
)

#let lh(number) = s.text-base.text-size * number + s.text-base.line-spacing * (number + 1)

#show: slide.with(
  document-settings: (lang: "ja"),
  page-settings: page-settings,
  style-tokens: s,
  heading-tokens-params: heading-token-params,
  slide-page-tokens: slide-page-tokens,
)
// 図解作成用の関数、テンプレートの設定 終わり

// 表紙

#slide-frontmatter(
  title: [レポート・論文・スライド組版向け\ Typstテンプレート「mgn901-paper-typ」],
  subtitle: [],
  author: [めがね901\ 個人サークル めがね901#linebreak()https://mgn901.com],
  date: [2025年2月11日],
  title-styler: style.with((s.text-no-justify, s.text-2xl, s.font-sans, s.font-bold)),
  subtitle-styler: style.with((s.text-no-justify, s.text-xl)),
  author-styler: style.with((s.text-no-justify, s.text-lg)),
  text-base-token: s.text-base,
)

// 本文

= 本スライドの構成

#style((s.gap-y-30,))[
  #grid(
    (tss.node)(width: 100%)[1. Typstとは],
    (tss.node)(width: 100%)[2. Typstの導入方法],
    (tss.node)(width: 100%)[3. mgn901-paper-typの利用方法],
    (tss.node)(width: 100%)[4. mgn901-paper-typでのスライドの作り方（後日公開予定）],
  )
]

= Typstテンプレート「mgn901-paper-typ」の特長

#style((s.gap-x-30,), (f, _) => [
  #grid(
    columns: (1fr, 1fr, 1fr),
    rows: (s.text-base.text-size * 14 + s.text-base.line-spacing * 15),
    (tsa.node)(width: 100%, height: 100%)[
      #style((s.gap-x-10, s.inset-0))[
        #grid(
          columns: 2,
          [1.],
          [
            #style((s.text-sm,))[レポート、論文、\ スライドなど]
            #style((s.font-bold,))[多くの媒体の\ 組版に対応]
          ],
        )
      ]
      #(tsd.node)(width: 100%, style-tokens: (s.inset-10, s.rounded-xs, s.text-sm, s.font-medium))[
        - 充実のテンプレート
          - #icon[article] 1段組レポート
          - #icon[news] 1段組論文
          - #icon[view_column_2] 2段組記事
          - #icon[slide_library] スライド
        - 書体、組体裁の設定は\ テンプレート本体と\ 独立していて、\ 簡単に変更可能
      ]
    ],
    (tsa.node)(width: 100%, height: 100%)[
      #style((s.gap-x-10, s.inset-0))[
        #grid(
          columns: 2,
          [2.],
          [
            #style((s.text-sm,))[和文組版向けの設定が\ 最初から適用済み]
            #style((s.font-bold,))[美しい仕上がりを\ 簡単に得られる]
          ],
        )
      ]
      #style((s.bxbg-white, s.inset-0, s.bxrounded-2xs))[
        #box(clip: true)[
          #image("figures/example-article.svg")
        ]
      ]
    ],
    (tsa.node)(width: 100%, height: 100%)[
      #style((s.gap-x-10, s.inset-0))[
        #grid(
          columns: 2,
          [3.],
          [
            #style((s.text-sm,))[読みやすく美しい\ 紙面、画面の作成に役立つ]
            #style((s.font-bold,))[充実した\ 機能、関数]
          ],
        )
      ]
      #(tsd.node)(width: 100%, style-tokens: (s.inset-10, s.rounded-xs, s.text-sm, s.font-medium))[
        - 番号付き見出し
        - 番号付き図表
        - 図表、数式の自動行取り
        - ページ番号の自動挿入
        - スライド用の柱
        - 論文用の目次
        - スライドごとの参考文献の\ 書誌情報の挿入
        - 図解作成用の関数
        - 緩和曲線の角丸矩形
        - 和欧混植時の\ 欧字サイズの調整
      ]
    ],
  )
])

#set-section(title: [], abbr: [Typstとは])

= Typst：レポート、論文、スライド向けの組版エンジン

#style((s.gap-y-40,))[
  #grid(
    columns: (1fr, 4fr / 3, 1fr),
    align: (horizon + center, horizon + center, horizon + center),
    node(<node1>)[
      #(tsd.node)[#icon[docs] 文字や図表]
    ],
    node(<node2>)[
      #(tsa.node)[*#icon[memory] 組版エンジン*\ #style((s.text-sm,))[文字や図表を\ 紙面に配置]]
    ],
    node(<node3>)[
      #(tsd.node)[#icon[picture_as_pdf] PDFファイル #style((s.itext-sm,))[等]]
    ],

    node(<node4>)[
      #(tsd.node)[#icon[data_object] typファイル\ #style((s.text-sm,))[Typst用の\ マークアップ言語]]
    ],
    node(<node5>)[
      #(tsa.node)[*Typst*\ #style((s.text-sm,))[組版エンジン]]
    ],
    node(<node6>)[
      #(tsd.node)[#icon[picture_as_pdf] PDFファイル #style((s.itext-sm,))[等]]
    ],
  )
]

#(tsd.edge)(<node1>, <node2>, label-pos: top)[入力]
#(tsd.edge)(<node2>, <node3>, label-pos: top)[出力]
#(tsd.edge)(<node4>, <node5>, label-pos: top)[入力]
#(tsd.edge)(<node5>, <node6>, label-pos: top)[出力]
#(tsd.annotation-node)(<node7>, <node4>, direction: "tb", y: lh(10))[
  - テキストエディタで\ 編集できる
  - 再利用しやすい
]
#(tsd.annotation-node)(<node8>, <node5>, direction: "tb", y: lh(10))[
  数式組版や\ 相互参照の仕組みが\ 整っている
]

#set-section(title: [Typstの導入方法], abbr: [導入方法])

= 2つの導入方法

#style((s.gap-y-30,))[
  #grid(
    (tss.node)(width: 100%)[
      1. #icon[devices] 自分のPCにインストールして利用する
        - VSCode#style((s.itext-sm,))[（Visual Studio Code）]上で利用する場合の方法を紹介
    ],
    (tss.node)(width: 100%)[
      2. #icon[cloud] typst.app#style((s.itext-sm,))[（Typst Web Application）]上で利用する
    ],
  )
]

= VSCode上で利用する場合の導入方法

#style((s.gap-30,))[
  #grid(
    (tsg.node)(width: 100%)[
      #style((s.gap-20, s.inset-0))[
        #grid(
          columns: (auto, 1fr, 1fr),
          [1.],
          grid.cell(colspan: 2)[== VSCode#style((s.itext-base,))[（テキストエディタ）]をインストールする],
          [],
          (tsd.node)(width: 100%, style-tokens: (s.rounded-xs,))[
            *Windows#style((s.itext-sm,))[（Microsoft Store経由）]*
            #style((s.text-xs,))[https://apps.microsoft.com/detail/xp9khm4bk9fz7q]
          ],
          (tsd.node)(width: 100%, style-tokens: (s.rounded-xs,))[
            *Windows以外*
            #style((s.text-xs,))[https://code.visualstudio.com]
          ],
        )
      ]
    ],

    (tsg.node)(width: 100%)[
      #style((s.gap-20, s.inset-0))[
        #grid(
          columns: (auto, 1fr),
          [2.], [== VSCodeを起動する],
        )
      ]
    ],
    (tsg.node)(width: 100%)[
      #style((s.gap-20, s.inset-0))[
        #grid(
          columns: (auto, 1fr, 1fr),
          [3.],
          grid.cell(colspan: 2)[== 拡張機能をインストールする],
          grid.cell(x: 1)[
            #(tsd.node)(width: 100%, style-tokens: (s.rounded-xs,))[
              *Tinymist Typst#style((s.text-sm,))[（Typstが同梱されている）]*
              #style((s.text-xs,))[https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist]
            ]
          ],
          grid.cell(x: 2)[
            #(tsd.node)(width: 100%, style-tokens: (s.rounded-xs,))[
              *vscode-pdf#style((s.text-sm,))[（VSCodeでPDFを閲覧できる）]*
              #style((s.text-xs,))[https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf]
            ]
          ],
        )]
    ],
  )
]

= typst.appでtypファイルを編集する

#style((s.gap-30,))[
  #grid(
    (tsg.node)(width: 100%)[
      #style((s.gap-20, s.inset-0))[
        #grid(
          columns: (auto, 1fr),
          [1.], [== #link("https://typst.app/app")[typst.app/app]にアクセスしてログインする],
        )
      ]
    ],
    (tsg.node)(width: 100%)[
      #style((s.gap-20, s.inset-0))[
        #grid(
          columns: (auto, 1fr),
          [2.], [== Projectを作成して開く],
          grid.cell(x: 1)[
            - typst.appでは、\ typファイルのまとまりを*Project*として管理する。
            - typst.appを開くと表示されるDashboardで、\ Projectを作成したり開いたりして、編集を始める。
          ],
        )
      ]
    ],
  )
]

#set-section(title: [mgn901-paper-typの利用方法], abbr: [利用方法])

= mgn901-paper-typ #cite(<mgn901:mgn901-paper-typ>) とは

#v(lh(1), weak: true)
- Typstの #node(<node1>)[#box[#(tsd.node)(style-tokens: (s.inset-0, s.outset-5, s.rounded-xs))[テンプレート]]]
#(tsd.annotation-node)(<node2>, <node1>, direction: "lr", x: 12em)[
  印刷物の体裁を調整するための\ 命令だけが書かれたtypファイル
]
#v(lh(1), weak: true)
- 和文組版のために調整
#v(lh(1), weak: true)

#align(center)[
  #(tsa.node)[
    #align(start)[
      - 追加の調整不要
      - 見た目はテンプレートに任せて、内容だけを意識して作業
      - 美しく読みやすい和文のレポート、論文、スライドを作成可能
    ]
  ]
]

= mgn901-paper-typを利用して\ レポート・論文・スライドの作成をはじめる

#style((s.gap-30,))[
  #grid(
    (tsg.node)(width: 100%)[
      #style((s.gap-20, s.inset-0))[
        #grid(
          columns: (auto, 1fr),
          [1.], [== mgn901-paper-typのzipファイルをダウンロードする],
        )
      ]
    ],
    (tsg.node)(width: 100%)[
      #style((s.gap-20, s.inset-0))[
        #grid(
          columns: (auto, 1fr),
          [2.], [== typファイルを保存するためのフォルダに展開する],
        )
      ]
    ],
    (tsg.node)(width: 100%)[
      #style((s.gap-20, s.inset-0))[
        #grid(
          columns: (auto, 1fr),
          [3.], [== 名前が`example`で始まるtypファイルを編集する],
          grid.cell(x: 1)[
            - 直接編集するか、複製して編集する。
          ],
        )
      ]
    ],
  )
]

// 本文 終わり

#bibliography("references.bib", style: "libs/ipsj-short-nonumber.csl")
