<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/rss/channel">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="{{ .Site.LanguageCode }}" dir="{{ default "ltr" .Language.LanguageDirection }}">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="description">
          <xsl:attribute name="content">
            <xsl:value-of select="description"/>
          </xsl:attribute>
        </meta>
        <title><xsl:value-of select="title"/> RSS Feed</title>
        <link rel="canonical">
          <xsl:attribute name="href">
            <xsl:value-of select="atom:link/@href"/>
          </xsl:attribute>
        </link>
        <link rel="alternate" type="application/rss+xml" href="."/>
        <link rel="shortcut icon" href="/images/logo-transparent.webp"/>
        {{- $css := resources.Get "scss/style.scss" | resources.ToCSS | minify | resources.Fingerprint "sha256" }}
        <link rel="stylesheet" href="{{ $css.RelPermalink }}" integrity="{{ $css.Data.Integrity }}" crossorigin="anonymous"/>
      </head>
      <body>
        <div class="container main-container flex on-phone--column compact">
          <div class="main full-width">
            <main class="d-contents">
              <div class="feed-header">
                {{ partial "helper/icon" "rss" }}
                <div>
                  <div class="feed-title">
                    {{ partial "helper/icon" "rss" }}
                    <h1><cite>{{ .Site.Title }}</cite> RSS Feed</h1>
                  </div>
                  <div class="feed-text">
                    <p>
                      This is an RSS feed. You can paste this URL into any RSS
                      reader to get new posts from <cite>{{ .Site.Title }}</cite>.
                    </p>
                  </div>
                </div>
              </div>
              <section class="article-list">
                <xsl:for-each select="item">
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
                            <a>
                              <xsl:attribute name="href">
                                <xsl:value-of select="link"/>
                              </xsl:attribute>
                              <xsl:value-of select="title"/>
                            </a>
                          </h2>
                          <h3 class="article-subtitle"><xsl:value-of select="description"/></h3>
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
