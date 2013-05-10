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

<xsl:variable name="version">1.0.4</xsl:variable>

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
	<!--
	<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
		<link rel="prerender" href="{$root}/{@id}/{description/@handle}/" />
		<link rel="prefetch" href="{$root}/{@id}/{description/@handle}/" />
	</xsl:for-each>
	<meta http-equiv="x-dns-prefetch-control" content="on" />

	<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
		<link rel="prerender" href="{$root}/{@id}/{description/@handle}/" />
		<link rel="prefetch" href="{$root}/{@id}/{description/@handle}/" />
	</xsl:for-each>
	-->
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
<!--   <div class="navbar main navbar-inverse visible-desktop">
    <div class="navbar-inner">
      <div class="container">
        <div>
          <form class="navbar-search pull-left" action="get">
            <xsl:call-template name="form-search-action" />
            <a>
              <xsl:call-template name="url-search-home" />
              <span class="icon">s</span>
            </a>
            <input name="keywords" type="text" class="search-query" placeholder="Search" autocomplete="off" onclick="this.select()" />
          </form>
          <ul class="nav pull-right">
            <xsl:if test="$cookie-username">
              <li class="admin-menu">
                <a href="#" data-toggle="dropdown"><i class="glyphicon-wrench"></i></a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="/symphony/">Symphony</a>
                  </li>
                  <li>
                    <a href="?debug">Debug</a>
                  </li>
                  <xsl:if test="not($pt1 = 'toolkit')">
                    <li>
                      <a>
                        <xsl:attribute name="href">
                          <xsl:choose>
                            <xsl:when test="$pt1">
                              <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/', $pt1, '/')" />
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/',//tags-all-entries/entry[tag/@handle = 'home']/@id , '/')" />
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:attribute>
                        <xsl:text> Edit Page</xsl:text>
                      </a>
                    </li>
                  </xsl:if>
                  <li>
                    <a href="{$root}/symphony/logout/">Logout</a>
                  </li>
                </ul>
              </li>
            </xsl:if>
          </ul>
        </div>
      </div>
    </div>
  </div> -->

<!--   <xsl:if test="$cookie-username">
    <ul class="nav">
      <li class="admin-menu">
        <a href="#" data-toggle="dropdown"><i class="glyphicon-wrench"></i></a>
        <ul class="dropdown-menu">
          <li>
            <a href="/symphony/">Symphony</a>
          </li>
          <li>
            <a href="?debug">Debug</a>
          </li>
          <xsl:if test="not($pt1 = 'toolkit')">
            <li>
              <a>
                <xsl:attribute name="href">
                  <xsl:choose>
                    <xsl:when test="$pt1">
                      <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/', $pt1, '/')" />
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/',//tags-all-entries/entry[tag/@handle = 'home']/@id , '/')" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <xsl:text> Edit Page</xsl:text>
              </a>
            </li>
          </xsl:if>
          <li>
            <a href="{$root}/symphony/logout/">Logout</a>
          </li>
        </ul>
      </li>
    </ul>
  </xsl:if> -->

  <div class="navbar mobile navbar-inverse hidden-desktop">
<!--     <form class="navbar-search pull-left" action="get">
      <xsl:call-template name="form-search-action" />
      <a>
        <xsl:call-template name="url-search-home" />
        <span class="icon">s</span>
      </a>
      <input name="keywords" type="text" class="search-query" placeholder="Search" autocomplete="off" onclick="this.select()" />
    </form> -->
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
					<h4><a href="http://twitter.com/atheycreek/" target="_blank">Recently on Twitter</a></h4>
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
							<a href="https://www.facebook.com/pages/Athey-Creek-Christian-Fellowship/138279749547289">Visit us on Facebook</a>
              <xsl:text> | </xsl:text>
              <a href="#">Follow us on Twitter</a>
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