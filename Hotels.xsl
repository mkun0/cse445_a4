<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Hotel List</title>
        <style>
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid #ddd;
            padding: 8px;
          }
          th {
            background-color: #f2f2f2;
            text-align: left;
          }
        </style>
      </head>
      <body>
        <h2>Hotels Directory</h2>
        <table>
          <tr>
            <th>Hotel ID</th>
            <th>Rating</th>
            <th>Name</th>
            <th>Address</th>
            <th>Nearst Airport</th>
            <th>Phone(s)</th>
          </tr>
          <xsl:for-each select="Hotels/Hotel">
            <tr>
              <td><xsl:value-of select="@HotelID"/></td>
              <td><xsl:value-of select="@Rating"/></td>
              <td><xsl:value-of select="Name"/></td>
              <td>
                <xsl:value-of select="Address/Number"/> 
                <xsl:text> </xsl:text>
                <xsl:value-of select="Address/Street"/>, 
                <xsl:value-of select="Address/City"/>, 
                <xsl:value-of select="Address/State"/> 
                <xsl:value-of select="Address/Zip"/>
              </td>
              <td><xsl:value-of select="Address/@NearstAirport"/></td>
              <td>
                <xsl:for-each select="Phone">
                  <xsl:value-of select="."/>
                  <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
