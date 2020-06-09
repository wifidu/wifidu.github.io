---
tags: [PHP]
date: 2020-06-05 09:31:29
categories:
- PHP
updated:  2020-06-05 09:31:29
---

# PHP Notes

<!-- vim-markdown-toc Redcarpet -->

* [正则表达式](#正则表达式)

<!-- vim-markdown-toc -->

## 正则表达式

| /i  | (忽略大小写)                 |
|-----|------------------------------|
| /g  | (全文查找出现的所有匹配字符) |
| /m  | (多行查找)                   |
| /gi | (全文查找、忽略大小写)       |
| /ig | (全文查找、忽略大小写)       |

```
mixed preg_replace ( mixed $pattern , mixed $replacement , mixed $subject [, int $limit = -1 [, int &$count ]] )
搜索 subject 中匹配 pattern 的部分， 以 replacement 进行替换。
```

参数说明：

- $pattern: 要搜索的模式，可以是字符串或一个字符串数组。

- $replacement: 用于替换的字符串或字符串数组。

- $subject: 要搜索替换的目标字符串或字符串数组。

- $limit: 可选，对于每个模式用于每个 subject 字符串的最大可替换次数。 默认是-1（无限制）。

- $count: 可选，为替换执行的次数。
