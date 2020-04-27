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

### Relative XPath

## XPath Functions

## Element Search using Eclipse

## References

- [How to Get Started with XPath in Selenium](https://www.edureka.co/blog/xpath-in-selenium)
- [Xpath in Selenium | Selenium Xpath Tutorial | Selenium Xpath Examples](https://www.youtube.com/watch?v=9-iVt0MIqNY)
