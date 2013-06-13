<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding="UTF-8"
	method="xml"
	omit-xml-declaration="yes"
	indent="no"
	/>

<xsl:variable name="version">1.0.7</xsl:variable>

<xsl:template name="template-head">
  <link rel="stylesheet" href="{$workspace}/themes/active/css/common.css?v={$version}" />
	<xsl:comment><![CDATA[[if IE 7]> <link rel="stylesheet" href="/workspace/themes/active/css/ie7.css" /> <![endif]]]></xsl:comment>
	<link rel="canonical" href="{$current-url}" />
	<xsl:choose>
		<xsl:when test="number($pt1) and $pt1 = 20 and $pt3 or number($pt1) and $pt1 = 20 and $pt3">
			<link rel="shorturl" href="http://accf.co/{$pt3}" />
			<link rel="shortlink" href="http://accf.co/{$pt3}" />
		</xsl:when>
		<xsl:otherwise>
			<link rel="shorturl" href="http://accf.co/{$pt1}" />
			<link rel="shortlink" href="http://accf.co/{$pt1}" />
		</xsl:otherwise>
	</xsl:choose>
	<link rel="dns-prefetch" href="{$root}" />

	<script type="text/javascript" src="//use.typekit.net/opz2qoe.js"></script>
  <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
  <script type="text/javascript" src="{$workspace}/themes/active/export/combined.js?v={$version}"></script>
  <script>
  	<xsl:comment>
    var _gaq=[['_setAccount',''],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
    g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
    s.parentNode.insertBefore(g,s)}(document,'script'));
  	</xsl:comment>
	</script>

</xsl:template>

<xsl:template name="template-header-outside-container">
  <div class="alerts">
    <xsl:comment><![CDATA[[if lt IE 9]> <div class="alert alert-error">
        <div class="container">
            <p>For the best experience on our site download a modern browser:
              <a href="https://www.google.com/chrome/">Google Chrome &#8594;</a>
            </p>
        </div>
      </div> <![endif]]]></xsl:comment>
    <xsl:call-template name="alerts" />
  </div>

  <div class="navbar mobile navbar-inverse hidden-desktop">
    <div class="navbar-inner">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>
        <div class="nav-collapse">
          <ul class="nav">
            <xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
              <xsl:call-template name="subnav-entry" />
            </xsl:for-each>
          </ul>
        </div>

    </div>
  </div>

  <div class="header mast" id="overview">
    <div class="container">
      <div class="row">
        <div class="span12">
          <a href="{$root}" class="logo mask standard">
            <span>e</span>
          </a>
          <ul class="main visible-desktop">
            <xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
              <xsl:call-template name="subnav-entry" />
            </xsl:for-each>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <xsl:if test="not($pt1) or $pt1 = 43">
    <xsl:value-of select="normalize-space(//misc-all-entries/entry[name='tagline']/content)" disable-output-escaping="yes" />
    <div class="welcome">
      <div class="container">
        <div class="row">
          <div class="span4 info-box">
            <h3 class="center"><a href="{$root}/13925/about-jon-micah/">About Jon Micah</a></h3>
            <div class="center">
              <img data-responsimage="jonmicahbio_small-517af915d481c.jpg" class="img-circle center" width="200px" height="200px" data-responsimage-anchor="5" src="/workspace/img/spacer.gif" />
            </div>
            <p>Jon Micah Sumrall is the lead singer of <a href="http://kutless.com/">Kutless</a> and the visionary behind EOTA. He has a passion for sharing Christ with an upcoming generation.</p>
            <div class="center link-bar">
              <a href="{$root}/13925/about-jon-micah/" class="link link-small">Read More &#8594;</a>
            </div>
          </div>
          <div class="span4 info-box">
            <h3 class="center"><a href="{$root}/13923/connect/">Latest From Twitter</a></h3>
            <div class="center">
              <span class="icon mask">B</span>
            </div>
            <div class="tweet">
              <xsl:for-each select="//twitter-latest-entry/entry[position() &lt; 2]">
                <p>
                  <xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
                  <xsl:text>&#160;&#160;</xsl:text>
                  <strong>
                    <xsl:call-template name="format-date">
                      <xsl:with-param name="date" select="date/date/start/@iso" />
                      <xsl:with-param name="format" select="'%d;'" />
                    </xsl:call-template>
                    <xsl:text>&#160;</xsl:text>
                    <xsl:call-template name="format-date">
                      <xsl:with-param name="date" select="date/date/start/@iso" />
                      <xsl:with-param name="format" select="'%m-;'" />
                    </xsl:call-template>
                    <xsl:text>&#160;</xsl:text>
                    <xsl:call-template name="format-date">
                      <xsl:with-param name="date" select="date/date/start/@iso" />
                      <xsl:with-param name="format" select="'%y+;'" />
                    </xsl:call-template>
                  </strong>
                </p>
              </xsl:for-each>
              <div class="center link-bar">
                <a href="{$root}/13923/connect/" class="link link-small">Connect With Us &#8594;</a>
              </div>
            </div>
          </div>
          <div class="span4 info-box">
            <h3 class="center"><a href="{$root}/13924/donate/">Support EOTA</a></h3>
            <div class="center">
              <span class="logo mask">E</span>
            </div>
            <p>What drives EOTA is a firm belief in the Scriptures and the support of Jesus followers who want to see this generation transformed by the Gospel.</p>
            <div class="center link-bar">
              <a href="{$root}/13924/donate/" class="link link-small">Donate &#8594;</a>
            </div>
          </div>
        </div>
      </div>
    </div>

  </xsl:if>

</xsl:template>




<xsl:template name="template-header-inside-container">

	<xsl:variable name="parent" select="//tags-all-entries/entry[@id = $pt1]/parent/item/@id" />

	<xsl:if test="$pt1 and not($pt1 = //tags-all-entries/entry[tag/@handle = 'home']/@id)">
		<div class="subnavs">
			<xsl:for-each select="//tags-all-entries/entry[@id = $pt1]/parent/item/@id">
				<xsl:call-template name="nav-tier" />
			</xsl:for-each>
			<xsl:call-template name="subnav-group">
				<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $pt1 and not(hide-from-header = 'Yes')]" />
			</xsl:call-template>
		</div>

		<div class="subnav-mobile hidden-desktop">
			<xsl:for-each select="//tags-all-entries/entry[@id = $pt1]/parent/item/@id">
				<xsl:call-template name="nav-tier-mobile" />
			</xsl:for-each>
			<xsl:call-template name="subnav-mobile">
				<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $pt1 and not(hide-from-header = 'Yes')]" />
			</xsl:call-template>
		</div>

	</xsl:if>

</xsl:template>


<xsl:template name="nav-tier">

	<xsl:variable name="node" select="." />

	<xsl:for-each select="//tags-all-entries/entry[@id = $node]/parent/item/@id">
		<xsl:call-template name="nav-tier" />
	</xsl:for-each>
	<xsl:call-template name="subnav-group">
		<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $node and not(hide-from-header = 'Yes')]" />
	</xsl:call-template>

</xsl:template>

<xsl:template name="nav-tier-mobile">

	<xsl:variable name="node" select="." />

	<xsl:for-each select="//tags-all-entries/entry[@id = $node]/parent/item/@id">
		<xsl:call-template name="nav-tier-mobile" />
	</xsl:for-each>
	<xsl:call-template name="subnav-mobile">
		<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $node and not(hide-from-header = 'Yes')]" />
	</xsl:call-template>

</xsl:template>


<xsl:template name="template-footer-inside-container">

	<div class="footer">
		<div class="footer-nav container">
			<div class="row">
				<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='footer']/content)" disable-output-escaping="yes" />
				<div class="span4 twitter">
					<h4><a href="http://twitter.com/eotaministries/" target="_blank">Recently on Twitter</a></h4>
					<ul>
					<xsl:for-each select="//twitter-latest-entry/entry">
						<li>
							<xsl:attribute name="class">
								<xsl:text>entry</xsl:text>
								<xsl:if test="position() = 1">
									<xsl:text> first</xsl:text>
								</xsl:if>
								<xsl:if test="position() = last()">
									<xsl:text> last</xsl:text>
								</xsl:if>
							</xsl:attribute>
							<xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
							<xsl:text>&#160;&#160;</xsl:text>
							<strong>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/date/start/@iso" />
									<xsl:with-param name="format" select="'%d;'" />
								</xsl:call-template>
								<xsl:text>&#160;</xsl:text>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/date/start/@iso" />
									<xsl:with-param name="format" select="'%m-;'" />
								</xsl:call-template>
								<xsl:text>&#160;</xsl:text>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/date/start/@iso" />
									<xsl:with-param name="format" select="'%y+;'" />
								</xsl:call-template>
							</strong>
						</li>
					</xsl:for-each>
					</ul>
				</div>
			</div>
		</div>
		<div class="baseline">
			<div class="container">
				<div class="row">
					<div class="span12 center">
						<div class="facebook">
							<a href="http://www.facebook.com/EOTAMinistries">Visit us on Facebook</a>
              <xsl:text> | </xsl:text>
              <a href="http://twitter.com/eotaministries">Follow us on Twitter</a>
						</div>

						<div class="copyright">
              <xsl:choose>
                <xsl:when test="$this-year = 2013">
                  <xsl:text>&#xa9;&#160;</xsl:text>
                  <xsl:value-of select="$this-year" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>&#xa9;&#160;2013–</xsl:text>
                  <xsl:value-of select="$this-year" />
                </xsl:otherwise>
              </xsl:choose>
              <xsl:text>. </xsl:text>
							<a href="{$root}">
                <xsl:value-of select="$website-name" />
              </a>
							<xsl:text>. All&#160;rights&#160;reserved. </xsl:text>
						</div>
						<div class="churchdeploy">
							<a href="http://churchdeploy.github.com/">a <strong>Church Deploy</strong> install</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</xsl:template>


<xsl:template name="template-column-right-top"></xsl:template>


<xsl:template name="template-footer-outside-container">

</xsl:template>


</xsl:stylesheet>