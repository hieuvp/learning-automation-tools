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
  - [`Absolute XPath`](#absolute-xpath)
  - [`Relative XPath`](#relative-xpath)
- [Chrome DevTools](#chrome-devtools)
  - [`Copy Full XPath`](#copy-full-xpath)
  - [`Copy XPath`](#copy-xpath)
  - [Find Elements by XPath](#find-elements-by-xpath)
  - [Evaluate XPath Expressions](#evaluate-xpath-expressions)
- [XPath Functions](#xpath-functions)
  - [`contains(haystack, needle)`](#containshaystack-needle)
  - [`starts-with(haystack, needle)`](#starts-withhaystack-needle)
  - [`text()`](#text)
  - [Combining Functions](#combining-functions)
- [Demo: Selenium ChromeDriver](#demo-selenium-chromedriver)
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

<div align="center">
  <img src="assets/webstorm-xpath-search-outcome.png" width="610">
  <br />
  <div>The results are shown in <b>Usage View</b></div>
</div>

<br />

## Syntax of XPath

<div align="center">
  <img src="assets/syntax.png" width="720">
  <br />
  <div>The figure depicts XPath syntax</div>
  <br />
</div>

<br />

|   Terminology   | Explanation                               |
| :-------------: | ----------------------------------------- |
|    **`//`**     | To select the current node.               |
|  **`tagname`**  | The name of the tag of a particular node. |
|     **`@`**     | To select attribute.                      |
| **`Attribute`** | The name of the attribute of the node.    |
|   **`Value`**   | The value of the attribute.               |

<br />

## Types of XPath

### `Absolute XPath`

- **An Example**: `/html/body/div[1]/section/div[1]/div`.
- A direct way to find the element,
  but the disadvantage of the **Absolute XPath** is that,
  if there are any changes made in the path of the element then that XPath gets failed.

### `Relative XPath`

- **An Example**: `//input[@id='ap_email']`.
- The path starts in the middle of an HTML DOM structure,
  it begins with the **double forward-slash** (**`//`**),
  which means it can search the element anywhere in a webpage.

<br />

## Chrome DevTools

<div align="center"><img src="assets/chrome-inspect-elements.png" width="900"></div>
<br />

1. Launch **Google Chrome** and navigate to <https://www.goshopback.vn/>.
1. Try to **Inspect** a random **Element**.

<br />
<div align="center"><img src="assets/chrome-copy-tools.png" width="680"></div>

### `Copy Full XPath`

> Return an **Absolute XPath**.

```xpath
/html/body/div[1]/div[5]/div/div/div/section/section[6]/section/div/section/div[1]/a/img
```

### `Copy XPath`

> Return a **Relative XPath**.

```xpath
//*[@id="home-page-container"]/div/div/section/section[6]/section/div/section/div[1]/a/img
```

- The asterisk (**`*`**) here implies any **tagname**.

<br />

### Find Elements by XPath

<div align="center">
  <img src="assets/chrome-search-box.png" width="900">
  <br />
  <div>On the <b>Elements</b> panel, press <b>Command-F</b> to open a <b>Search Box</b></div>
</div>

<br />

```xpath
//img[@class='brand-image']
```

<div align="center">
  <img src="assets/chrome-find-by-xpath.png" width="900">
  <br />
  <div>The located elements are highlighted</div>
</div>

<br />

### Evaluate XPath Expressions

> **`$x(path)`** returns an array of DOM elements
> that match the given XPath expression.

<br />

```js
$x("//img[@class='brand-image']");
```

<div align="center">
  <img src="assets/chrome-evaluate-xpath.png" width="900">
  <br />
  <div>On the <b>Console</b> tab</div>  
</div>

<br />

## XPath Functions

### `contains(haystack, needle)`

> Determine whether
> the first argument `haystack` contains the second argument `needle`
> and returns `true` or `false`.

<br />

```xpath
//img[contains(@src,'shopily-vn')]
```

<div align="center">
  <img src="assets/xpath-contains.png" width="900">
  <br />
  <div>Locating a web element with <b>partial text</b></div>
</div>

<br />

### `starts-with(haystack, needle)`

> Check whether
> the first string `haystack` starts with the second string `needle`
> and returns boolean `true` or `false`.

<br />

```xpath
//img[starts-with(@src,'https')]
```

<div align="center">
  <img src="assets/xpath-starts-with.png" width="900">
  <br />
  <div>Locating elements that <b>start with</b> <em>"https"</em></div>
</div>

<br />

### `text()`

> Return text value of a specific node.

<br />

```xpath
//*[text()='Made with love by']
```

<div align="center">
  <img src="assets/xpath-text-match.png" width="900">
  <br />
  <div>
    Irrespective of tagname, the element must have a text whose value is
    <em>"Made with love by"</em>
  </div>
  <br />
</div>

<br />

```xpath
//*[text()='Made with love']
```

<div align="center">
  <img src="assets/xpath-text-no-match.png" width="900">
  <br />
  <div>Not an <del><b>exact text</b></del> match</div>
</div>

<br />

### Combining Functions

```xpath
//*[contains(text(), 'Made with love')]
```

> We don't use **`@`** because **`text()`** is a **function** and not an **~~attribute~~**.

<br />

<div align="center">
  <img src="assets/xpath-two-functions.png" width="900">
  <br />
  <div>Using two functions together in one XPath query</div>
</div>

<br />

## Demo: Selenium ChromeDriver

We will need to install a
[**ChromeDriver**](https://github.com/giggio/node-chromedriver)
into our system:

```shell script
npm --global install chromedriver
```

<br />

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/ebay/package.json) -->
<!-- The below code snippet is automatically added from labs/ebay/package.json -->

```json
{
  "name": "ebay",
  "version": "1.0.0",
  "license": "MIT",
  "dependencies": {
    "selenium-webdriver": "3.6.0",
    "sleep": "6.1.0"
  }
}
```

<!-- AUTO-GENERATED-CONTENT:END -->

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/ebay/index.js) -->
<!-- The below code snippet is automatically added from labs/ebay/index.js -->

```js
const { Builder, By } = require("selenium-webdriver");
const { sleep } = require("sleep");

(async function main() {
  const driver = await new Builder().forBrowser("chrome").build();

  driver.manage().window().setSize(1280, 720);
  driver.manage().deleteAllCookies();

  try {
    // Navigate to ebay.com
    await driver.get("https://www.ebay.com");

    // By using XPath, we are able to locate the search box,
    // and "sendKeys()" to search for a value of "DevOps"
    await driver.findElement(By.xpath("//input[@id='gh-ac']")).sendKeys("DevOps");

    // Hit the "Search" button to redirect to the results page
    await driver.findElement(By.xpath("//input[@id='gh-btn']")).click();

    sleep(5);
  } finally {
    driver.quit();
  }
})();
```

<!-- AUTO-GENERATED-CONTENT:END -->

<br />

```shell script
cd labs/ebay && npm install
node .
```

<div align="center">
  <img src="assets/ebay-results.png" width="900">
  <br />
  <div>
    <b>ChromeDriver</b> will launch <b>Google Chrome</b> and redirect to
    <a href="https://www.ebay.com/">ebay.com</a>
  </div>
  <div>Providing the preferred search automatically</div>
</div>

<br />

## References

- [How to Get Started with XPath in Selenium](https://www.edureka.co/blog/xpath-in-selenium)
- [Xpath in Selenium | Selenium Xpath Tutorial | Selenium Xpath Examples](https://www.youtube.com/watch?v=9-iVt0MIqNY)
- [XPath in Selenium WebDriver](https://www.guru99.com/xpath-selenium.html)
- [XPath Functions - MDN](https://developer.mozilla.org/en-US/docs/Web/XPath/Functions)
- [XPath Functions - Way2tutorial](https://www.way2tutorial.com/xml/xpath-functions.php)
