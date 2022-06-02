<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="{{ .Site.LanguageCode }}" dir="{{ default "ltr" .Language.LanguageDirection }}">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="/rss/channel/title"/> RSS Feed</title>
        {{- $css := resources.Get "scss/style.scss" | resources.ToCSS | minify | resources.Fingerprint "sha256" }}
        <link rel="stylesheet" href="{{ $css.RelPermalink }}" integrity="{{ $css.Data.Integrity }}" crossorigin="anonymous"/>
      </head>
      <body>
        <div class="container main-container flex on-phone--column compact">
          <div class="main full-width">
            <main class="d-contents">
              <section class="article-list">
                <xsl:for-each select="/rss/channel/item">
                  <article>
                    <header class="article-header">
                      <div class="article-details">
                        <header class="article-category">
                          <xsl:for-each select="category">
                            <span><xsl:value-of select="."/></span>
                          </xsl:for-each>
                        </header>
                        <div class="article-title-wrapper">
                          <h2 class="article-title">
                            <a href="">
                              <xsl:attribute name="href">
                                <xsl:value-of select="link"/>
                              </xsl:attribute>
                              <xsl:value-of select="title"/>
                            </a>
                          </h2>
                          <h3 class="article-subtitle"><xsl:value-of select="dc:description"/></h3>
                        </div>
                        <footer class="article-time">
                          <div>
                            {{ partial "helper/icon" "date" }}
                            <time class="article-time--published">
                              <xsl:value-of select="substring(pubDate,5,12)"/>
                            </time>
                          </div>
                        </footer>
                      </div>
                    </header>
                  </article>
                </xsl:for-each>
              </section>
            </main>
            <footer class="site-footer">
              <div class="copyright">
                &#169;
                {{ if and (.Site.Params.footer.since) (ne .Site.Params.footer.since (int (now.Format "2006"))) }}
                {{ .Site.Params.footer.since -}} &#8211;
                {{- end -}}
                {{- now.Format "2006" }} {{ .Site.Params.footer.attribution }}
              </div>
            </footer>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
