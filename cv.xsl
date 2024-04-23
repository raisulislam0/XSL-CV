<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Define global styles -->
  <xsl:template match="/">
    <html>
      <head>
        <title>CV of Raisul Islam</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            margin: 20px auto;
            max-width: 1030px;
            line-height: 1.6;
            color: #333;
          }
          h1 {
            text-align: center;
            color: #007acc;
          }
          .section {
            margin-bottom: 30px;
          }
          .section h2 {
            border-bottom: 2px solid #007acc;
            padding-bottom: 5px;
            color: #007acc;
          }
          .section table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
          }
          .section table th, .section table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
          }
          .section table th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h1>Curriculum Vitae of Raisul Islam</h1>

        <!-- Personal Info Section -->
        <div class="section">
          <h2>Personal Information</h2>
          <xsl:apply-templates select="cv/personal_info"/>
        </div>

        <!-- Education Section -->
        <div class="section">
          <h2>Education Background</h2>
          <xsl:apply-templates select="cv/education"/>
        </div>

        <!-- Work Experience Section -->
        <div class="section">
          <h2>Work Experience</h2>
          <xsl:apply-templates select="cv/work_experience"/>
        </div>

        <!-- Programming Skills and Languages Section -->
        <div class="section">
          <h2>Programming Skills and Languages</h2>
          <table>
            <tr>
              <!-- Programming Skills -->
              <td>
                <table>
                  <tr>
                    <th>Programming Skills</th>
                  </tr>
                  <xsl:apply-templates select="cv/programming_skills/skill"/>
                </table>
              </td>
              <!-- Languages -->
              <td>
                <table>
                  <tr>
                    <th>Languages</th>
                  </tr>
                  <xsl:apply-templates select="cv/language_skills/language"/>
                </table>
              </td>
            </tr>
          </table>
        </div>

        <!-- References Section -->
        <div class="section">
          <h2>References</h2>
          <ul>
            <xsl:apply-templates select="cv/references/referee"/>
          </ul>
        </div>

      </body>
    </html>
  </xsl:template>

  <!-- Template for Personal Info -->
  <xsl:template match="personal_info">
    <ul>
      <li><strong>Name:</strong> <xsl:value-of select="name"/></li>
      <li><strong>Address:</strong> <xsl:value-of select="address"/></li>
      <li><strong>Phone:</strong> <xsl:value-of select="phone"/></li>
      <li><strong>Email:</strong> <xsl:value-of select="email"/></li>
    </ul>
  </xsl:template>

  <!-- Template for Education -->
  <xsl:template match="education">
    <table>
      <tr>
        <th>Degree</th>
        <th>University/School</th>
        <th>Year</th>
      </tr>
      <xsl:for-each select="degree">
        <tr>
          <td><xsl:value-of select="title"/></td>
          <td><xsl:value-of select="university | school"/></td>
          <td><xsl:value-of select="year"/></td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <!-- Template for Work Experience -->
  <xsl:template match="work_experience">
    <table>
      <tr>
        <th>Title</th>
        <th>Company</th>
        <th>Year</th>
        <th>Description</th>
      </tr>
      <xsl:for-each select="position">
        <tr>
          <td><xsl:value-of select="title"/></td>
          <td><xsl:value-of select="company"/></td>
          <td><xsl:value-of select="year"/></td>
          <td><xsl:value-of select="description"/></td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <!-- Template for Programming Skills and Languages -->
  <xsl:template match="skill | language">
    <tr>
      <td><xsl:value-of select="."/></td>
    </tr>
  </xsl:template>

  <!-- Template for References -->
  <xsl:template match="referee">
    <li><xsl:value-of select="name"/></li>
  </xsl:template>

</xsl:stylesheet>
