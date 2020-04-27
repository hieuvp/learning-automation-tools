# XPath

> If you wish to know the easiest way to locate elements on the webpage,
> then you have landed at the perfect place.
> The best way to locate elements in selenium is using XPath.
> In this article on XPath in Selenium,
> I will give you a brief insight on
> how to create the right and effective XPath along with its various types.

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [What is XPath](#what-is-xpath)
- [XML Document](#xml-document)
- [Syntax of XPath](#syntax-of-xpath)
- [Types of XPath](#types-of-xpath)
  - [Absolute XPath](#absolute-xpath)
  - [Relative XPath](#relative-xpath)
- [XPath Functions](#xpath-functions)
  - [Types of XPath Functions](#types-of-xpath-functions)
    - [`contains()`](#contains)
    - [`starts-with()`](#starts-with)
    - [`text()`](#text)
- [Element Search using Eclipse](#element-search-using-eclipse)
- [References](#references)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## What is XPath

XPath also called as XML Path is a language to query XML documents.
It is an important strategy to locate elements in selenium.
It consists of a path expression along with some conditions.
Here, you can easily write XPath script/query to locate any element in the webpage.
It is designed to allow the navigation of XML documents,
with the purpose of selecting individual elements, attributes,
or some other part of an XML document for specific processing.
It also produces reliable locators.

Now, let's understand how to write an XPath for an XML Document.

## XML Document

The XML document has a tree-like structure.
Below figure is an example of an XML document where you have different tags and attributes.
It starts with a tag called the bookstore, which is also an element or a node.

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

As you can see here, the Bookstore node has a child node Book.
It is further followed by an attribute called category whose value is Cooking.
And this book node, in turn, has 2 child nodes i.e. Title and Author.
Now, let's visualize this XML document in a tree-like structure.
Here, the book store is a root node which has 2 children of type book.
Category of 1st book type is cooking and 2nd is children.
As you can see in the below figure, both have 2 tags i.e. title and author.

<div align="center"><img src="assets/xml-document.png" width="900"></div>

Here, I will start with the root node i.e. book store,
then I will locate a book whose category is children.
Once I reach the correct node,
the next step will be to pick a node with an author tag.
So XPath can be written like:

```xpath
bookstore/book[@category='children']/author
```

This is an XPath query to locate the author of a book whose category is children.
Now let's understand the syntax of the XPath query.

## Syntax of XPath

Below figure depicts XPath Syntax and its terminology.

<div align="center"><img src="assets/xpath.png" width="900"></div>

- **`//`**: It is used to select the current node.
- **`tagname`**: It is the name of the tag of a particular node.
- **`@`**: It is used to select to select attribute.
- **`Attribute`**: It is the name of the attribute of the node.
- **`Value`**: It is the value of the attribute

In the next section of this XPath in Selenium article,
I will be talking about different types of XPath with the help of some practical examples.

## Types of XPath

There are two types of XPath and they are:

1. Absolute XPath
1. Relative XPath

First, let's understand Absolute XPath.

### Absolute XPath

It is the direct way to find the element,
but the disadvantage of the absolute XPath is that,
if there are any changes made in the path of the element then that XPath gets failed.
For example: `/html/body/div[1]/section/div[1]/div`

### Relative XPath

For Relative XPath, the path starts from the middle of the HTML DOM structure.
It begins with the double forward slash (//),
which means it can search the element anywhere at the webpage.
For example: `//input[@id='ap_email']`

Now, let's understand this with the help of an example.
I will launch Google Chrome and navigate to google.com.
Here, I will try to locate the search bar using XPath.
On inspecting the web element you can see it has an input tag and attributes like class and id.
Now, I will use the tag name and these attributes to construct XPath
which in turn will locate the search bar.

<div align="center"><img src="assets/google-xpath.png" width="800"></div>

Here, you just have to click Elements tab
and press Ctrl + F to open a search box in chromes developers tool.
Next, you can write XPath, string selector and it will try to search based on that criteria.
As you can see in the above image, it has an input tag.

Now I will start with // input. Here //input implies tagname.
Now, I will use the name attribute and pass ‘q’ in single quotes as its value.
This gives XPath expression as below:

```xpath
//input[@name=’q’]
```

<div align="center"><img src="assets/Xpath-google.png" width="800"></div>

As you can see in the above image,
on writing the XPath it has highlighted the element
which implies that this particular element was located using XPath.

Now, let's move ahead with this XPath in Selenium article
and understand different functions used in Selenium.

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

### Types of XPath Functions

Selenium is comprised of various functions.
Below, I have listed down three of the most widely used functions:

1. `contains()`
1. `starts-with()`
1. `text()`

First, I will tell you how `contains()` function is being used in XPath query.

#### `contains()`

#### `starts-with()`

#### `text()`

## Element Search using Eclipse

## References

- [How to Get Started with XPath in Selenium](https://www.edureka.co/blog/xpath-in-selenium)
- [Xpath in Selenium | Selenium Xpath Tutorial | Selenium Xpath Examples](https://www.youtube.com/watch?v=9-iVt0MIqNY)
