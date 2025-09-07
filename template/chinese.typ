#import "../lib.typ": *

#set text(lang: "zh")

#show: ilm.with(
  title: [中文文档模板示例],
  author: "张三",
  date: datetime(year: 2024, month: 03, day: 19),
  date-format: "[year]年[month]月[day]日",
  abstract: [
    这是一个展示 ILM 模板中文支持的示例文档。本模板基于原版 ILM 模板，增加了对中文排版的支持，包括中文字体、字号定义以及相关的排版工具函数。
  ],
  preface: [
    #align(center + horizon)[
      感谢使用这个模板 #emoji.heart,\ 希望您喜欢它 #emoji.face.smile
    ]
  ],
  bibliography: bibliography("refs.bib"),
  figure-index: (enabled: true, title: "插图索引"),
  table-index: (enabled: true, title: "表格索引"),
  listing-index: (enabled: true, title: "程序清单索引"),
)

= 中文支持功能

本模板在原有 ILM 模板基础上增加了完整的中文支持，主要包括以下功能：

== 中文字体支持

模板提供了四种主要的中文字体类型：

- #宋体[宋体]：适用于正文内容，具有衬线特征
- #黑体[黑体]：适用于标题和强调内容，无衬线字体
- #楷体[楷体]：适用于特殊场合，书法风格
- #仿宋[仿宋]：适用于引用和特殊文本

每种字体都包含了完整的中英文混排支持，自动选择合适的英文字体进行搭配。

== 中文字号系统

模板定义了完整的中文字号体系，从初号到小七号：

#table(
  columns: 4,
  table.header[字号名称][大小][字号名称][大小],
  [初号], [#字号.初号], [小四], [#字号.小四],
  [小初], [#字号.小初], [五号], [#字号.五号],
  [一号], [#字号.一号], [小五], [#字号.小五],
  [小一], [#字号.小一], [六号], [#字号.六号],
  [二号], [#字号.二号], [小六], [#字号.小六],
  [小二], [#字号.小二], [七号], [#字号.七号],
  [三号], [#字号.三号], [小七], [#字号.小七],
  [小三], [#字号.小三], [], [],
  [四号], [#字号.四号], [], [],
)

== 使用示例

=== 不同字体和字号的组合

#宋体(size: 字号.三号)[这是三号宋体文本]

#黑体(size: 字号.小二)[这是小二黑体文本]

#楷体(size: 字号.四号)[这是四号楷体文本]

#仿宋(size: 字号.小四)[这是小四仿宋文本]

=== 中文段落缩进

中文段落通常需要首行缩进两个字符。使用 `chinese-indent` 可以实现这一效果：

#chinese-indent 这是一个带有标准中文缩进的段落。中文排版中，段落的首行通常需要缩进两个汉字的宽度，这样可以使文档看起来更加规范和美观。

#chinese-indent 另一个段落的示例。通过使用预定义的缩进函数，可以确保所有段落都具有一致的缩进效果。

=== 代码块的中文注释支持

```python
# 这是中文注释
def hello_world():
    print("你好，世界！")  # 输出中文问候语
    
# 支持中英文混合的注释
def calculate_sum(a, b):
    """计算两个数的和 - Calculate the sum of two numbers"""
    return a + b
```

=== 中英文混排

模板能够很好地处理中英文混排的情况。例如：我们使用 #黑体[Typst] 排版系统来制作这个#楷体[中文文档]，它具有出色的#仿宋[Unicode 支持]和灵活的字体配置功能。

== 表格中的中文内容

#figure(
  caption: [中文表格示例],
  table(
    columns: 3,
    table.header[姓名][年龄][职业],
    [张三], [25], [软件工程师],
    [李四], [30], [产品经理],
    [王五], [28], [UI设计师],
    [赵六], [32], [数据分析师],
  )
)

== 插图示例

模板支持插图的自动编号和索引功能。以下是一个简单的示例图形：

#figure(
  caption: [中文排版流程示意图],
  block(width: 100%, height: 4em, fill: rgb("#f0f8ff"), stroke: 1pt + rgb("#4169e1"), radius: 5pt)[
    #align(center + horizon)[
      #text(size: 14pt, weight: "bold")[输入文档] 
      → #text(size: 14pt, weight: "bold")[字体处理] 
      → #text(size: 14pt, weight: "bold")[排版引擎] 
      → #text(size: 14pt, weight: "bold")[输出PDF]
    ]
  ]
)

== 程序清单示例

除了内联代码，模板还支持完整的程序清单，并能自动生成索引：

#figure(
  caption: [Python 中文处理示例],
  ```python
  # 中文文本处理示例
  import re
  
  def process_chinese_text(text):
      """
      处理中文文本的函数
      参数：text - 输入的中文文本
      返回：处理后的文本
      """
      # 移除多余的空白字符
      text = re.sub(r'\s+', ' ', text.strip())
      
      # 标准化中文标点符号
      punctuation_map = {
          '，': '，',  # 全角逗号
          '。': '。',  # 全角句号
          '？': '？',  # 全角问号
          '！': '！',  # 全角感叹号
      }
      
      for old, new in punctuation_map.items():
          text = text.replace(old, new)
      
      return text
  
  # 使用示例
  sample_text = "你好，世界！这是一个中文处理的例子。"
  processed = process_chinese_text(sample_text)
  print(f"处理结果：{processed}")
  ```
)

另一个展示 Typst 代码的程序清单：

#figure(
  caption: [Typst 中文模板配置],
  ```typst
  // 中文文档配置示例
  #import "@preview/ilm:1.4.1": *
  
  #set text(lang: "zh", font: 字体.宋体)
  
  #show: ilm.with(
    title: [学术论文标题],
    author: "作者姓名",
    fonts: (
      宋体: ("Source Han Serif SC", "SimSun"),
      黑体: ("Source Han Sans SC", "SimHei"),
    ),
    figure-index: (enabled: true, title: "插图索引"),
    table-index: (enabled: true, title: "表格索引"),
    listing-index: (enabled: true, title: "程序清单索引"),
  )
  
  // 使用中文排版工具
  #chinese-indent 这是带有标准缩进的中文段落。
  
  #黑体(size: 字号.小二)[重要提示]
  #宋体[这里是正文内容。]
  ```
)

= 配置说明

== 基本配置

要使用中文支持，请在文档开头设置语言：

```typst
#set text(lang: "zh")
```

== 自定义字体

如果需要使用自定义字体，可以通过 `fonts` 参数传递：

```typst
#show: ilm.with(
  fonts: (
    宋体: ("Custom Song Font", "Source Han Serif SC"),
    黑体: ("Custom Hei Font", "Source Han Sans SC"),
  ),
  // 其他配置...
)
```

== 字体优先级

模板定义的字体具有完整的回退机制：

1. 首先尝试系统中安装的专业中文字体
2. 如果不可用，则使用开源的思源字体系列@source_han_fonts
3. 最后回退到系统默认字体

这确保了文档在不同环境下都能正确显示中文内容。

== 参考文献和引用

模板完全支持中文参考文献的管理和引用。在中文学术写作中，正确的引用格式至关重要@chinese_typography。

=== 引用示例

在现代排版系统中，Unicode 标准为中日韩（CJK）文字提供了统一的编码方案@unicode_cjk。基于这一标准，现代排版工具如 Typst 能够很好地处理中文内容@typst_chinese。

=== 不同类型的文献

模板支持多种类型的中文文献引用：

- 学术期刊文章：@typst_chinese
- 会议论文：@unicode_cjk  
- 专业书籍：@chinese_typography
- 开源项目和网络资源：@source_han_fonts

这些引用将在文档末尾的参考文献部分自动生成完整的书目信息。

#blockquote[
  通过这些功能的集成，ILM 模板现在可以很好地支持中文文档的创作。无论是学术论文、技术文档还是其他类型的中文内容，都可以使用这个模板来获得专业的排版效果。
]