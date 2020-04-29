# XPath

<div align="center">
  <img src="assets/logo.png" width="480">
  <br />
  <div>The <b>best</b> way to <b>locate elements</b> on a <b>web page</b></div>
  <br />
</div>

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [What is XPath](#what-is-xpath)
- [XML Document](#xml-document)
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
  - [Find by XPath](#find-by-xpath)
- [XPath Functions](#xpath-functions)
  - [`contains()`](#contains)
  - [`starts-with()`](#starts-with)
  - [`text()`](#text)
- [Element Search using Eclipse](#element-search-using-eclipse)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## What is XPath

> **`XPath`** also called as **XML Path** is a language to query XML documents.

- It consists of a path expression along with some conditions.
- It is designed to allow the navigation of XML documents,
  with the purpose of selecting individual elements, attributes,
  or some other part of an XML document for specific processing.
- It also produces reliable locators.

## XML Document

This is an example of an XML document where you have different tags and attributes.
It starts with a tag called the `bookstore`, which is also an element or a node.

<!-- AUTO-GENERATED-CONTENT:START (CODE:src=labs/bookstore.xml) -->
<!-- The below code snippet is automatically added from labs/bookstore.xml -->

```xml
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

<br />

Now, let's visualize this XML document in a tree-like structure.

<div align="center"><img src="assets/xml-document.png" width="900"></div>

<br />

This is an XPath query to locate the `author` of a `book` whose `category` is `children`:

```xpath
bookstore/book[@category='children']/author
```

## IntelliJ-Based IDEs

### XPath Expression Evaluation

### XPath Expression Generation

### XPath Search

## Syntax of XPath

Below figure depicts XPath Syntax and its terminology.

<div align="center"><img src="assets/syntax.png" width="720"></div>

- **`//`**: It is used to select the current node.
- **`tagname`**: It is the name of the tag of a particular node.
- **`@`**: It is used to select attribute.
- **`Attribute`**: It is the name of the attribute of the node.
- **`Value`**: It is the value of the attribute.

## Types of XPath

### Absolute XPath

- Example: `/html/body/div[1]/section/div[1]/div`.
- It is the direct way to find the element,
  but the disadvantage of the absolute XPath is that,
  if there are any changes made in the path of the element then that XPath gets failed.

### Relative XPath

- Example: `//input[@id='ap_email']`.
- For Relative XPath, the path starts from the middle of the HTML DOM structure.
  It begins with the double forward slash (`//`),
  which means it can search the element anywhere at the webpage.

## Chrome DevTools

1. Launch **Google Chrome** and navigate to <https://www.goshopback.vn/>.
1. Try to **inspect** a random web element.

<div align="center"><img src="assets/shopback-inspect-elements.png" width="900"></div>

<br />

<div align="center"><img src="assets/shopback-copy-tools.png" width="700"></div>

### Copy Full XPath

> Returns absolute XPath.

```xpath
/html/body/div[1]/div[5]/div/div/div/section/section[7]/section/div/section/div[1]/a/img
```

### Copy XPath

> Returns relative XPath.

```xpath
//*[@id="home-page-container"]/div/div/section/section[7]/section/div/section/div[1]/a/img
```

### Find by XPath

- On the `Elements` panel, press `Command-F` to open a **search box**.

<div align="center"><img src="assets/shopback-search-box.png" width="900"></div>

<br />

- Start with `//`, we will use `img` as a `tagname` and `class` as an `attribute`
  to construct an XPath expression.

```xpath
//img[@class='brand-image']
```

<div align="center"><img src="assets/shopback-find-by-xpath.png" width="900"></div>

Now, I will use the name attribute and pass `'q'` in single quotes as its value.
This gives XPath expression as below:

```xpath
//input[@name='q']
```

<div align="center"><img src="assets/Xpath-google.png" width="800"></div>

As you can see in the above image,
on writing the XPath it has highlighted the element
which implies that this particular element was located using XPath.

## XPath Functions

Automation using Selenium is definitely a great technology
that provides many ways to identify an object or element on the web page.
But sometimes we do face problems in identifying the objects on a page
which have the same attributes.
Some of such cases can be
elements having the same attributes and names
or having more than one button with the same name and ids.
In such cases, it's challenging to instruct selenium to identify a particular object on a web page
and this is where XPath functions come to our rescue.

Selenium is comprised of various functions.
Below, I have listed down three of the most widely used functions.

### `contains()`

It is a method used in an XPath expression.
When the value of any attribute changes dynamically
e.g. login information, this method comes into use.
It can locate a web element with the available partial text.
Let me show you how to use `contains()` method.

<div align="center"><img src="assets/contains.png" width="800"></div>

I will again open google.com and choose a <img> tag to inspect its element tab.
So what's next?

As you can see in the above source code snippet,
it has a <img> tag, followed by its attributes.
Now let's say, I want to locate its src attribute using XPath.
In order to do this, I will start with // followed by input tag,
then I will use the select attribute, followed by its attribute name src.
Finally, I will copy and paste the value of src.
But by doing this, our XPath will become too lengthy.

And, this is one of the biggest reasons for constructing a partial XPath query.
As an src attribute contains the URL in its value,
there are chances that its value or some part of the URL might change while you reload the page.
So the bottom line here is, a part of the attribute value is static while the rest is dynamic,
in such cases, we generally prefer using partial XPath.

XPath query looks like:

```xpath
//img[contains(@src,'content')]
```

Now let's, move further and understand a few more XPath functions.

### `starts-with()`

This function is used to find a web element whose value of an attribute changes on the refresh
or on any other dynamic operation on the web page.
In this, we match the starting text of the attribute
to locate an element whose attribute has changed dynamically.

For Example: On the web page,
ID of a particular element changes dynamically such as ‘id1’, ‘id2’, ‘id3’, etc.,
but the remaining text will be the same.

Let's now try demonstrating it using the same object.
Here, instead of contains(), you have to change it to starts-with().

<div align="center"><img src="assets/starts-with.png" width="800"></div>

As you can see in the figure src attribute starts with https.
It will locate the elements that start with https.
Thus, this is how starts-with function is used to locate a particular element on the webpage.

XPath query looks like:

```xpath
//img[starts-with(@src,'https')]
```

Now let's understand one more function text().

### `text()`

This expression is used with the text function to locate an element with exact text.
Let's see a small example to use text().

<div align="center"><img src="assets/text.png" width="800"></div>

Here my condition is –

“go anywhere inside this document, irrespective of the tag,
but, it must contain a text whose value is Search Google or type a URL”.

The asterisk(\*) implies any tag with the same value. This give me an XPath query that looks like:

```xpath
//*[text()='Search Google or type a URL']
```

This is how you can use text() function.
Now let's try to use two functions i.e. contains() and text() together in one XPath query.

<div align="center"><img src="assets/two-fnctions.png" width="800"></div>

As you can see in the above snippet, first I have used contains(),
and passed the first argument as text().
Now, text() should hold a value Search Google or type a URL.
As you might notice, I have not used @ because the text() is a function
and not an attribute.
This is how you can use two XPath functions together.

In the next section of this article,
we will see how to register the drivers for chrome
and how to send keys to search element using Eclipse.

## Element Search using Eclipse

For google chrome, you need to install a chrome driver in your system.
Now let's take a closer look at the code.
As you can see, I have used System.setproperty() to set the path of chrome driver.
Then I am using driver.get() to navigate to ebay.com.
Further, using the XPath I am locating search box of the webpage.
Now, using sendkeys(), I will be sending the search value as Guitar
to redirect to the particular search page.

```java
package Edureka;
import java.util.concurrent.TimeUnit;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
public class CustomXpath {
public static void main(String[] args) {
System.setProperty("webdriver.chrome.driver", "C:Selenium-java-edurekachromedriver_win32chromedriver.exe");
WebDriver driver = new ChromeDriver();
driver.manage().window().maximize();
driver.manage().deleteAllCookies();
driver.manage().timeouts().pageLoadTimeout(40, TimeUnit.SECONDS);
driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
driver.get("<a href="https://www.ebay.com/">https://www.ebay.com/</a>");
driver.findElement(By.xpath("//input[@id='gh-ac']")).sendKeys("Guitar"); //xpath for search box
WebElement searchIcon = driver.findElement(By.xpath("//input[@id='gh-btn']"));//xpath for search button
searchIcon.click();
}
}
```

When you run the above Java program,
chrome driver will launch Google Chrome and redirect to ebay.com
and provide you the preferred search automatically.
You can refer below image for the output:

<div align="center"><img src="assets/sendkeys.png" width="900"></div>

I hope this gives you a clear understanding of how XPath in Selenium works.
Thus, it brings us to the end of this article.

If you wish to learn Selenium and build a career in the testing domain,
then check out our interactive, live-online Selenium Certification Training here,
that comes with 24\*7 support to guide you throughout your learning period.

Got a question for us? Please mention it in the comments section of XPath in Selenium blog
and we will get back to you.

## References

- [How to Get Started with XPath in Selenium](https://www.edureka.co/blog/xpath-in-selenium)
- [Xpath in Selenium | Selenium Xpath Tutorial | Selenium Xpath Examples](https://www.youtube.com/watch?v=9-iVt0MIqNY)
- [XPath and XSLT Support](https://www.jetbrains.com/help/idea/xpath-and-xslt-support.html)
