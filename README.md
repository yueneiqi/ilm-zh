# ‘Ilm

> ‘Ilm (Urdu: عِلْم) is the Urdu term for knowledge. It is pronounced as [/ə.ləm/](https://en.wiktionary.org/wiki/%D8%B9%D9%84%D9%85#Urdu).

A versatile, clean and minimal template for non-fiction writing. The template is ideal for
class notes, reports, and books.

It contains a title page, a table of contents, and indices for different types of figures;
images, tables, code blocks.

Dynamic running footer contains the title of the chapter (top-level heading).

See the [example.pdf](https://github.com/talal/ilm/blob/main/example.pdf) file and the chinese-exmaple.pdf file to see how it looks.

## Usage

You can use this template in the Typst web app by clicking "Start from template" on the
dashboard and searching for `ilm`.

Alternatively, you can use the CLI to kick this project off using the command:

```sh
typst init @preview/ilm
```

Typst will create a new directory with all the files needed to get you started.

The template will initialize your package with a sample call to the `ilm` function in a
show rule. If you, however, want to change an existing project to use this template, you
can add a show rule like this at the top of your file:

```typ
#import "@preview/ilm:1.4.1": *

#set text(lang: "en")

#show: ilm.with(
  title: [Your Title],
  author: "Max Mustermann",
  date: datetime(year: 2024, month: 03, day: 19),
  abstract: [#lorem(30)],
  bibliography: bibliography("refs.bib"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true)
)

// Your content goes below.
```

> [!NOTE]
> This template uses the [Iosevka] font for raw text. In order to use Iosevka,
> the font must be installed on your computer. In case Iosevka is not installed, as will be
> the case for Typst Web App, then the template will fall back to the default "Fira Mono"
> font.

## Chinese Support

This template now includes comprehensive Chinese language support with the following features:

### Chinese Fonts (字体)
- **宋体** (`宋体`): Serif fonts for body text (Times New Roman + Chinese serif fonts)
- **黑体** (`黑体`): Sans serif fonts for headings and emphasis (Arial + Chinese sans fonts) 
- **楷体** (`楷体`): Calligraphic fonts for special occasions
- **仿宋** (`仿宋`): Imitation Song fonts for quotes and special text

### Chinese Font Sizes (字号)
Standard Chinese typography sizes from 初号 (42pt) to 小七 (5pt):
- 初号, 小初, 一号, 小一, 二号, 小二, 三号, 小三, 四号, 中四, 小四, 五号, 小五, 六号, 小六, 七号, 小七

### Usage for Chinese Documents

```typ
#import "@preview/ilm:1.4.1": *

#set text(lang: "zh")  // Set language to Chinese

#show: ilm.with(
  title: [中文文档标题],
  author: "作者姓名",
  date: datetime(year: 2024, month: 03, day: 19),
  abstract: [这是中文摘要的内容...],
  // Custom Chinese font configuration (optional)
  fonts: (
    宋体: ("Custom Song Font", "Source Han Serif SC"),
  ),
  // Chinese index titles
  figure-index: (enabled: true, title: "插图索引"),
  table-index: (enabled: true, title: "表格索引"),
  listing-index: (enabled: true, title: "程序清单索引"),
)

// Use Chinese text utilities
#宋体(size: 字号.小四)[这是小四宋体文本]
#黑体(size: 字号.三号)[这是三号黑体文本]

#chinese-indent 这是带有中文段落缩进的文本。
```

### Font Fallback System
The template includes a robust font fallback system:
1. Professional Chinese fonts (if installed)
2. Open-source fonts (Source Han series, Noto CJK series)
3. System default fonts (SimSun, SimHei, etc.)
4. Fallback to standard Latin fonts (Times New Roman, Arial)

See `template/chinese.typ` for a complete demonstration.

## Configuration

This template exports the `ilm` function with the following named arguments:

| Argument | Default Value | Type | Description |
| --- | --- | --- | --- |
| `title` | `Your Title` | [content] | The title for your work. |
| `author` | `Author` | [content] | A string to specify the author's name |
| `fonts` | `(:)` | [dictionary] | Custom font configuration for Chinese text. Accepts keys: 宋体, 黑体, 楷体, 仿宋, 等宽 |
| `paper-size` | `a4` | [string] | Specify a [paper size string] to change the page size. |
| `date` | `none` | [datetime] | The date that will be displayed on the cover page. |
| `date-format` | `[month repr:long] [day padding:zero], [year repr:full]` | [string] | The format for the date that will be displayed on the cover page. By default, the date will be displayed as `MMMM DD, YYYY`. |
| `abstract` | `none` | [content] | A brief summary/description of your work. This is shown on the cover page. |
| `preface` | `none` | [content] | The preface for your work. The preface content is shown on its own separate page after the cover. |
| `chapter-pagebreak` | `true` | [bool] | Setting this to `false` will prevent chapters from starting on a new page. |
| `external-link-circle` | `true` | [bool] | Setting this to `false` will disable the maroon circle that is shown next to external links. |
| `table-of-contents` | `outline()` | [content] | The result of a call to the [outline function][outline] or none. Setting this to `none` will disable the table of contents. |
| `appendix` | `(enabled: false, title: "Appendix", heading-numbering-format: "A.1.1.", body: none)` | [dictionary] | Setting `enabled` to `true` and defining your content in `body` will display the appendix after the main body of your document and before the bibliography. |
| `bibliography` | `none` | [content] | The result of a call to the [bibliography function][bibliography] or none. Specifying this will configure numeric, IEEE-style citations. |
| `figure-index` | `(enabled: false, title: "Index of Figures")` | [dictionary] | Setting this to `true` will display an index of image figures at the end of the document. |
| `table-index` | `(enabled: false, title: "Index of Tables")` | [dictionary] | Setting this to `true` will display an index of table figures at the end of the document. |
| `listing-index` | `(enabled: false, title: "Index of Listings")` | [dictionary] | Setting this to `true` will display an index of listing (code block) figures at the end of the document. |

The above table gives you a _brief description_ of the different options that you can
choose to customize the template. For a detailed explanation of these options, see the
[example.pdf](https://github.com/talal/ilm/blob/main/example.pdf) file.

The function also accepts a single, positional argument for the body.

> [!NOTE]
> The language setting for text (`lang` parameter of `text` function) should be
> defined before the `ilm` function so that headings such as table of contents and
> bibliography will be defined as per the text language.

[iosevka]: https://typeof.net/Iosevka/
[bibliography]: https://typst.app/docs/reference/model/bibliography/
[outline]: https://typst.app/docs/reference/model/outline/
[bool]: https://typst.app/docs/reference/foundations/bool/
[content]: https://typst.app/docs/reference/foundations/content/
[datetime]: https://typst.app/docs/reference/foundations/datetime/
[dictionary]: https://typst.app/docs/reference/foundations/dictionary/
[paper size string]: https://typst.app/docs/reference/layout/page#parameters-paper
[string]: https://typst.app/docs/reference/foundations/str/
