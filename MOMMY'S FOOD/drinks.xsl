<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:xlink="http://www.w3.org/1999/xlink">
<xsl:template match="/">
<html> 
<head>
<style>
  body{
      margin:0px;
  }
  .header{
    background-color: darkslategray;
    color:whitesmoke;
    text-align: center;
    font-family: serif;
    text-transform: capitalize;
    font-size: 17px;
    height: 90px;
  }
  #img{
    margin-left:230px;
    margin-top:40px;
  }
  .p{
      text-align:left;
      color:white;
      font-size:22px;
      font-family:serif;
      font-weight:bold;
  }
  #div1{
     margin-top:-270px;
     margin-left:620px;   
  }
  .div{
    margin-left:230px;
    font-size:20px;
  }
  h2{
      text-transform: capitalize;
      font-family: cursive;
      color: darkred;
      text-shadow: 1px 2px black;
  }
</style>
</head>
<body>
<header class="header">
    <h1 class="h1">mommy's food</h1>
</header>
<img id="img">
    <xsl:attribute name="src">
        <xsl:value-of select="drinks/@src"/>
    </xsl:attribute>
</img>

<div id="div1">
<p class="p">Love fruits?</p>
<p class="p">It's the perfect time to indulge and make</p>
<p class="p">the most of nature's sweet offerings </p>
<p class="p">by shaking up spectacular juices at home</p>
<!-- xpointer link -->
<svg height="100" width="100" xmlns:xlink="http://www.w3.org/1999/xlink">
  <a xlink:href="drinks.xml#beetroot" target="_blank">
    <text style="font-size:16px;" x="0" y="10" fill="blue">Want to see our special drink for this rainy season?</text>
  </a>
</svg>
</div>

<div style="margin-top:100px;background-color:#fff44f;width:920px;" class="div">
<!-- accessing by path, predicate(to access a specific node), attribute-->
<!-- returns a string -->
<h2 id="h4"><xsl:value-of select="drinks/drink[1]/@title"/></h2>  
<h3>Ingredients</h3>
<ol>
<!-- xsl for-each, ingredient is the descendant of drinks[1]-->
  <xsl:for-each select="drinks/drink[1]//ingredient">
  <li><xsl:value-of select="@name"/>
  <span>&#160;&#160;&#160;| unit:&#160;<xsl:value-of select="@amount"/></span>
  <span><xsl:value-of select="@unit"/></span>
  </li>
  </xsl:for-each>
</ol>
<h3>Steps for preparation</h3>
<ul>
  <xsl:for-each select="drinks/drink[1]/prep/step">
  <!-- (. means current node or child::node()) -->
  <!-- returns noteset (all the step nodes)-->
  <li><xsl:value-of select="."/></li>
  </xsl:for-each>
</ul>
<!-- xlink -->
<svg height="100" width="100" xmlns:xlink="http://www.w3.org/1999/xlink">
  <a xlink:href="https://www.allrecipes.com/search/results/?wt=lemon%20shots&amp;sort=re" target="_blank">
    <text style="font-size:16px;" x="0" y="10" fill="blue">Want to see more recipes on it?</text>
  </a>
</svg>
</div>

<div style="background-color:bisque; width:920px;" class="div">
<h2 id="h4"><xsl:value-of select="drinks/drink[2]/@title"/></h2>  
<h3>Ingredients</h3>
<ol>
  <xsl:for-each select="drinks/drink[2]/ingredients/ingredient"> 
  <!-- accessing using node type ( attribute::name = name attribute of each ingredient )-->
  <li><xsl:value-of select="attribute::name"/>
  <span>&#160;&#160;&#160;| unit:&#160;<xsl:value-of select="@amount"/></span>
  <span><xsl:value-of select="@unit"/></span>
  </li>
  </xsl:for-each>
</ol>
<h3>Steps for preparation</h3>
<ul>
  <xsl:for-each select="drinks/drink[2]/prep/step">
  <!-- (accessing by node type ( child::text = text node child of each step node ) -->
  <li><xsl:value-of select="child::text()"/></li>
  </xsl:for-each>
</ul>
<svg height="100" width="100" xmlns:xlink="http://www.w3.org/1999/xlink">
  <a xlink:href="https://www.allrecipes.com/search/results/?wt=apple%20milkshake&amp;sort=re" target="_blank">
    <text style="font-size:16px;" x="0" y="10" fill="blue">Want to see more recipes on it?</text>
  </a>
</svg>
</div>

<!-- xpointer id -->
<div style="background-color:rosybrown; width:920px;" id="beetroot" class="div">
<!-- last(), predicate -->
<h2 id="h4"><xsl:value-of select="drinks/drink[last()]/@title"/></h2>  
<h3>Ingredients</h3>
<ol>
  <xsl:for-each select="drinks/drink[3]/ingredients/ingredient"> 
  <!-- accessing using node type ( attribute::name = name attribute of each ingredient )-->
  <li><xsl:value-of select="attribute::name"/>
  <span>&#160;&#160;&#160;| unit:&#160;<xsl:value-of select="attribute::amount"/></span>
  <span><xsl:value-of select="attribute::unit"/></span>
  </li>
  </xsl:for-each>
</ol>
<h3>Steps for preparation</h3>
<ul>
  <xsl:for-each select="drinks/drink[3]/prep/step">
  <!-- (accessing by node type ( child::text = text node child of each step node ) -->
  <li><xsl:value-of select="child::text()"/></li>
  </xsl:for-each>
</ul>
<svg height="100" width="100" xmlns:xlink="http://www.w3.org/1999/xlink">
  <a xlink:href="https://www.allrecipes.com/search/results/?wt=beetroot&amp;sort=re" target="_blank">
    <text style="font-size:16px;" x="0" y="10" fill="blue">Want to see more beetroot recipes?</text>
  </a>
</svg>
</div>

<div style="margin-bottom:50px;" class="div">
<h3>List of drinks in alpahbetical order</h3>
<ol>
<xsl:for-each select="drinks/drink">
      <xsl:sort select="@title"/>
      <li><xsl:value-of select="@title"/></li>
</xsl:for-each>
</ol>
</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

