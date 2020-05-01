# XPath

<div align="center">
  <img src="assets/logo.png" width="480">
  <br />
  <div>The <b>best way</b> to <b>locate elements</b> on a <b>webpage</b></div>
  <br />
</div>

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [What is XPath](#what-is-xpath)
- [IntelliJ-Based IDEs](#intellij-based-ides)
  - [XPath Expression Evaluation](#xpath-expression-evaluation)
  - [XPath Expression Generation](#xpath-expression-generation)
  - [XPath Search](#xpath-search)
- [Syntax of XPath](#syntax-of-xpath)
- [Types of XPath](#types-of-xpath)
  - [Absolute XPath](#absolute-xpath)
  - [Relative XPath](#relative-xpath)
- [Chrome DevTools](#chrome-devtools)
  - [Copy Full XPath](#copy-full-xpath)
  - [Copy XPath](#copy-xpath)
  - [Find Elements by XPath](#find-elements-by-xpath)
  - [Evaluate XPath Expressions](#evaluate-xpath-expressions)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## What is XPath

> `XPath` is also called as `XML Path`, a **language** to **query XML documents**.

<br />

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/bookstore.xml) -->
<!-- The below code snippet is automatically added from labs/bookstore.xml -->

```xml
<!-- An example of an XML document where you have different "tags" and "attributes" -->
<!-- Start with a "tag" called the "bookstore", which is also an "element" or a "node" -->
<bookstore>
  <book category="cooking">
    <title lang="en">Everyday Chinese</title>
    <author>K.S.Bose</author>
  </book>
  <book category="children">
    <title lang="en">Harry Potter</title>
    <author>J.K. Rowling</author>
  </book>
</bookstore>
```

<!-- AUTO-GENERATED-CONTENT:END -->

<div align="center">
  <img src="assets/xml-document-tree.png" width="900">
  <br />
  <div>Visualize the XML document in a tree-like structure</div>
  <br />
</div>

<br />

Here is an **XPath query** to locate the `author` of a `book` which `category` is `children`:

```xpath
/bookstore/book[@category='children']/author
```

## IntelliJ-Based IDEs

### [XPath Expression Evaluation](https://www.jetbrains.com/help/idea/xpath-expression-evaluation.html)

> An XPath expression needs evaluation to test it before making structured queries against XML documents.

<br />

```xpath
/bookstore/book[@category='children']/author
```

<div align="center">
  <img src="assets/webstorm-xpath-evaluation.png" width="480">
  <br />
  <div>Action: <b>Evaluate XPath...</b></div>
</div>

<br />

<div align="center">
  <img src="assets/webstorm-xpath-evaluation-outcome.png" width="530">
  <br />
  <div>Matched nodes got highlighted</div>
</div>

<br />

### [XPath Expression Generation](https://www.jetbrains.com/help/idea/xpath-expression-generation.html)

> This action computes a unique XPath expression
> that matches the currently selected node in the document.

<br />

<div align="center">
  <img src="assets/webstorm-xpath-generation.png" width="540">
  <br />
  <div>Action: <b>Unique XPath</b></div>
</div>

<br />

### [XPath Search](https://www.jetbrains.com/help/idea/xpath-search.html)

> Find occurrences of certain XPath expressions in all XML files in a specific scope.

<br />

```xpath
/bookstore/book[@category='children']/author
```

<div align="center">
  <img src="assets/webstorm-xpath-search.png" width="570">
  <br />
  <div>Action: <b>Find by XPath...</b></div>
</div>

<br />

<div align="center"><img src="assets/webstorm-xpath-search-outcome.png" width="610"></div>

<br />

## Syntax of XPath

<div align="center">
  <img src="assets/syntax.png" width="720">
  <br />
  <div>The figure depicts XPath syntax</div>
</div>

<br />
  
|   Terminology   | Description                               |
| :-------------: | ----------------------------------------- |
|    **`//`**     | Used to select the current node.          |
|  **`tagname`**  | The name of the tag of a particular node. |
|     **`@`**     | Used to select attribute.                 |
| **`Attribute`** | The name of the attribute of the node.    |
|   **`Value`**   | The value of the attribute.               |

<br />

## Types of XPath

### Absolute XPath

- **Example**: `/html/body/div[1]/section/div[1]/div`.
- It is the direct way to find the element,
  but the disadvantage of the absolute XPath is that,
  if there are any changes made in the path of the element then that XPath gets failed.

### Relative XPath

- **Example**: `//input[@id='ap_email']`.
- The path starts from the middle of the HTML DOM structure.
  It begins with the double forward-slash (`//`),
  which means it can search the element anywhere at the webpage.

## Chrome DevTools

1. Launch **Google Chrome** and navigate to <https://www.goshopback.vn/>.
1. Try to **Inspect** a random web element.

<div align="center"><img src="assets/chrome-inspect-elements.png" width="900"></div>

<br />

<div align="center"><img src="assets/chrome-copy-tools.png" width="700"></div>

### Copy Full XPath

> Returns an **Absolute XPath**.

```xpath
/html/body/div[1]/div[5]/div/div/div/section/section[7]/section/div/section/div[1]/a/img
```

### Copy XPath

> Returns a **Relative XPath**.

```xpath
//*[@id="home-page-container"]/div/div/section/section[7]/section/div/section/div[1]/a/img
```

<br />

### Find Elements by XPath

- On the `Elements` panel, press `Command-F` to open a **search box**.

<div align="center"><img src="assets/chrome-search-box.png" width="900"></div>

<br />

- Starting with `//`, we will use `img` as a `tagname` and `class` as an `attribute`
  to construct an XPath expression.

```xpath
//img[@class='brand-image']
```

<div align="center">
  <img src="assets/chrome-find-by-xpath.png" width="900">
  <br />
  <div>The located elements are highlighted</div>
</div>

### Evaluate XPath Expressions

`$x(path)` returns an array of DOM elements that match the given XPath expression.

- Select the `Console` tab, and check the XPath by typing `$x("your_xpath_here")`.
  This will return an array of matched values.
  If it is empty, you know there is no match on the page.

```js
$x("//img[@class='brand-image']");
```

<div align="center"><img src="assets/chrome-evaluate-xpath.png" width="900"></div>

## References

- [How to Get Started with XPath in Selenium](https://www.edureka.co/blog/xpath-in-selenium)
- [Xpath in Selenium | Selenium Xpath Tutorial | Selenium Xpath Examples](https://www.youtube.com/watch?v=9-iVt0MIqNY)
- [XPath in Selenium WebDriver](https://www.guru99.com/xpath-selenium.html)
