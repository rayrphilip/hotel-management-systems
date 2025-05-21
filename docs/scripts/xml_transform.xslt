<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html>
        <head>
<title>Guest Check-In Procedure</title>
<style>
  body { font-family: Arial, sans-serif; margin: 40px; }
  h1 { color: #2c3e50; }
  h2 { color: #34495e; }
  .step { margin-bottom: 20px; }
  .step-title { font-weight: bold; color: #2980b9; }
  .notes { background-color: #f9f9f9; padding: 10px;
  border-left: 4px solid #3498db; }
  a { color: #2980b9; text-decoration: none; }
</style>
</head>
<body>
  <h1><xsl:value-of select="/sop/title"/></h1>
  <h2>Description</h2>
  <p><xsl:value-of select="/sop/description"/></p>
  <h2>Scope</h2>
  <p><xsl:value-of select="/sop/scope"/></p>
  <h2>Procedure</h2>
  <xsl:for-each select="/sop/procedure/step">
      <div class="step">
          <p class="step-title"><xsl: value-of select="title"/></p>
          <p><xsl:apply-templates select="instruction"/></p>
      </div>
  <xsl:for-each>
  <h2>Notes</h2>
  <div class="notes">
      <xsl:for-each select="/sop/notes/note">
        <p><xsl:apply-templates select="."/></p>
      </xsl:for-each>
  <div>
</body>
</html>
</xsl:template>

<xsl:template match="b">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>

    <xsl:template match="i">
        <em><xsl:apply-templates/></em>
    </xsl:template>

    <xsl:template match="email">
        <a href="mailto:{.}"><xsl:value-of select="."/></a>
    </xsl:template>
</xsl:stylesheet>
