<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h2>My CD Collection</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Title</th>
      <th style="text-align:left">Artist</th>
    </tr>
    <tr>
      <td><xsl:value-of select="category/cd/title"/></td>
      <td><xsl:value-of select="category/cd/artist"/></td>
    </tr>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

